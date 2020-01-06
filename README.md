
# Projects
This is the github presenting all the project I have done. Each subfolder have a README, describing what was the purpose of the project and the important files.

## List of subdirectories

### Projects in Imperial College of London (inside imperial directory)

**maths_for_ml**
Various courseworks including the development of:
- Linear Model algorithm
- Bayesian Model algorithm
- LDA
- PCA, KPCA
- SVM

**reinforcement_leraning/gridworld**
Understanding of Markov Decision Process and basics of Reinforcement learning in a Grid World.
With this project, I learned the underlying maths of Reinforcement learning and had the chance to code the main algorithms : Value Iteration, Policy Iteration, Tabular Q-learning ...

**reinforcement_leraning/maze_traversal**
Using PyTorch, I developed a deepQ learning Neural Network with some optimization to make an agent learn the best path to take to go from point A to point B.
The constraints were:
- 10 minutes of training
- Using only scalable methods
- No use of Gradient Policies

My agent was able to solve easy to medium-difficult mazes.

**machine_learning_basics/decision_tree**
In this group project, I developed a Decision Tree framework in Python. This framework includes:
- single-threaded decision tree
- a parallelized version of a decision
- testing methods (Cross-Validation, confusion Matrix ...)
- pruning of decision tree
- Graphic representation of a decision tree

The framework was tested on a real-life problem: predict the localization of a person in a flat, based on the strength of each wifi access points.
The framework gave expected results.

**machine_learning_basics/neural_network**
In this group project, I developed a Neural Network Framework. It includes:
- Linear layer
- Activation functions layer (sigmoid ...)
- Evaluation layers (Binary Cross entropy ...)

Then we used TensorFlow to solve a classification task in insurance pricing.

Finally using TensorFlow again, we created another insurance pricing model using real-world data. Our model was competing against models of other classmates. The purpose was to give the best pricing for each individual according to their risk. Each individual then chooses automatically the lower price among those proposed. Models were then ranked according to the profit they made.

### Projects in IMT Atlantique -former Télécom Bretagne- (Brest, France) (inside IMT_atlantique directory)

**datamining_PUBG**
This folder contains my datamining project related to the Kaggle Challenge on PUBG. PUBG is a game where 100 people drop on a map. The goal of the game is to be the only survivor by killing everyone else. The purpose of the project is to predict the rank of each player during a game based on their statistics. (Python/Scikit-Learn)

**devops**
Contains the application that was deployed on OpenStack using docker. Contains also some scripts (Ansible and heat templates), that helped the deployment. (Some parts are in French) **(Docker / OpenStack)**

**network_application**
Chat Application with the possibility to watch movies in the chatroom. The only part I developped was the networking part. I did not make the GUI. (Python)

**pixar_project**
This folder contains my part of the source code for the Pixar typed lamp. Especially it contains the protocol allowing a user to transmit moving command to the lamp. The subfolder "TestForTheLamp" contains a test that we made on a lamp. (Arduino / C++)

**pyrat_french_only** 
This projects is revolving around the travelling salesman problem. I had a snake on a randomly generated maze. The snake had to retrieve all the cheese in it. And I had a pre-processing of 3 second. Each file in this folder is an algorithm that I made to solve this problem the fatest way possible. (Python)

**statistics**
This project was about making a survey on film culture and analyse this survey with inferential statistics. You will find in this folders, the results of the survey, the source code and a report about the project. (Project in French)


### Projects in KAIST  (Daejeon, South Korea) (inside KAIST directory)

**mobile_computing**
 Contains 4 different project  :
- WeatherApp : A "simple" weather application. Objectives of this project : learn about Threads/AsyncTask. Connect to a distant base. Use activities and widgets. (Android Studio / Java)
- Arduino Assignement : Implement a light-based protocol. According to the blinks of a LED light, the receiver (which is also on the Arduino) will decrypt the message. (Arduino / C++)
- HighFreqCommunication : Involves an Android Application and Arduino. The Arduino is sending (according to a protocol based on 3 frequencies 19KHz, 20KHz, 21KHz) a message that the Android Application has to decode. (Arduino/C++, Android Studio/Java)
- SpeakerAndStrobe : This Folder include two applications. In the subfolder "LightPart" you will find an application that turns the phone flashlight into a strobelight that reacts to the music. This means that the light will blink according to the ryhtm of the music. In the subfolder "Whole Application Source Code" you will find the application that connects two smartphones and turn them into (almost) synchronized speakers, with the flashlight acting as a strobelight. (Android Studio/ Java)

**software_engineering**
This folder contains the TimeTable applicaiton I made for this course. I was the only developper on the team. You will find also the SRS and SDD of the project. (Android / Java)

**system_programming_labs**
Contains the 7 Labs made during my semester in Korea. Each of them is described in the subfolder. (C / Assembly)