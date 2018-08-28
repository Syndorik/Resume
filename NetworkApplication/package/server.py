def which_one(datagram):
    interm = fc.decode_universel(datagram)
    databyte = interm[3]
    taille = interm[0]
    sequence = interm[1]
    type = interm[2]
    sol = [taille,sequence,type]

    if type == 1 :
        sol.append(fc.decode_inscription(interm))
        return sol
    if type == 2 :
        sol.append(fc.decode_movie(interm))
        return sol
    if type == 3 : 
        sol.append(fc.decode_user(interm))
        return sol
    if type == 4 :
        sol.append(fc.decode_single_usermaj(interm))
        return sol
    if type == 5 :
        sol.append(fc.decode_message_instantane(interm))
        return sol
    if type == 6 :
        sol.append(fc.decode_join_salon(interm))
        return sol
    if type == 7 :
        return sol
    if type == 8 :
        sol.append(fc.decode_inscription_refusee(interm))
        return sol
    if type == 9 :
        return sol
    if type == 10 :
        return sol
    if type == 11 :
        return sol
    if type == 12 :
        return sol
    if type == 63 :
        return sol
