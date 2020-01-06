import numpy as np

#mazeMap = {(0, 0) : {(0, 1) : 5}, (0, 1) : {(0, 2) : 1, (1, 1) : 1, (0, 0) : 5}, (0, 2) : {(0, 3) : 1, (1, 2) : 1, (0, 1) : 1}, (0, 3) : {(1, 3) : 9, (0, 2) : 1}, (1, 0) : {(1, 1) : 1, (2, 0) : 1}, (1, 1) : {(2, 1) : 4, (1, 0) : 1, (0, 1) : 1}, (1, 2) : {(1, 3) : 1, (0, 2) : 1, (2, 2) : 6}, (1, 3) : {(0, 3) : 9, (1, 2) : 1}, (2, 0) : {(3, 0) : 1, (1, 0) : 1}, (2, 1) : {(1, 1) : 4, (2, 2) : 1}, (2, 2) : {(2, 1) : 1, (3, 2) : 1, (1, 2) : 6, (2, 3) : 1}, (2, 3) : {(2, 2) : 1}, (3, 0) : {(3, 1) : 1, (2, 0) : 1}, (3, 1) : {(3, 0) : 1, (3, 2) : 1}, (3, 2) : {(3, 1) : 1, (3, 3) : 1, (2, 2) : 1}, (3, 3) : {(3, 2) : 1}}


TEAM_NAME = "Gg no re"
MOVE_DOWN = 'D'
MOVE_LEFT = 'L'
MOVE_RIGHT = 'R'
MOVE_UP = 'U'


def creeFileDP():
	return([])

def addOrReplace(fileDePriorite,cle,val):
	i= True
	for clef in range(len(fileDePriorite)):
		if fileDePriorite[clef][0] == cle :
			fileDePriorite[clef] = list(fileDePriorite[clef])
			fileDePriorite[clef][1] = val
			fileDePriorite[clef] = tuple(fileDePriorite[clef])
			i=False
			pass
	if i:
		fileDePriorite.append((cle,val))

def retirer(fileDP):
	minn = fileDP[0][1]
	indice = 0
	for vall in range(len(fileDP)):
		if fileDP[vall][1]< minn:
			minn = fileDP[vall][1]
			indice = vall
	return fileDP.pop(indice)

def vide(fileDP):
	return fileDP == []


"""a = [(1),(2,8),(4,5),(6,7)]
print(retirer(a))
print(a)
addOrReplace(a,0,0)
print(a)
addOrReplace(a,2,18)
print(a)"""

def dijk( mazeMap, somDep):
	#intialisation
	filePrio= creeFileDP()
	addOrReplace(filePrio, somDep, 0)
	n = len(mazeMap)
	distance = np.array([[np.inf]*n]*n)
	distance[somDep] = 0
	routage = {}
	#Boucle de l'algorithme
	while not vide(filePrio):
		sommetCour , dist = retirer(filePrio)
		for i in mazeMap[sommetCour]:
			distParCourant = dist + mazeMap[sommetCour][i]
			if distance[i[0],i[1]] > distParCourant:
				distance[i[0],i[1]] = distParCourant
				addOrReplace(filePrio, i, distParCourant)
				routage[i]= sommetCour
	return(routage)

#Donne le chemin a faire grace au routage, en coordonee	
def chemin(depart,arrivee,routage):
	moves=[arrivee]
	coord = arrivee
	while coord != depart:
		moves.append(tuple(routage[coord]))
		coord = tuple(routage[coord])
	return(moves)
	
#Donne les mouvements a faire pour passer d'une case adjacente a une autre
def moveToDo(A,B):
	if tuple(np.subtract(A,B)) == (0,1):
		return(MOVE_LEFT)
	elif tuple(np.subtract(A,B)) == (0,-1):
		return(MOVE_RIGHT)
	elif tuple(np.subtract(A,B)) == (1,0):
		return(MOVE_UP)
	elif tuple(np.subtract(A,B)) == (-1,0):
		return(MOVE_DOWN)

#Donne la traduction d'un chemin coordonnee en chemin MOVE_UP etc
def traduction(chemin):
	moves=[]
	while chemin != []:
		try:
			coord1= chemin.pop()
			coord2= chemin[len(chemin)-1]
			moves.append(moveToDo(coord1,coord2))
		except IndexError:
			pass
	return(moves)

#Prend le chemin et donne une liste avecla boue correspondante
def recupBoue(chemin, mazeMap):
    boue = []
    chemins = chemin
    while chemins != []:
        try:
            coord1= chemins.pop()
            coord2= chemins[len(chemins)-1]
            boue.append(mazeMap[coord1][coord2])
        except IndexError:
            pass
    return(boue)

#Trace le metagraphe 
def metaGraph(mazeMap,playLoc, cheese):
	newCheese = cheese
	newCheese.append(playLoc)
	cheesenan = {}
	for k in range (len(cheese)):
			cheesenan[cheese[k]] = {}
	for fromage in cheese:
		routages=dijk(mazeMap, fromage)
		for k in range(len(cheese)):
			chemins = chemin(fromage,cheese[k],routages)
			boue = recupBoue(chemins, mazeMap)
			cheesenan[fromage][cheese[k]] = sum(boue)
	return cheesenan

mieux = np.inf
meilleur_chemin = 0
def exhaustif(restants,sommet, chemin, poids,graphe):
	global mieux
	global meilleur_chemin
	if poids >= mieux: 		#C'est ca q'uon rajoute pour le backtracking juste ce if
		return
	if restants ==[]:
		if poids < mieux:
			mieux = poids
			meilleur_chemin= chemin
	else:
		for i in range(len(restants)):
			exhaustif(restants[:i]+restants[i+1:],restants[i],chemin+[restants[i]], poids + graphe[sommet][restants[i]],graphe)
	return meilleur_chemin

def enlever(l,i): #Ne sert plus a rien paix a ton ame, on te garde au cas ou. RIP in peace.
	l.pop(l.index(i))
	return l
	
def listsommet(metaGraph,sommetDepart):
	sol = []
	for k in metaGraph:
		if k != sommetDepart:
			sol.append(k)
	return sol

#print(metaGraph(mazeMap, (0,0), [(0,2),(2,0),(2,2),(1,3)])[(2,2)])
#metaGraphs = metaGraph(mazeMap, (0,0), [(0,2),(2,0),(2,2),(1,3)])
#a = exhaustif(listsommet( metaGraphs, (0,0)),(0,0), [(0,0)], 0,metaGraphs)
#print(a)
moves = []
def preprocessing (mazeMap, mazeWidth, mazeHeight, playerLocation, opponentLocation, piecesOfCheese, timeAllowed) :
	meta = metaGraph(mazeMap, playerLocation,piecesOfCheese)
	ex = exhaustif(listsommet(meta, playerLocation),playerLocation, [playerLocation],0,meta)
	global moves
	for k in range(len(ex)) :
		try: 
			routages = dijk( mazeMap, ex[k])
			l = chemin(ex[k],ex[k+1],routages)
			move = traduction(l)
			moves = moves + move
		except IndexError:
			pass
	return(moves)


#print(preprocessing(mazeMap ,10,10,(0,0),1,[(0,2),(2,0),(2,2),(1,3)],2))

def turn (mazeMap, mazeWidth, mazeHeight, playerLocation, opponentLocation, playerScore, opponentScore, piecesOfCheese, timeAllowed) :
	global moves
	print(moves)
	a = moves.pop(0)
	return(a)



#print(chemin((0,3),(3,3),dijk(mazeMap,(0,3))))
#print(recupBoue(chemin((0,0),(3,3),dijk(mazeMap,(0,0))), mazeMap))




		
