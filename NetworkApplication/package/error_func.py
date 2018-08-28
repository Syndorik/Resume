import fonctionsc2w as fc


""" On suppose que pour toutes les erreurs, la partie universelle est enlevée sauf dans certains cas
"""

## Error inscription

def Err_Inscription(data,usr_list): #usr_list liste de string avec les noms de tout le monde
    login = fc.decode_inscription(data).decode('utf-8')
    if len(login)>254:
        return False
    if ' ' in login:
        print("c")
        return False
    if login in usr_list:
        return False
    else:
        return True

## Error message

def Err_Message(message):
    if len(message)> 65000:
        return False
    else:
        return True
