 # -*- coding: utf-8 -*-
from twisted.internet.protocol import DatagramProtocol
from twisted.internet import task
from twisted.internet import reactor
from c2w.main.lossy_transport import LossyTransport
from c2w.main import constants
import logging

logging.basicConfig()
import sys
sys.path.insert(0, '../package/')
import functionallani as fc
import constants as cst
import movies as mv
moduleLogger = logging.getLogger('c2w.protocol.udp_chat_server_protocol')

users = {}
Movielist = []
#dictionnaire users
#chaque utilisateur est identifié par son couple (IP, port) = host_port
#contient un dictionnaire ["sequence", "waitingToSendMovies", "waitingToSendUsers", "count", "locationId"]


class c2wUdpChatServerProtocol(DatagramProtocol):

    def __init__(self, serverProxy, lossPr):
        """
        :param serverProxy: The serverProxy, which the protocol must use
            to interact with the user and movie store (i.e., the list of users
            and movies) in the server.
        :param lossPr: The packet loss probability for outgoing packets.  Do
            not modify this value!
from twisted.internet import task
from twisted.internet import reactor
        Class implementing the UDP version of the client protocol.

        .. note::
            You must write the implementation of this class.

        Each instance must have at least the following attribute:

        .. attribute:: serverProxy

            The serverProxy, which the protocol must use
            to interact with the user and movie store in the server.

        .. attribute:: lossPr

            The packet loss probability for outgoing packets.  Do
            not modify this value!  (It is used by startProtocol.)

        .. note::
            You must add attributes and methods to this class in order
            to have a working and complete implementation of the c2w
            protocol.
        """
        #: The serverProxy, which the protocol must use
        #: to interact with the server (to access the movie list and to
        #: access and modify the user list).

        #print(constants.ROOM_IDS.MOVIE_ROOM)

        self.serverProxy = serverProxy
        self.lossPr = lossPr


    def createMovieList(self):
        global Movielist
        Movielist = []
        mlist = self.serverProxy.getMovieList()
        for k in mlist :
            name = k.movieTitle
            identif = k.movieId
            newMovie = mv.Movies(name,identif)
            Movielist.append(newMovie)




    def updateMovieList(self):
        global Movielist
        global users

        movieIdlists =[]
        for usr in users:
            if users[usr]["locationId"] not in movieIdlists and users[usr]["locationId"] != 0 :
                movieIdlists.append(users[usr]["locationId"])

        for k in Movielist:
            if k.id in movieIdlists:
                k.streaming = True
                self.serverProxy.startStreamingMovie(k.name)
            else:
                k.streaming = False
                self.serverProxy.stopStreamingMovie(k.name)




    def startProtocol(self):
        """
        DO NOT MODIFY THE FIRST TWO LINES OF THIS METHOD!!

        If in doubt, do not add anything to this method.  Just ignore it.
        It is used to randomly drop outgoing packets if the -l
        command line option is used.
        """
        self.transport = LossyTransport(self.transport, self.lossPr)
        DatagramProtocol.transport = self.transport

    #Cette fonction a pour role d'envoyer les message, elle permet egalement de gerer le compte des envois
    def startAckTimer(self, towrite, host_port):
        self.transport.write(towrite, host_port)

        #on compte le nombre d'envois
        users[host_port]["count"] += 1
        if(users[host_port]["count"]>=cst.MAX_NUMBER_OF_RESEND):
            users[host_port]["timeOut"].stop()
            users[host_port]["wait"] = False

    #Cette fonction sert a ajouter un message a la liste des messages a envoyer
    def addToSendingList(self, towrite, host_port):
        users[host_port]["listToSend"].append(towrite)

    #Cette fonction renvoit le towrite pour la liste des utilisateurs
    def getListUsers(self, host_port):
        #On envoie la liste des utilisateurs, mise en forme cf functionallani
        Ids = []
        lfUserName = []
        
        for user in users:
            if(not users[user]["userName"] == "notAUser"):
                lfUserName.append(users[user]["userName"])
                Ids.append(users[user]["locationId"])

        #+2 car c'est le deuxieme message que l'on met dans la liste
        seq = users[host_port]["sequenceNumberSend"]+2
        towrite = fc.encode_universel(seq,cst.LISTE_UTILISATEURS,fc.encode_user(Ids, lfUserName))

        return towrite

    #REtourne le message avec la liste des films
    def getListMovies(self, host_port):
        #On envoie la liste des films (il s'agit d'une mise en forme cf functionallani)
        lfIpAddr = []
        lfPortNumber = []
        Ids = []
        lfMovieName = []
             
        for k in self.serverProxy.getMovieList():
            lfIpAddr.append([int(t) for t in k.movieIpAddress.split(".")])
            lfPortNumber.append(k.moviePort)
            Ids.append(k.movieId)
            lfMovieName.append(k.movieTitle)
                
        seq = users[host_port]["sequenceNumberSend"]+1
        towrite = fc.encode_universel(seq,cst.LISTE_FILMS,fc.encode_movie(lfIpAddr,lfPortNumber, Ids, lfMovieName))
        return towrite

    #Retourne le message d'inscription pour un userName donnee
    def getMessageInscription(self, host_port, message):
        userName = message.decode("utf-8")
        isOk = False
                
        #On vérifie que le user n'est pas trop long
        if(len(userName)>cst.MAX_SIZE_USER_NAME):
            towrite = fc.encode_universel(users[host_port]["sequenceNumberSend"],cst.INSCRIPTION_REFUSEE,fc.encode_inscription_refusee(2))
        else:
            #On vérifie que le user ne contient pas d'espaces
            if(" " in userName):
                towrite = fc.encode_universel(users[host_port]["sequenceNumberSend"],cst.INSCRIPTION_REFUSEE,fc.encode_inscription_refusee(3))
            else:
                #On vérifie que le user n'est pas déjà utilisé
                if(self.serverProxy.getUserByName(userName)==None):
                    isOk = True
                    #On update le userName du currentUser
                    users[host_port]["userName"] = userName
                            
                    #on ajoute l'utilisateur
                    self.serverProxy.addUser(userName, constants.ROOM_IDS.MAIN_ROOM)
                    #puis on envoie le message
                    towrite = fc.encode_inscription_acceptee(users[host_port]["sequenceNumberSend"])
                else:
                    #on envoie le message d'erreur
                    towrite = fc.encode_universel(users[host_port]["sequenceNumberSend"],cst.INSCRIPTION_REFUSEE,fc.encode_inscription_refusee(1))
        return (isOk, towrite)

    #Retourne la liste des messages a envoyer, pour tous les utilisateurs concernes par le message recu
    def redirMessage(self, host_port, message):
        listSend = []
        message = message.decode("utf-8")
        for userHostPort in users:
            if(not users[userHostPort]["userName"] == "notAUser" and users[userHostPort]["userName"] != users[host_port]["userName"]):
                roomToSend = self.serverProxy.getUserByName(users[host_port]["userName"]).userChatRoom
                userRoom = self.serverProxy.getUserByName(users[userHostPort]["userName"]).userChatRoom
                #Si ils sont dans la meme chatroom, on transfert le message a cet user
                if(roomToSend == userRoom):
                    towrite = fc.encode_universel(users[userHostPort]["sequenceNumberSend"],cst.REDIR_MESSAGE_INSTANTANE,fc.encode_redirection(users[host_port]["userName"],message))

                    listSend.append((userHostPort, towrite))
        return listSend

    def nextMessage(self):
        for user in users:
            if not len(users[user]["listToSend"]) == 0 and not users[user]["wait"]:
                users[user]["count"] = 0
                send = users[user]["listToSend"].pop()

                users[user]["timeOut"] = task.LoopingCall(self.startAckTimer, send, user)
                users[user]["timeOut"].start(cst.TIME_BEFORE_RESEND)
                users[user]["sequenceNumberSend"]+=1
                users[user]["wait"] = True


    def isNewUser(self, host_port):
        if(not host_port in users):
            users[host_port] = {"sequenceNumberSend": 1, "wait":False, "sequenceNumberReceived": 1, "count": 0, "locationId": 0, "timeOut": "", "listToSend": [], "TheEnd" : False}

    def majClients(self, host_port, idRoom):
        liste = []
        for user in users:
            if(not users[user]["userName"] == "notAUser"):
                if user == host_port:
                    seq = users[host_port]["sequenceNumberSend"]+3
                else:
                    seq = users[user]["sequenceNumberSend"]

                if(idRoom == constants.ROOM_IDS.MAIN_ROOM):
                    idRoom = 0

                liste.append([user, fc.encode_universel(seq, cst.MISE_A_JOUR_UTILISATEUR, fc.encode_single_usermaj(idRoom, users[host_port]["userName"]))])
        return liste

    def isMovieIdInList(self, id):
        isIn = False
        for movie in self.serverProxy.getMovieList():
            if movie.movieId == id:
                isIn = True
        return isIn


    def datagramReceived(self, datagram, host_port):
        """
        :param string datagram: the payload of the UDP packet.
        :param host_port: a touple containing the source IP address and port.

        Twisted calls this method when the server has received a UDP
        packet.  You cannot change the signature of this method.
        """
        
        #Tout d'abord, si on ne connait pas l'utilisateur, on l'ajoute a la liste
        self.isNewUser(host_port)
        

        #DEBUG
        """print("R:"+str(users[host_port]["sequenceNumberReceived"])+";S:"+str(users[host_port]["sequenceNumberSend"]))
        print(fc.decode_universel(datagram))"""
        

        #On récupère les informations du datagram de façon pratique
        global Movielist
        info = fc.decode_universel(datagram)
        sequence = info[1]
        type = info[2]
        message = info[3]
        userTokill = []

        self.createMovieList()
        self.updateMovieList()



        #Toutes ces conditions servent juste a gerer les differents ca de fiabilite avec les numeros de sequence
        if (sequence == users[host_port]["sequenceNumberReceived"] and not type == cst.ACK)  or (type == cst.ACK and sequence == (users[host_port]["sequenceNumberSend"]-1)):
            #On traite des acuittements
            if(type!=cst.ACK):
                towrite = fc.encode_acquittement(users[host_port]["sequenceNumberReceived"])
                self.transport.write(towrite, host_port)
                users[host_port]["sequenceNumberReceived"]+=1  
            else:
                #On incrémente le compteur à la réception de l'ack  
                users[host_port]["timeOut"].stop()
                users[host_port]["wait"] = False  



            #---Type = INSCRIPTION
            #On fait tout le cycle d'inscription
            if(type==cst.INSCRIPTION):
                #---LE MESSAGE D'INSCRIPTION
                (isOk, towrite) = self.getMessageInscription(host_port, message)   
                self.addToSendingList(towrite, host_port)

                if(isOk):
                    #---ENVOIE DE LA LISTE DES FILMS
                    towrite = self.getListMovies(host_port)             
                    self.addToSendingList(towrite, host_port)
                

                    #---ENVOIE DE LA LISTE DES USERS
                    towrite = self.getListUsers(host_port)             
                    self.addToSendingList(towrite, host_port)

                    #---ENVOIE DE MISE A JOUR A TOUS LES CLIENTS
                    #seq = users[host_port]["sequenceNumberSend"]+3

                    data = self.majClients(host_port, constants.ROOM_IDS.MAIN_ROOM)
                    for k in data:
                        port = k[0]
                        towrite = k[1]
                        users[port]["listToSend"].append(towrite)

                    #Puis on inverse la liste pour qu'on la pop dans le bon ordre et qu'on fasse un FIFO
                    users[host_port]["listToSend"].reverse()
                else:
                    users[host_port]["userName"] = "notAUser"
                
                
            
            #---MESSAGE_INSTANTANEE => REDIR_MESSAGE
            if type == cst.MESSAGE_INSTANTANE:
                towrite = self.redirMessage(host_port, message)  
                #On recupere tous les messages a envoyers
                for k in towrite:

                    toSend = k[0]
                    mess = k[1]
                    self.addToSendingList(mess, toSend)


            #Type = JOIN_ROOM
            if (type == cst.JOINDRE_SALON):
                id = fc.decode_join_salon(message)[0]

                if(self.isMovieIdInList(id) or id == 0):
                    towrite = fc.encode_join_salon_OK(users[host_port]["sequenceNumberSend"])
                    users[host_port]["locationId"] = id
                else:
                    towrite = fc.encode_join_salon_NOK(users[host_port]["sequenceNumberSend"])
                self.addToSendingList(towrite, host_port)

                #On envoie une mise a jour de salle a tous les utilisateurs
                for user in users:
                    if user == host_port:
                        seq = users[host_port]["sequenceNumberSend"]+1
                    else:
                        seq = users[user]["sequenceNumberSend"]

                    towrite = fc.encode_universel(seq, cst.MISE_A_JOUR_UTILISATEUR, fc.encode_single_usermaj(id, users[host_port]["userName"]))
                    users[user]["listToSend"].append(towrite)
                users[host_port]["listToSend"].reverse()

            #---DESINSCRIPTION
            if(type == cst.DESINSCRIPTION):
                id = 127
                #On envoie une mise a jour de salle a tous les utilisateurs
                for user in users:
                    towrite = fc.encode_universel(users[user]["sequenceNumberSend"], cst.MISE_A_JOUR_UTILISATEUR, fc.encode_single_usermaj(id, users[host_port]["userName"]))
                    if(not users[user]["userName"] == users[host_port]["userName"]):
                        users[user]["listToSend"].append(towrite)
                    else:
                        users[user]["listToSend"].append(towrite)
                users[host_port]["TheEnd"] = True
                

             #---On envoie le premier message de la file d'attente pour chaque user
            #Cette partie sert à voir si on doit supprimer un utilisateur ou non
            for user in users:
                if users[user]["TheEnd"] == True and users[user]["wait"] == False and users[user]["listToSend"] ==[] :
                    userTokill.append(user)

            for k in userTokill:
                self.serverProxy.removeUser(users[k]["userName"])
                users.pop(k)
            self.nextMessage()


            


        else:
            if not type==cst.ACK:
                seq = users[host_port]["sequenceNumberReceived"]-1
                towrite = fc.encode_acquittement(seq)
                self.transport.write(towrite, host_port)



        pass