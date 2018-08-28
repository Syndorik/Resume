from time import *
from math import *

import struct
"""
Toute les encode et decode qui vont être utilisé. Pour chaque message, les textes sont à envoyer en string, les seq et type en entier. A noter que la fonction decode ne renvoie pas les text décodés. Il faudra utiliser text.decode('utf-8') pour cela.
"""

## Entête
def binary_conversion(seq, type): #seq et type sont des entiers /!\ Pas d'hexa pris en compte convertir avant
    seqb = bin(seq)[2:]
    typeb = bin(type)[2:]
    if len(seqb) < 10 :
        dif = 10 - len(seqb)
        seqb = "0"*(dif) + seqb
    if len(typeb) < 6 :
        dif = 6 - len(typeb)
        typeb = "0"*dif + typeb
    binary = seqb + typeb
    towrite = int(binary,2)
    return towrite

def binary_recovery(binary_sequence): #Prend en entrée un entier
    binn = bin(binary_sequence)[2:]
    if len(binn)<16 :
        binn = "0"*(16-len(binn))+binn
    seq = int(binn[0:10],2)
    type = int(binn[10:],2)
    return seq,type
    


def encode_universel(seq, type, data_byte): #seq et type sont des entiers, data_byte un tableau de byte
    lenn = len(data_byte)
    total_length = 4 + lenn
    buff = bytearray(total_length)
    seqAndType = binary_conversion(seq,type)
    tail = ">HH"+str(lenn)+"s"
    struct.pack_into(tail,buff,0,total_length,seqAndType,data_byte)
    return buff

def decode_universel(buf):
    reallen= len(buf)-4
    tail = ">HH"+str(reallen)+"s"
    h = struct.unpack(tail,buf)
    seq,type = binary_recovery(h[1])
    h = list(h)
    h[1]= seq
    h.insert(2,type)
    h[3]= bytearray(h[3])
    return h

## Fonctions pour l'inscription

def encode_inscription(login):

    packet_size=len(login.encode('utf-8'))
    fmt='>'+str(len(login.encode("utf-8")))+'s'
    buf=bytearray(packet_size)
  
    struct.pack_into(fmt,buf,0,login.encode('utf-8'))
    return buf

def decode_inscription(login):

    return struct.unpack_from(">"+str(len(login))+"s",login,offset=0)[0]


## Fonctions pour les films

def encode_single_movie(IpAddr,PortNumber,Id,movieName): #IpAdrr = tableau de 4 nombres, PortNumber = entier, Id pareil, movieName String
    movieName = movieName.encode('utf-8')
    taille = len(movieName) + 8
    buff = bytearray(taille)
    tail = ">BBBBBHB" + str(len(movieName)) + "s"
    struct.pack_into(tail,buff,0,taille,IpAddr[0],IpAddr[1],IpAddr[2],IpAddr[3],PortNumber,Id,movieName)
    return buff

def encode_movie(lfIpAddr,lfPortNumber, Ids, lfmovieName):
    n = len(Ids)
    h = bytearray()
    for k in range(n):
        h = h + encode_single_movie(lfIpAddr[k],lfPortNumber[k],Ids[k],lfmovieName[k])
    return h

def decode_single_movie(data):
    tail = ">BBBBBHB" + str(len(data)-8) + "s"
    h = struct.unpack(tail, data)
    return h

def decode_movie(data): #Retourne une matrice. Chaque ligne de la matrice correspond à un film. l'IP correspond à 4 cases
    sol = []
    while data != bytearray():
        solun = []
        data = decode_single_movie(data)
        data = list(data)
        taille = data[0]-8
        for k in range(7):
            solun.append(data.pop(0))
        solun.append(data[0][:taille].decode('utf-8'))
        sol.append(solun)
        solun = []
        data = list(data[0])
        for k in range(taille):
            data.pop(0)
        data = bytearray(data)
    
    return(sol)

## Fonctions pour la liste des utilisateurs

def encode_single_user(Id,userName): #Id un entier, userName un string
    userName = userName.encode('utf-8')
    taille = len(userName) + 2
    buff = bytearray(taille)
    tail = ">BB" + str(len(userName)) + "s"
    struct.pack_into(tail,buff,0,taille,Id,userName)
    return buff

