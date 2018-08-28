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


TEAM_NAME = "Gg no re LE MEILLEUR"
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

#print(metaGraph(mazeMap, (0,0), [(0,2),(2,0),(2,2),(1,3)])[(2,2)])
#metaGraphs = metaGraph(mazeMap, (0,0), [(0,2),(2,0),(2,2),(1,3)])
#a = exhaustif(listsommet( metaGraphs, (0,0)),(0,0), [(0,0)], 0,metaGraphs)
#print(a)

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

#t0 = time.clock()
#metaGraphs = metaGraph(mazeMap, (0,0), piecesOfCheese)
#t1=time.clock()
#print(t1-t0)
#print(piecesOfCheese)
#a = exhaustif(listsommet( metaGraphs, (0,0)),(0,0), [(0,0)], 0,metaGraphs)
#print(a)

move = []
meta = 0
frofro = 0
fromactuel = 0
def preprocessing (mazeMap, mazeWidth, mazeHeight, playerLocation, opponentLocation, piecesOfCheese, timeAllowed) :
	global meta
	global move
	global frofro
	global fromactuel
	frofro = piecesOfCheese
	a = piecesOfCheese
	n = len(a)
	b= playerLocation
	meta=metaGraph(mazeMap,b,a)
	dic = copy.deepcopy(meta[b])
	del dic[b]
	l= min(dic, key =dic.get)
	fromactuel = l
	routages = dijk(mazeMap, playerLocation)
	chemins = chemin(playerLocation,l,routages)
	move = traduction(chemins)
	del meta[b]
	for k in  meta:
		del meta[k][b]
	return move

#preprocessing(mazeMap,0,0,(0,0),0,piecesOfCheese,0)

var1=0
var2=1
var3=2
var4=3
previouslocation = 0
currentlocation = 0
sizecheese=0
#print(preprocessing(mazeMap ,10,10,(0,0),1,[(0,2),(2,0),(2,2),(1,3)],2))
def turn (mazeMap, mazeWidth, mazeHeight, playerLocation, opponentLocation, playerScore, opponentScore, piecesOfCheese, timeAllowed) :
	tps1= time.clock()
	
	global frofro
	global currentlocation
	global sizecheese
	global previouslocation
	global meta
	global var1
	global var2
	global var3
	global var4
	global fromactuel
	setA(np.inf,0)
	global mieux
	global meilleur_chemin
	global move
	
	if sizecheese != len(piecesOfCheese):
		sizecheese = len(piecesOfCheese)
		previouslocation = currentlocation
		currentlocation = playerLocation
		#print(previouslocation)
		try:
			del meta[previouslocation]
		except KeyError:
			#print("HAHA")
			pass
		for k in meta:
			try:
				del meta[k][previouslocation]
			except KeyError:
				pass
		
	
	"""if var1 == var3 and var3 == "R" and var2==var4 and var4 == "L" and var1!=var2 or var1 == var3 and var3 == "U" and var2==var4 and var4 == "D" and var1!=var2 or var1 == var3 and var3 == "L" and var2==var4 and var4 == "R" and var1!=var2 or var1 == var3 and var3 == "D" and var2==var4 and var4 == "U" and var1!=var2:
		routages = dijk(mazeMap, playerLocation)
		l1 = chemin(playerLocation,fromactuel,routages)
		move = traduction(l1)
		print(move, fromactuel)
		var1=0
		var2=1
		var3=2
		var4=3
		return move[0]"""
	
	if fromactuel in piecesOfCheese:
		while move !=[]:
		#print(move)
			return move.pop(0)
	else:
		b= playerLocation
		if playerLocation not in frofro or len(piecesOfCheese)<=6:
			#print("zboub")
			routages = dijk(mazeMap, playerLocation)
			cheesenan=[0]*len(piecesOfCheese)
			for k in range(len(piecesOfCheese)):	#On creee une liste contenant la longueurs des chemins a suivre en fonction de la position des differents fromages.
				chemins = chemin(playerLocation,piecesOfCheese[k],routages)
				cheesenan[k]=(len(chemins))
				boue = recupBoue(chemins, mazeMap)
				cheesenan[k] = cheesenan[k]+ sum(boue)
			m = min(cheesenan)
			best_cheese_pos = [i for i,j in enumerate(cheesenan) if j == m] #Pour recuperer les indices des cheese qui sont les moins loins
			chemins = chemin(playerLocation,piecesOfCheese[best_cheese_pos[0]],routages)
			move = traduction(chemins)
			return(move[0])
		meta1 = {}
		sol =[b]
		k=0
		while len(sol) != 6:
			#print(sol)
			dic = copy.deepcopy(meta[sol[k]])
			for j in range(len(sol)):
				del dic[sol[j]]
			l = min(dic, key =dic.get)
			sol.append(l)
			k+=1
		#print(sol)
		for k in range(len(sol)): #Création du metagraphe mini
			dic = copy.deepcopy(meta[sol[k]])
			for j in meta[sol[k]]:
				if j not in sol:
					del dic[j]
			meta1[sol[k]] = dic
		routages = dijk(mazeMap,b)
		ex = exhaustif(listsommet(meta1,b),b,[],0,meta1)
		#print(ex)
		fromactuel = ex[0]
		l = chemin(playerLocation,ex[0],routages)
		move = traduction(l)
		#print(meta)	
	
	tps4 = time.clock()
	var4 = var3
	var3= var2
	var2 = var1
	var1=move[0]
	tps2 = time.clock()
	#print(tps2-tps1)
	return(move.pop(0))



#print(chemin((0,3),(3,3),dijk(mazeMap,(0,3))))
#print(recupBoue(chemin((0,0),(3,3),dijk(mazeMap,(0,0))), mazeMap))


		