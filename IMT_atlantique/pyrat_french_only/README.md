
# Pyrat (French only)
This projects is revolving around the travelling salesman problem. I had a snake on a randomly generated maze. The snake had to retrieve all the cheese in it. And I had a pre-processing of 3 second. Each file in this folder is an algorithm that I made to solve this problem the fatest way possible. (Python)


Project done in IMT Atlantique (Former Télécom Bretagne)

## Algorithm
I will not go through all the algorithms. However most of them are based on Dijkstra algorithm. This algorithm allowed me to retrieve the shortest distance between the snake and the Cheese. 

**Greedy algorithm**
The algorithm computes where is the nearest cheese and compute the shortest path thanks to Dijkstra Algorithm

**Solution to the travel salesman problem**
This algorithm tests all the possible path and take the best one. However this is a very computing intensive tasks, and above 7 cheeses in the maze, the pre-processing time is getting a lot bigger.

**Mix between Greedy algorithm and solution to the travel salesman problem**
The final algorithm I came up with was a mix between the two. First I look at the 5 nearest cheese, search for the solution of the travel salesman problem for those 5 cheeses. Then for the 6th cheese to take, I do the Greedy algorithm, and then again I look at the 5 nearest cheeses of the 6th cheese and repeat the process. 