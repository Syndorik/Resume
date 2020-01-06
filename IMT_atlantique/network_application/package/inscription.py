import struct
from c2w.main.server_proxy.c2wServerProxy import *
 
def pack_inscription(login):

    packet_size=len(login.encode('utf-8'))
    fmt='>'+str(len(login))+'s'
    buf=bytearray(packet_size)
  
    struct.pack_into(fmt,buf,0,login.encode('utf-8'))
    return buf

def unpack_inscription(login):

    return struct.unpack_from(">"+str(len(login))+"s",login,offset=0)[0]



def checkerrors_inscription(login):
    
    sent_login = unpack_inscription(login)
    users_list = getUserList()

    if(len(sent_login) > 254) : 
        
        self.transport.write(pack(2), (self.serverAddress, self.serverPort))
        return 
        
    for char in sent_login :
    
        if (char=' '):
            
            return

    for user in users_list :
    
        if (sent_login == user) :
            
            return
    
    
