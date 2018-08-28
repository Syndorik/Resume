import numpy as np
mazeMap = {(0, 0) : {(0, 1) : 1}, (0, 1) : {(0, 2) : 1, (1, 1) : 1, (0, 0) : 1}, (0, 2) : {(0, 3) : 1, (1, 2) : 1, (0, 1) : 1}, (0, 3) : {(1, 3) : 1, (0, 2) : 1}, (1, 0) : {(1, 1) : 1, (2, 0) : 1}, (1, 1) : {(2, 1) : 1, (1, 0) : 1, (0, 1) : 1}, (1, 2) : {(1, 3) : 1, (0, 2) : 1, (2, 2) : 1}, (1, 3) : {(0, 3) : 1, (1, 2) : 1}, (2, 0) : {(3, 0) : 1, (1, 0) : 1}, (2, 1) : {(1, 1) : 1, (2, 2) : 1}, (2, 2) : {(2, 1) : 1, (3, 2) : 1, (1, 2) : 1, (2, 3) : 1}, (2, 3) : {(2, 2) : 1}, (3, 0) : {(3, 1) : 1, (2, 0) : 1}, (3, 1) : {(3, 0) : 1, (3, 2) : 1}, (3, 2) : {(3, 1) : 1, (3, 3) : 1, (2, 2) : 1}, (3, 3) : {(3, 2) : 1}}

TEAM_NAME = "Gg no re"
MOVE_DOWN = 'D'
MOVE_LEFT = 'L'
MOVE_RIGHT = 'R'
MOVE_UP = 'U'


#creer une file vide
def create():
	return([])

#Regarder si la file est vide
def isEmpty(queue):
	return( queue == [])

#Ajouter un element a une file

def push (element, queue):
	return(queue.append(element))

#Extraire un element de la file

def pop(queue):
	return(queue.pop(0))
#Renvoie le tableau de routage issu du labyrinthe
def parcours(noeud_depart,mazeMap):
	file=create()
	push(noeud_depart, file)
	noeud_marque = [noeud_depart]
	routage = {}
	while not isEmpty(file):	#Tant que la file de dzpart n'est pas vide
		noeud_courant = pop(file)
		for i in mazeMap[noeud_courant]:
			if i not in noeud_marque:
				routage[i] = []			#On creee un dictionnaire donc la cle est la position non marque et donc le contenu est le predecesseur, celui qui l'a engendre
				routage[i].append(noeud_courant)
				noeud_marque.append(i)
				push(i, file)
	return(routage)

#Donne le chemin a faire grace au routage, en coordonee	
def chemin(depart,arrivee,routage):
	moves=[arrivee]
	coord = arrivee
	while coord != depart:
		moves.append(tuple(routage[coord][0]))
		coord = tuple(routage[coord][0])
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

def preprocessing (mazeMap, mazeWidth, mazeHeight, playerLocation, opponentLocation, piecesOfCheese, timeAllowed) :
	pass


def turn (mazeMap, mazeWidth, mazeHeight, playerLocation, opponentLocation, playerScore, opponentScore, piecesOfCheese, timeAllowed) :
	piecesOfCheese = tuple(piecesOfCheese[0])
	routages = parcours(playerLocation,mazeMap)
	chemins = chemin(playerLocation,piecesOfCheese,routages)
	move = traduction(chemins)
	return(move[0])

	