def encode_user(Ids, lfUserName): #Ids tableau d'entier, lfUserName tableau de string
    n = len(Ids)
    h = bytearray()
    for k in range(n):
        h = h + encode_single_user(Ids[k],lfUserName[k])
    return h

def decode_single_user(data):
    tail = ">BB" + str(len(data)-2) + "s"
    h = struct.unpack(tail, data)
    return h

def decode_user(data): #Retourne une matrice. Chaque ligne de la matrice correspond à un film. l'IP correspond à 4 cases
    sol = []
    while data != bytearray():
        solun = []
        data = decode_single_user(data)
        data = list(data)
        taille = data[0]-2
        for k in range(2):
            solun.append(data.pop(0))
        solun.append(data[0][:taille].decode('utf-8'))
        sol.append(solun)
        solun = []
        data = list(data[0])
        for k in range(taille):
            data.pop(0)
        data = bytearray(data)
    
    return(sol)

## Maj des utilisateurs

def encode_single_usermaj(Id,userName): #Id un entier, userName String
    userName= userName.encode('utf-8')
    taille = len(userName) + 1
    buff = bytearray(taille)
    tail = ">B" + str(len(userName)) + "s"
    struct.pack_into(tail,buff,0,Id,userName)
    return buff

def decode_single_usermaj(data):
    tail = ">B" + str(len(data)-1) + "s"
    h = struct.unpack(tail, data)
    return h

## Message instantané

def encode_message_instantane(message): #Message est un string
    message = message.encode("utf-8")
    taille = len(message)
    buff = bytearray(taille)
    tail = str(len(message)) + "s"
    struct.pack_into(tail,buff,0,message)
    return buff

def decode_message_instantane(data):
    tail = str(len(data)) + "s"
    h = struct.unpack(tail, data)
    return h
    
## Joindre Salon

def encode_join_salon(Id): #Id un entier, userName String
    taille = 1
    buff = bytearray(taille)
    tail = ">B"
    struct.pack_into(tail,buff,0,Id)
    return buff

def decode_join_salon(data):
    tail = ">B"
    h = struct.unpack(tail, data)
    return h


## Joindre Salon OK

def encode_join_salon_OK(seq):
    return encode_universel(seq,11,b'')

def decode_join_salon_OK(data):
    return decode_universel(data)

## Joindre Salon NOK

def encode_join_salon_NOK(seq):
    return encode_universel(seq,12,b'')

def decode_join_salon_NOK(data):
    return decode_universel(data)

## Message inscription acceptee
def encode_inscription_acceptee(seq):
    return encode_universel(seq,7,b'')

def decode_inscription_accepte(data):
    return decode_universel(data)

## Message inscription refusee

def encode_inscription_refusee(error):
    taille = 1
    buff = bytearray(taille)
    tail = ">B"
    struct.pack_into(tail,buff,0,error)
    return buff


def decode_inscription_refusee(data):
    tail = ">B"
    h = struct.unpack(tail, data)
    return h

## Message de desinscritpion
def encode_desinscription(seq):
    return encode_universel(seq,9,b'')

def decode_desinscription(data):
    return decode_universel(data)

## Message redirection message instantanee
def encode_redirection(userName,message):
    userName = userName.encode("utf-8")
    message = message.encode("utf-8")
    taille = len(userName) + 1 + len(message)
    buff = bytearray(taille)
    taille = len(userName)
    tail = ">B" + str(len(userName)) + "s"+str(len(message)) + "s"
    struct.pack_into(tail,buff,0,taille,userName, message)
    return buff

def decode_redirection(data):
    tail = ">B" + str(len(data)-1) + "s"
    h = struct.unpack(tail, data)
    taille = h[0]
    h = h[1]
    tail = ">" + str(taille) + "s" + str(len(data) - 1 - taille) + "s"
    hh = struct.unpack(tail, h)
    hh = list(hh)
    hh.insert(0, taille)
    hh = tuple(hh)
    return hh
    
## Acquittement

def encode_acquittement(seq):
    return encode_universel(seq,63,b'')

def decode_acquittement(data):
    return decode_universel(data)







    