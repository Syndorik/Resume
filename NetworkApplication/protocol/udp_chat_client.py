# -*- coding: utf-8 -*-
from twisted.internet.protocol import DatagramProtocol
from twisted.internet import task
from twisted.internet import reactor
from c2w.main.lossy_transport import LossyTransport
from c2w.main import constants
from time import *
from math import *
import struct
import logging
import sys
sys.path.insert(0, '../package/')
import functionallani as fc
import constants as cst
import server as sv

logging.basicConfig()
moduleLogger = logging.getLogger('c2w.protocol.udp_chat_client_protocol')


###################################
#        VARIABLES GLOBALES       #
###################################
sequenceNumberSend = 1
sequenceNumberReceived = 1


class c2wUdpChatClientProtocol(DatagramProtocol):

    def __init__(self, serverAddress, serverPort, clientProxy, lossPr):
        """
        :param serverAddress: The IP address (or the name) of the c2w server,
            given by the user.
        :param serverPort: The port number used by the c2w server,
            given by the user.
        :param clientProxy: The clientProxy, which the protocol must use
            to interact with the Graphical User Interface.

        Class implementing the UDP version of the client protocol.

        .. note::
            You must write the implementation of this class.

        Each instance must have at least the following attributes:

        .. attribute:: serverAddress

            The IP address of the c2w server.

        .. attribute:: serverPort

            The port number of the c2w server.

        .. attribute:: clientProxy

            The clientProxy, which the protocol must use
            to interact with the Graphical User Interface.

        .. attribute:: lossPr

            The packet loss probability for outgoing packets.  Do
            not modify this value!  (It is used by startProtocol.)

        .. note::
            You must add attributes and methods to this class in order
            to have a working and complete implementation of the c2w
            protocol.
        """

        #: The IP address of the c2w server.
        self.serverAddress = serverAddress
        #: The port number of the c2w server.
        self.serverPort = serverPort
        #: The clientProxy, which the protocol must use
        #: to interact with the Graphical User Interface.
        self.clientProxy = clientProxy
        self.lossPr = lossPr
        self.timeOut = ""
        self.count = 0
        
        self.listMovies = []
        self.listUsers = []

        self.userName = ""

    def startProtocol(self):
        """
        DO NOT MODIFY THE FIRST TWO LINES OF THIS METHOD!!

        If in doubt, do not add anything to this method.  Just ignore it.
        It is used to randomly drop outgoing packets if the -l
        command line option is used.
        """
        self.transport = LossyTransport(self.transport, self.lossPr)
        DatagramProtocol.transport = self.transport

    #Cette fonction ne gère que l'envoi de donné au serveur suite au clique sur login
    #La reception et le traitement de cette réponse se fait via datagramReceived()
    def startAckTimer(self, towrite):        
        self.transport.write(towrite, (self.serverAddress, self.serverPort))

        #on compte le nombre d'envois
        self.count += 1
        if(self.count>=cst.MAX_NUMBER_OF_RESEND):
            self.timeOut.stop()

    def sendLoginRequestOIE(self, userName):
        """
        :param string userName: The user name that the user has typed.

        The client proxy calls this function when the user clicks on
        the login button.
        """
        global sequenceNumberSend
        self.userName = userName
        towrite = fc.encode_universel(sequenceNumberSend,cst.INSCRIPTION,fc.encode_inscription(userName))

        #On démarre le timer
        #Une fois le timer (1s) écoulé, on réenvoie l'info et on relance le timer
        #Au bout de 10 fois, on abandonne
        self.timeOut = task.LoopingCall(self.startAckTimer, towrite)
        self.timeOut.start(cst.TIME_BEFORE_RESEND)

        self.incrementSequenceNumber()

    def incrementSequenceNumber(self):
        global sequenceNumberSend
        sequenceNumberSend +=1

    def sendChatMessageOIE(self, message):
        """
        :param message: The text of the chat message.
        :type message: string

        Called by the client proxy  when the user has decided to send
        a chat message

        .. note::
           This is the only function handling chat messages, irrespective
           of the room where the user is.  Therefore it is up to the
           c2wChatClientProctocol or to the server to make sure that this
           message is handled properly, i.e., it is shown only by the
           client(s) who are in the same room.
        """       
        global sequenceNumberSend
        towrite = fc.encode_universel(sequenceNumberSend,cst.MESSAGE_INSTANTANE,fc.encode_message_instantane(message))
        
        self.timeOut = task.LoopingCall(self.startAckTimer, towrite)
        self.timeOut.start(cst.TIME_BEFORE_RESEND)
        
        self.incrementSequenceNumber()
        pass

    def sendJoinRoomRequestOIE(self, roomName):
        """
        :param roomName: The room name (or movie title.)

        Called by the client proxy  when the user
        has clicked on the watch button or the leave button,
        indicating that she/he wants to change room.

        .. warning:
            The controller sets roomName to
            c2w.main.constants.ROOM_IDS.MAIN_ROOM when the user
            wants to go back to the main room.
        """

        global sequenceNumberSend
        if(roomName == constants.ROOM_IDS.MAIN_ROOM):
            ID=0
        else:
            ID = self.getIdFromName(roomName)
        towrite = fc.encode_universel(sequenceNumberSend,cst.JOINDRE_SALON,fc.encode_join_salon(ID))
        
        self.timeOut = task.LoopingCall(self.startAckTimer, towrite)
        self.timeOut.start(cst.TIME_BEFORE_RESEND)

        self.incrementSequenceNumber()
        pass

    def getIdFromName(self, movieName):
        for movie in self.listMovies:
            name = movie[7]
            id = movie[6]
            if(movieName == name):
                ID = int(id)
        return ID

    def getMovieNameFromId(self, movieId):
        for movie in self.listMovies:
            id = movie[6]
            name = movie[7]
            if(id == movieId):
                NAME = name
        return NAME

    def sendLeaveSystemRequestOIE(self):
        """
        Called by the client proxy  when the user
        has clicked on the leave button in the main room.
        """
        global sequenceNumberSend
        towrite = fc.encode_desinscription(sequenceNumberSend)

        self.timeOut = task.LoopingCall(self.startAckTimer, towrite)
        self.timeOut.start(cst.TIME_BEFORE_RESEND)

        self.incrementSequenceNumber()
        pass

    def findinUsrlist(username):
        l = self.serverPro


    def datagramReceived(self, datagram, host_port):
        """
        :param string datagram: the payload of the UDP packet.
        :param host_port: a touple containing the source IP address and port.

        Called **by Twisted** when the client has received a UDP
        packet.
        """        
        global sequenceNumberSend
        global sequenceNumberReceived

        print("R:"+str(sequenceNumberReceived)+";S:"+str(sequenceNumberSend))
        print(fc.decode_universel(datagram))

        #On récupère les infos du datagram de façon pratique
        info = fc.decode_universel(datagram)
        sequence = info[1]
        type = info[2]
        message = info[3]

        #Si le numero de sequence recu est celui qu'on attend, on peut incrementer ce nombre apres ack
        if (sequence == sequenceNumberReceived and not type == cst.ACK)  or (type == cst.ACK and sequence == (sequenceNumberSend-1)):

            #---Si on recoit un acquittement on arrête l'envoie du message
            #sinon il faut acquitter le message recu
            if type == cst.ACK :
                self.timeOut.stop()
            else:
                towrite = fc.encode_acquittement(sequenceNumberReceived)
                self.transport.write(towrite, (self.serverAddress, self.serverPort))
                sequenceNumberReceived+=1

            #---On traite du cas où l'inscription est refusée
            if(type == cst.INSCRIPTION_REFUSEE):
                sequenceNumberSend = 1
                sequenceNumberReceived = 1
                message = int(fc.decode_inscription_refusee(message)[0])
                errorMessage = ""
                if(message == 1):
                    errorMessage = "Nom d'utilisateur déjà utilisé"
                
                if(message == 2):
                    errorMessage = "Nom d'utilisateur dépassant 254 octets"
                    
                if(message == 3):
                    errorMessage = "Nom d'utilisateur contenant un ou plusieurs espaces"
                
                self.clientProxy.connectionRejectedONE(errorMessage)
            #Si le nom d'utilisateur est bon, on ne fait rien
            
            
            
            #---On recoit la liste des films et on la stocke dans une variable pour traiter cette liste en même temps que la liste des utilisateurs
            if(type == cst.LISTE_FILMS):
                self.listMovies = fc.decode_movie(message)
                
                

            #---On recoit la liste des noms d'utilisateurs et on affiche le tout
            if(type == cst.LISTE_UTILISATEURS):
                #On la stocjke comme la liste des films
                self.listUsers = fc.decode_user(message)
                
                #On met bien les infos de chaques films
                movieList = []
                for movie in self.listMovies:
                    ip = [movie[1], movie[2], movie[3], movie[4]]
                    port = movie[5]
                    id = movie[6]
                    movieName = movie[7]

                    movieList.append((movieName, str(ip[0])+"."+str(ip[1])+"."+str(ip[2])+"."+str(ip[3]), ""+str(port)+""))
                    
                #On met bien les infos de chaques user
                userList = []
                for user in self.listUsers:
                    id = user[1]
                    userName = user[2]
                    if(id == 0):
                        userList.append((userName, constants.ROOM_IDS.MAIN_ROOM))
                    else:
                        name = self.getMovieNameFromId(id)
                        userList.append((userName, name))
                
                #On l'affiche dans le client
                self.clientProxy.initCompleteONE(userList, movieList)
                
                
                
            #---On s'occupe de traiter la reception d'un message envoyé par le server REDIR_MESSAGE_INSTANTANE
            if(type == cst.REDIR_MESSAGE_INSTANTANE):
                data = fc.decode_redirection(message)
                user = data[1].decode("utf-8")
                message = data[2].decode("utf8")
                
                #On l'affiche dans le client
                self.clientProxy.chatMessageReceivedONE(user, message)

            if(type == cst.MISE_A_JOUR_UTILISATEUR):
                data = fc.decode_single_usermaj(message)
                id = data[0]
                if(id == 0 or id == 127):
                    nameMovieRoom = constants.ROOM_IDS.MAIN_ROOM
                else:
                    nameMovieRoom = self.getMovieNameFromId(id)
                userName = data[1].decode("utf-8")

                #il faut identifier si l'utilisateur est dans la liste pour agir en consequence
                isInList = False
                for user in self.listUsers:
                    name = user[2]
                    #id = user[1]
                    if(name == userName):
                        isInList = True

                #Si c'est le cas simple udate
                #Sinon ajout a la liste est update totale
                if(isInList):
                    if(id==127):
                        if(userName == self.userName):
                            self.clientProxy.leaveSystemOKONE()
                        else:
                            print(self.listUsers)
                            for k in self.listUsers:
                                if(k[2] == userName):
                                    toRemove = k
                            self.listUsers.remove(toRemove)
                            #self.listUsers.remove([0, 0, userName])

                            userList = []
                            for user in self.listUsers:
                                id = user[1]
                                userName = user[2]
                                if(id == 0):
                                    userList.append((userName, constants.ROOM_IDS.MAIN_ROOM))
                                else:
                                    name = self.getMovieNameFromId(id)
                                    userList.append((userName, name))
                            
                            #On l'affiche dans le client
                            self.clientProxy.setUserListONE(userList)

                    else:
                        self.clientProxy.userUpdateReceivedONE(userName, nameMovieRoom)
                else:
                    self.listUsers.append([0, id, userName])

                    userList = []
                    for user in self.listUsers:
                        id = user[1]
                        userName = user[2]
                        if(id == 0):
                            userList.append((userName, constants.ROOM_IDS.MAIN_ROOM))
                        else:
                            name = self.getMovieNameFromId(id)
                            userList.append((userName, name))
                    
                    #On l'affiche dans le client
                    self.clientProxy.setUserListONE(userList)

            if(type == cst.JOINDRE_SALON_OK):
                self.clientProxy.joinRoomOKONE()


            #if(type == cst.JOINDRE_SALON_NOK):
                #Je ne sais pas que faire dans ce cas...


        else:
            if not type == cst.ACK:
                seq = sequenceNumberReceived-1
                towrite = fc.encode_acquittement(seq)
                self.transport.write(towrite, (self.serverAddress, self.serverPort))
            


        pass
