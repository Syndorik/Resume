# Pixar Project
The purpose of this project was to create a lamp that moves and is able to follow the movement of some people. This project was done for a danse troupe.  I implemented the protocol to communicate with the lamp, and more specifically with the motors. 


***Edit***
The protocol is way too heavy for an Arduino card, and it was my first step in C++. I think now that this code has some limitation due to RAM usage. However communicating with JSON messages is still a good point, since the orders are supposed to be given by a Python script runing on a Raspberry PI.


Project done in IMT Atlantique (Former Télécom Bretagne)

## Files & Folders
In this section only the files in the subfolder **Lib** are interesting.

**Lib**
- **DynamixelSerial (.cpp / .h)** : Library created for the motors we had
- **Lampe (.cpp / .h)** :  Main class. This class represents the lamp with all the motors, and the messages it receives.
- **lss (.cpp / .h)** : A light version of the String library I created for the project. This is made for String with a maximum number of 100 char.
- **ss (.cpp/.h)**: A light version of the String library I created for the project. This is made for String with a maximum number of 500 char.
- **Motor (.cpp / .h)**: Class representing the motors and how they react according to the message received.

**MotorLib**
Folder containing a slightly modified version of the Motor library

**ProjetDev**
Folder containing an Arduino program to test the different libraries

**TestForTheLamp**
Folder containing an Arduino program to test if the lamp reacts to a message.

**HeaderLampe.rar**
RarFile containing a compressed version of the libraries

**Read_me_protocol.txt**
/!\/!\ In French /!\/!\ Steps to run the project