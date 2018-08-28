#ifndef LAMPE_H
#define LAMPE_H

#include "Motor.h"
#include <Arduino.h>
#include <ss.h>
#include <lss.h>

class Lampe
{
    public:
        Lampe();
        void addMotor();
        void parseJson(Ss*, int);
        ~Lampe();
        void affiche();

        //ParseJson function
        static void find_onechar_and_remove(Ss*,char);
        static void find_allchar_and_remove(Ss*,char);
        static char* until_find_charac(Ss*,char,bool);
        static void find_acc(int&,char&,Ss*);
        static bool find_vector(int&, Motor*, char*, int&);
        static void maj(Motor*, int , Moteur_t, Direct_t, int, float);
        static void getvalue(lSs* ,Moteur_t&, Direct_t&, int&, float&);


        //function for little string;
        static void Lfind_onechar_and_remove(lSs*,char);
        static void Lfind_allchar_and_remove(lSs*,char);
        static char* Luntil_find_charac(lSs*,char,bool);
        static void Lfind_acc(int&,char&,lSs*);

        //Vector
        void push_backm(int,Motor,Motor* );
        static void push_backc(int,lSs,lSs*);

        static int freeRam();


        //get/set
        Motor* gettabMoteur();
        lSs* gettabclass();
        lSs* getfeedBack();
        int getqMotors();
        void settabMoteur(Motor*);
        void settabclass(lSs*);
        void setfeedback(lSs*);
        void setqMOtors(int);

    private:
        Motor tabMoteur[10];
        lSs tabclass[3];
        int qMotors=0;
        lSs* feedBack;
};

#endif // LAMPE_H
