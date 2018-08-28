import random as rd
import numpy as np
TEAM_NAME = "Gg no re"
mazeMap = {(0, 0) : {(0, 1) : 1}, (0, 1) : {(0, 2) : 1, (1, 1) : 1, (0, 0) : 1}, (0, 2) : {(0, 3) : 1, (1, 2) : 1, (0, 1) : 1}, (0, 3) : {(1, 3) : 1, (0, 2) : 1}, (1, 0) : {(1, 1) : 1, (2, 0) : 1}, (1, 1) : {(2, 1) : 1, (1, 0) : 1, (0, 1) : 1}, (1, 2) : {(1, 3) : 1, (0, 2) : 1, (2, 2) : 1}, (1, 3) : {(0, 3) : 1, (1, 2) : 1}, (2, 0) : {(3, 0) : 1, (1, 0) : 1}, (2, 1) : {(1, 1) : 1, (2, 2) : 1}, (2, 2) : {(2, 1) : 1, (3, 2) : 1, (1, 2) : 1, (2, 3) : 1}, (2, 3) : {(2, 2) : 1}, (3, 0) : {(3, 1) : 1, (2, 0) : 1}, (3, 1) : {(3, 0) : 1, (3, 2) : 1}, (3, 2) : {(3, 1) : 1, (3, 3) : 1, (2, 2) : 1}, (3, 3) : {(3, 2) : 1}}

visitedCells = [] #Memoire des cellules visitees

MOVE_DOWN = 'D'
MOVE_LEFT = 'L'
MOVE_RIGHT = 'R'
MOVE_UP = 'U'

def moveFromLocations(playerLocation,neighbor): #Donner le mouvement a faire a partir d'un voisin
	diff = tuple(np.subtract(neighbor,playerLocation))
	if diff == (-1,0):
		return(MOVE_UP)
	if diff == (0,1):
		return(MOVE_RIGHT)
	if diff == (0,-1):
		return(MOVE_LEFT)
	if diff == (1,0):
		return(MOVE_DOWN)
	else:
		raise Exception("Impossible move")
	
	
	

def randoMove(): #move random pramis les 4 possibles
	moves=[MOVE_DOWN, MOVE_LEFT, MOVE_RIGHT, MOVE_UP]
	return(moves[rd.randint(0,3)])

def randoMoveUpgraded(mazeMap,playerLocation):
    moves=[]
    if tuple(np.add(playerLocation,(0,1))) in mazeMap[playerLocation]:
        moves.append(MOVE_RIGHT)
    if tuple(np.add(playerLocation,(0,-1))) in mazeMap[playerLocation]:
        moves.append(MOVE_LEFT)
    if tuple(np.add(playerLocation,(1,0))) in mazeMap[playerLocation]:
        moves.append(MOVE_DOWN)
    if tuple(np.add(playerLocation,(-1,0))) in mazeMap[playerLocation]:
        moves.append(MOVE_UP)
    return(moves[rd.randint(0,len(moves)-1)])
	
def listDiscoveryMoves(playerLocation, mazeMap): #Trouver les mouvements possibles vers une case non visitee
	moves = []
	for neighbor in mazeMap[playerLocation] :
		if neighbor not in visitedCells :
			move = moveFromLocations(playerLocation, neighbor) #Up / Down / Left/ Right
			moves.append(move)
	return moves


def preprocessing (mazeMap, mazeWidth, mazeHeight, playerLocation, opponentLocation, piecesOfCheese, timeAllowed) :
	pass

def turn (mazeMap, mazeWidth, mazeHeight, playerLocation, opponentLocation, playerScore, opponentScore, piecesOfCheese, timeAllowed) :
	global visitedCells
	if playerLocation not in visitedCells:
		visitedCells.append(playerLocation)
	moves = listDiscoveryMoves(playerLocation, mazeMap)
	if moves:
		return moves[rd.randint(0,len(moves)-1)]
	else:
		return(randoMoveUpgraded(mazeMap, playerLocation))
    





