import numpy as np
import operator
import time
import copy
#mazeMap = {(0, 0) : {(0, 1) : 5}, (0, 1) : {(0, 2) : 1, (1, 1) : 1, (0, 0) : 5}, (0, 2) : {(0, 3) : 1, (1, 2) : 1, (0, 1) : 1}, (0, 3) : {(1, 3) : 9, (0, 2) : 1}, (1, 0) : {(1, 1) : 1, (2, 0) : 1}, (1, 1) : {(2, 1) : 4, (1, 0) : 1, (0, 1) : 1}, (1, 2) : {(1, 3) : 1, (0, 2) : 1, (2, 2) : 6}, (1, 3) : {(0, 3) : 9, (1, 2) : 1}, (2, 0) : {(3, 0) : 1, (1, 0) : 1}, (2, 1) : {(1, 1) : 4, (2, 2) : 1}, (2, 2) : {(2, 1) : 1, (3, 2) : 1, (1, 2) : 6, (2, 3) : 1}, (2, 3) : {(2, 2) : 1}, (3, 0) : {(3, 1) : 1, (2, 0) : 1}, (3, 1) : {(3, 0) : 1, (3, 2) : 1}, (3, 2) : {(3, 1) : 1, (3, 3) : 1, (2, 2) : 1}, (3, 3) : {(3, 2) : 1}}

import ast
f = open("output.txt","r")
d = f.readline()
mazeMap= ast.literal_eval(d)
e = f.readline()
piecesOfCheese= ast.literal_eval(e)


TEAM_NAME = "Gg no re 5"
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
def setA(value,valuee):
	global mieux
	global meilleur_chemin
	mieux = value
	meilleur_chemin = valuee
	
def exhaustif(restants,sommet, chemin, poids,graphe):
	global mieux
	global meilleur_chemin
	if restants ==[]:
		if poids < mieux:
			mieux = poids
			meilleur_chemin= chemin
			#print(meilleur_chemin,poids)
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

def combine(a,b):
	aa= [[0]*2 for k in range(len(a))]
	for k in range(len(a)) :
		aa[k][0]=a[k]
	for j in range(len(b)):
		aa[j][1]=b[j]
	return(aa)

def hamiltoni1(mazeMap,piecesOfCheese,playerLocation):
	tps1 = time.clock()
	piecesOfCheese = [playerLocation] + piecesOfCheese
	hamiltonien = [[0]*len(piecesOfCheese) for i in range(2)]
	metaGraphs = metaGraph(mazeMap, (0,0), piecesOfCheese)
	piecesOfCheese.pop()
	valeur = 0
	for gouda in range(len(piecesOfCheese)):
		try:
			hamiltonien[0][gouda] = piecesOfCheese[gouda]
			hamiltonien[1][gouda] = metaGraphs[piecesOfCheese[gouda]][piecesOfCheese[gouda+1]]
		except IndexError:
			pass
	valeur = sum(hamiltonien[1])
	tps2 = time.clock()
	return hamiltonien, valeur, metaGraphs

#hamiltonien = (hamiltoni1(mazeMap,piecesOfCheese,(0,0)))
#print(hamiltonien)

def permutation(hamiltonien12,mazeMap,piecesOfCheese,valeur,pp1,pp2,metaGraph):
	p1 = pp1
	p2 = pp2
	hamiltonien = copy.deepcopy(hamiltonien12)
	indice1 = [i for i,j in enumerate(hamiltonien[0]) if j == p1]
	indice1 = indice1[0]
	indice2 = [i for i,j in enumerate(hamiltonien[0]) if j == p2]
	indice2 = indice2[0]
	if indice1 !=0 and indice1 !=len(hamiltonien[0])-1:
		hamiltonien[0][indice1] = p2
		hamiltonien[1][indice1-1], hamiltonien[1][indice1] = metaGraph[hamiltonien[0][indice1-1]][hamiltonien[0][indice1]], metaGraph[hamiltonien[0][indice1]][hamiltonien[0][indice1+1]]
	elif indice1 == len(hamiltonien[0])-1 :
		hamiltonien[0][indice1] = p2
		hamiltonien[1][indice1-1] = metaGraph[hamiltonien[0][indice1-1]][hamiltonien[0][indice1]]
	
	if indice2 !=0 and indice2 !=len(hamiltonien[0])-1:
		hamiltonien[0][indice2] = p1
		hamiltonien[1][indice2-1], hamiltonien[1][indice2] = metaGraph[hamiltonien[0][indice2-1]][hamiltonien[0][indice2]], metaGraph[hamiltonien[0][indice2]][hamiltonien[0][indice2+1]]
		
	elif indice2 == len(hamiltonien[0])-1:
		hamiltonien[0][indice2] = p1
		hamiltonien[1][indice2-1] = metaGraph[hamiltonien[0][indice2-1]][hamiltonien[0][indice2]]
	return hamiltonien, sum(hamiltonien[1])

#print(permutation(hamiltonien[0],mazeMap,piecesOfCheese,hamiltonien[1],(14, 18),(21, 4),hamiltonien[2]))

def moins(a,b):
	res = abs(np.subtract(a,b))
	return tuple(res)

def deuxopt(mazeMap, piecesOfCheese,playerLocation):
	tps3 = time.clock()
	hamiltonien, valeur, metaGraph = (hamiltoni1(mazeMap,piecesOfCheese,playerLocation))
	valeurd = valeur
	for l in range(6):
		for k in range(1,len(piecesOfCheese)):
			for j in range(1,len(piecesOfCheese)):
				tps1 = time.clock()
				#print(hamiltonien)
				hamiltonien1,valeur1 = permutation(hamiltonien,mazeMap,piecesOfCheese,valeur,hamiltonien[0][k],hamiltonien[0][j],metaGraph)
				if valeur1 < valeur:
					valeur = valeur1
					hamiltonien = hamiltonien1
				tps2=time.clock()
				#print(tps2-tps1, valeur)
	tps4 = time.clock()
	return hamiltonien, tps4-tps3, valeur, valeurd

#print(deuxopt(mazeMap,piecesOfCheese,(0,0)))
moves = []
def preprocessing (mazeMap, mazeWidth, mazeHeight, playerLocation, opponentLocation, piecesOfCheese, timeAllowed) :
	global moves
	route = deuxopt(mazeMap, piecesOfCheese,playerLocation)[0][0]
	print(route)	
	for k in range(len(route)) :
		try: 
			routages = dijk( mazeMap, route[k])
			l = chemin(route[k],route[k+1],routages)
			move = traduction(l)
			moves = moves + move
		except IndexError:
			pass
	return(moves)
#[(k,j) for k in range(7) for j in range(7)]

def turn (mazeMap, mazeWidth, mazeHeight, playerLocation, opponentLocation, playerScore, opponentScore, piecesOfCheese, timeAllowed) :
	return moves.pop(0)




















		
