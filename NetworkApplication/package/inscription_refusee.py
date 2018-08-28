import struct
from c2w.main.server_proxy.c2wServerProxy import *
from twisted.internet.protocol import *

def unpack_inscription(login):

    return struct.unpack_from(">"+str(len(login))+"s",login,offset=0)[0]

def pack_error(error_number):
    
    packet_size=1
    fmt='>b'
    buf=bytearray(packet_size)
    
    struct.pack_into(fmt,buf,0,str(error_number).encode('utf-8'))
    return buf

def unpack_error(self, error_number):

    i=struct.unpack_from(">b",error_number,offset=0)[0]

    if (i==1):

       self.clientProxy.connectionRejectedONE("Login déjà utilisé")
       return    

    if (i==2):

       self.clientProxy.connectionRejectedONE("Login trop long")
       return 

    if (i==3):

       self.clientProxy.connectionRejectedONE("Le login ne doit pas contenir d'espaces")
       return
