# -*- coding: utf-8 -*-
from twisted.internet.protocol import Protocol
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


stored = bytearray(b'')
taille_paquet = 1000000000 

logging.basicConfig()
moduleLogger = logging.getLogger('c2w.protocol.udp_chat_client_protocol')


###################################
#        VARIABLES GLOBALES       #
###################################
sequenceNumberSend = 1
sequenceNumberReceived = 1

logging.basicConfig()
moduleLogger = logging.getLogger('c2w.protocol.tcp_chat_client_protocol')


class c2wTcpChatClientProtocol(Protocol):

    def __init__(self, clientProxy, serverAddress, serverPort):
        """
        :param clientProxy: The clientProxy, which the protocol must use
            to interact with the Graphical User Interface.
        :param serverAddress: The IP address (or the name) of the c2w server,
            given by the user.
        :param serverPort: The port number used by the c2w server,
            given by the user.

        Class implementing the UDP version of the client protocol.

        .. note::
            You must write the implementation of this class.

        Each instance must have at least the following attribute:

        .. attribute:: clientProxy

            The clientProxy, which the protocol must use
            to interact with the Graphical User Interface.

        .. attribute:: serverAddress

            The IP address of the c2w server.

        .. attribute:: serverPort

            The port number used by the c2w server.

        .. note::
            You must add attributes and methods to this class in order
            to have a working and complete implementation of the c2w
            protocol.
        """

        #: The IP address of the c2w server.
        self.serverAddress = serverAddress
        #: The port number used by the c2w server.
        self.serverPort = serverPort
        #: The clientProxy, which the protocol must use
        #: to interact with the Graphical User Interface.
        self.clientProxy = clientProxy
        self.timeOut = ""
        self.count = 0
        
        self.listMovies = []
        self.listUsers = []

        self.userName = ""

    #Cette fonction ne gère que l'envoi de donné au serveur suite au clique sur login
    #La reception et le traitement de cette réponse se fait via datagramReceived()
    def startAckTimer(self, towrite):        
        self.transport.write(towrite)

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
        moduleLogger.debug('loginRequest called with username=%s', userName)
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

        Called by the client proxy when the user has decided to send
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

	
    def dataReceived(self, data):
        """
        :param data: The data received from the client (not necessarily
                     an entire message!)

        Twisted calls this method whenever new data is received on this
        connection.
        """

        ######FRAMING##########
        global stored
        global taille_paquet
        """Dans cette première partie du framing on store dans une variable le contenu de data. S'il contient plus que un datagram on garde en mémoire le surplus et on procède à la suite
        On initialise la taille_paque et sorted de telle sorte que l'on ait pas de problème au départ."""
        

        if len(stored) < 4:
            stored = stored + data

        else :
            stored = stored + data
            taille_paquet = fc.decode_universel(stored)[0]


        if len(stored) >= 4:
            taille_paquet = fc.decode_universel(stored)[0]


        if len(stored) >= taille_paquet:
            fff = len(stored)
            diff = len(stored)-taille_paquet
            rdata = stored[0:taille_paquet]
            data = rdata
            if diff ==0:
                stored = bytearray(b'')
                taille_paquet = 100000000
            else:
                stored = stored[taille_paquet:]
                if type(stored) == type(1):
                    stored = bytearray(b'')
                taille_paquet = 10000000
        else:
            return




        global sequenceNumberSend
        global sequenceNumberReceived

        #DEBUF
        """print("R:"+str(sequenceNumberReceived)+";S:"+str(sequenceNumberSend))
        print(fc.decode_universel(data))"""

        #On récupère les infos du datagram de façon pratique

        info = fc.decode_universel(data)
        sequence = info[1]
        stype = info[2]
        message = info[3]

        inff = [[sequence,stype,message]]
        

        #Il est possible qu'on ait plus que un datagram à traiter d'ou ca
        if stored != bytearray(b''):
            while stored != bytearray(b''):
                info2 = fc.decode_universel(stored)
                pcklgth = info2[0]
                seq = info2[1]
                tipe = info2[2]
                msg = info2[3][0:pcklgth]
                stored = info2[pcklgth:]
                l = [seq,tipe,msg]
                if stored == []:
                    stored =bytearray(b'') 
                inff.append(l)

        ###########FIN DU FRAMING ################

        for k in inff:
            sequence = k[0]
            stype = k[1]
            message = k[2]
            #Si le numero de sequence recu est celui qu'on attend, on peut incrementer ce nombre apres ack
            if (sequence == sequenceNumberReceived and not stype == cst.ACK)  or (stype == cst.ACK and sequence == (sequenceNumberSend-1)):

                #---Si on recoit un acquittement on arrête l'envoie du message
                #sinon il faut acquitter le message recu
                if stype == cst.ACK :
                    self.timeOut.stop()
                else:
                    towrite = fc.encode_acquittement(sequenceNumberReceived)
                    self.transport.write(towrite)
                    sequenceNumberReceived+=1

                #---On traite du cas où l'inscription est refusée
                if(stype == cst.INSCRIPTION_REFUSEE):
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
                if(stype == cst.LISTE_FILMS):
                    self.listMovies = fc.decode_movie(message)
                    
                    

                #---On recoit la liste des noms d'utilisateurs et on affiche le tout
                if(stype == cst.LISTE_UTILISATEURS):
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
                if(stype == cst.REDIR_MESSAGE_INSTANTANE):
                    sdata = fc.decode_redirection(message)
                    user = sdata[1].decode("utf-8")
                    message = sdata[2].decode("utf8")
                    
                    #On l'affiche dans le client
                    self.clientProxy.chatMessageReceivedONE(user, message)

                if(stype == cst.MISE_A_JOUR_UTILISATEUR):
                    sdata = fc.decode_single_usermaj(message)
                    id = sdata[0]
                    if(id == 0 or id == 127):
                        nameMovieRoom = constants.ROOM_IDS.MAIN_ROOM
                    else:
                        nameMovieRoom = self.getMovieNameFromId(id)
                    userName = sdata[1].decode("utf-8")

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
                                sequenceNumberSend = 1
                                sequenceNumberReceived = 1
                            else:
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

                if(stype == cst.JOINDRE_SALON_OK):
                    self.clientProxy.joinRoomOKONE()


                #if(type == cst.JOINDRE_SALON_NOK):
                    #Je ne sais pas que faire dans ce cas...


            else:
                if not stype == cst.ACK:
                    seq = sequenceNumberReceived-1
                    towrite = fc.encode_acquittement(seq)
                    self.transport.write(towrite)
                


            pass
