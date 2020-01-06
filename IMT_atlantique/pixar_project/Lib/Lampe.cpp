#include "Lampe.h"
#include <Arduino.h>
#include "Motor.h"
#include <ss.h>
#include <lss.h>


Lampe::Lampe()
{
    //ctor
}

Lampe::~Lampe()
{
    //dtor
}

//VECTOR

//Vector
void Lampe::push_backm(int n, Motor ff, Motor tbf[]){
    tbf[n] = ff;
 }

void Lampe::push_backc(int n, lSs ff, lSs tbf[]){
    tbf[n] = ff;
}





int Lampe::freeRam () {
  extern int __heap_start, *__brkval; 
  int v; 
  return (int) &v - (__brkval == 0 ? (int) &__heap_start : (int) __brkval); 
}







//set and get

Motor* Lampe::gettabMoteur(){
    return this->tabMoteur;
}

lSs* Lampe::gettabclass(){
   return this->tabclass;
}

lSs* Lampe::getfeedBack(){
    return this->feedBack;
}

int Lampe::getqMotors(){
    return qMotors;
}

void Lampe::settabMoteur(Motor tbm[] ){
    for(int k=0; k<10;k++){
        this->tabMoteur[k] = tbm[k];
    }
}

void Lampe::settabclass(lSs tbc[]){
    for(int k=0; k<10;k++){
        this->tabclass[k] = tbc[k];
    }
}

void Lampe::setfeedback(lSs* fB){
    this->feedBack = fB;
}

void Lampe::setqMOtors(int qM){
    this->qMotors = qM;
}


//function for little strings

void Lampe::Lfind_onechar_and_remove(lSs* text, char charac){
    for( unsigned int n=0; n< text->lengthh(); n++){
        if(text->charAt(n) == charac){
            text->remove(n,1);
            n = text->lengthh();
        }
    }
}


void Lampe::Lfind_acc(int& i,char& cc, lSs* text){
    for(unsigned int n=0; n<text->lengthh();n++){
        if((text->charAt(n) == '{') || (text->charAt(n) =='}')){
            cc = text->charAt(n);
            i = n;
            break;
        }
    }
}

void Lampe::Lfind_allchar_and_remove(lSs* text, char charac){
    for( unsigned int n=0; n< text->lengthh(); n++){
      if(text->charAt(n) == charac){
            text->remove(n,1);
            n--;
        }
    }
}


char* Lampe::Luntil_find_charac(lSs* text, char charac, bool b){ // PREND 300 OCTETS A UN MOMENT FAIRE GAFFE DE OUF; TOUJOURS ETRE SUPERIEUR A 300 OCTETS

    int n(0);
    int len = text->lengthh();
    while(text->charAt(n) != charac){
        if(len-1 == n){
            b=0;
            break;
        }
        n++;
    }
    char cou[70];
    strcpy(cou,text->substring(n));
    cou[strlen(text->substring(n))] = '\0';
    if (b==1){
        text->remove(0,n);
    }
    return cou;
}




//ParseJson functions
void Lampe::find_onechar_and_remove(Ss* text, char charac){
    for( unsigned int n=0; n< text->lengthh(); n++){
        if(text->charAt(n) == charac){
            text->remove(n,1);
            n = text->lengthh();
        }
    }
}


void Lampe::find_acc(int& i,char& cc, Ss* text){
    for(unsigned int n=0; n<text->lengthh();n++){
        if((text->charAt(n) == '{') || (text->charAt(n) =='}')){
            cc = text->charAt(n);
            i = n;
            break;
        }
    }
}

void Lampe::find_allchar_and_remove(Ss* text, char charac){
    for( unsigned int n=0; n< text->lengthh(); n++){
      if(text->charAt(n) == charac){
            text->remove(n,1);
            n--;
        }
    }
}


char* Lampe::until_find_charac(Ss* text, char charac, bool b){ // PREND 300 OCTETS A UN MOMENT FAIRE GAFFE DE OUF; TOUJOURS ETRE SUPERIEUR A 300 OCTETS

    int n(0);
    int len = text->lengthh();
    while(text->charAt(n) != charac){
        if(len-1 == n){
            b=0;
            break;
        }
        n++;
    }
    char cou[70];
    strcpy(cou,text->substring(n));
    cou[strlen(text->substring(n))] = '\0';
    if (b==1){
        text->remove(0,n);
    }
    return cou;
}


bool Lampe::find_vector(int& tablength, Motor tabmot[], char* m, int& i){
    bool b(0);
    for( unsigned int n=0; n< tablength; n++){
        if(strlen(m) == 1){
          if((m[0] == tabmot[n].getName()[0])){
                b = 1;
                i = n;
                break;
            }
        }
            
        if(strlen(m) == 2){
            if((m[0] == tabmot[n].getName()[0]) and (m[1] == tabmot[n].getName()[1])){
                b = 1;
                i = n;
                break;
            }
        }
            
        if(strlen(m) == 3){
            if((m[0] == tabmot[n].getName()[0]) and (m[1] == tabmot[n].getName()[1]) and (m[2] == tabmot[n].getName()[2])){
                b = 1;
                i = n;
                break;
            }
        }
    }
    return b;
}




void Lampe::getvalue(lSs* txt,Moteur_t& type, Direct_t& direction, int& speed, float& angle){
    lSs one("");
    lSs two("");
    lSs* buffer = &one;
    lSs* buff2 = &two;
    int txtbuf(0);
    
    while(txt->lengthh() != 0){
        txtbuf = txt->lengthh();
        buffer->setString( Lampe::Luntil_find_charac(txt, ',',1));
        
        Lampe::Lfind_onechar_and_remove(txt,',');
        Lampe::Lfind_allchar_and_remove(buffer,'\'');
        Lampe::Lfind_allchar_and_remove(buffer, ' ');
      
        buff2->setString( Lampe::Luntil_find_charac(buffer,':',1));

        //on fait les bails
        if(buff2->getString()[0]== 'a'){
            Lampe::Lfind_onechar_and_remove(buffer,':');
            angle = atof(buffer->getString());
        }
        else if(buff2->getString()[0] == 's'){
            Lampe::Lfind_onechar_and_remove(buffer,':');
            speed = atoi(buffer->getString());
        }
        else if(buff2->getString()[0] =='d'){
            Lampe::Lfind_onechar_and_remove(buffer,':');
             if(buffer->getString()[0] == 'L')
                direction = LEFT;
            else{
                direction = RIGHT;
            }
        }
        else if(buff2->getString()[0]=='t'){
            Lampe::Lfind_onechar_and_remove(buffer,':');
            if(buffer->getString()[1]== 'T'){
                type = STEPPERS;
            }
            else{
                type = SERVOS;
            }
        }
        if (txt->lengthh() == txtbuf){break;}
    }
}


void Lampe::maj(Motor tabmot[],int i, Moteur_t type, Direct_t direction, int speed, float angle){
    tabmot[i].setAngle(angle);
    tabmot[i].setDir(direction);
    tabmot[i].setSpeed(speed);
    tabmot[i].setType(type);
}


void Lampe::parseJson(Ss* text, int sizeoftab){ //600 octets +2*150
    Ss ntxt(text->getString());
    Ss* text2 = &ntxt;
    int cptaco = 0;
    int i = 0;
    int posMot;
    unsigned int avancement = 0;
    char aco('{');
    char acf('}');
    char the_one('{');
    lSs cee("");
    lSs ced("");
    lSs* buf = &cee;
    lSs* buff = &ced; 
    float angle;
    int speed;
    Moteur_t type;
    Direct_t direction;
    int tabmotlength(sizeoftab);
    int tabclasslength(0);
    Motor m1(type,direction,speed,angle,"");
    while (avancement != text->lengthh()){
        find_acc(i,the_one,text2);
        if (the_one == '{'){
            cptaco++;
            if (cptaco == 1){
                find_onechar_and_remove(text2,'{');
                buf->setString(until_find_charac(text2,the_one, 1));
                avancement = text->lengthh() -text2->lengthh();
                Lfind_allchar_and_remove(buf,'\'');
                Lfind_allchar_and_remove(buf,':');
                push_backc(tabclasslength,*buf,this->tabclass);
                tabclasslength++;

            }
            else if (cptaco == 2){
                if(text2->charAt(0) == '{'){
                find_onechar_and_remove(text2,'{');
                }
                buff->setString(until_find_charac(text2,the_one, 1));
                avancement = text->lengthh() -text2->lengthh();
                Lfind_allchar_and_remove(buff,'\'');
                Lfind_allchar_and_remove(buff,':');
                Lfind_allchar_and_remove(buff,' ');

                if (find_vector(tabmotlength,this->tabMoteur,buff->getString(),posMot)){
                    find_onechar_and_remove(text2,'{');
                    buf->setString(until_find_charac(text2,'}',1));
                    avancement = text->lengthh() -text2->lengthh();
                    getvalue(buf,type,direction,speed,angle);
                    maj(this->tabMoteur,posMot,type,direction,speed,angle);
                }
                else{
                    find_onechar_and_remove(text2,'{');
                    buf->setString(until_find_charac(text2,'}',1));
                    avancement = text->lengthh() -text2->lengthh();
                    getvalue(buf,type,direction,speed,angle);
                    m1.setType(type);m1.setDir(direction);m1.setSpeed(speed);m1.setAngle(angle);m1.setName(buff->getString()); // N'EXISTE QUE LA 
                    this->push_backm(tabmotlength,m1,this->tabMoteur);
                    tabmotlength++;
                    this->setqMOtors(tabmotlength);
                    Serial.print(F("Maximum RAM used : "));Serial.println(freeRam());
                }

            }
        }
        else{
            cptaco--;
            find_onechar_and_remove(text2,'}');
            find_acc(i,the_one,text2);
            if(text2->charAt(0) == ','){
                find_onechar_and_remove(text2,',');
            }
            while('}' == the_one){
                cptaco--;
                if((the_one == '{')||(cptaco == -1)){
                    avancement = text->lengthh();
                    break;
                }
                until_find_charac(text2,'}',1);
                find_onechar_and_remove(text2,'}');
                find_acc(i,the_one,text2);
            }
        }


    }
    
}


void Lampe::affiche(){
    Serial.print(F("Name : "));Serial.println(this->gettabMoteur()[0].getName());
    Serial.print(F("Speed : "));Serial.println(this->gettabMoteur()[0].getSpeed());
    Serial.print(F("Angle : "));Serial.println(this->gettabMoteur()[0].getAngle());
    Serial.print(F("Type : "));Serial.println(this->gettabMoteur()[0].getType());
    Serial.print(F("Direction : "));Serial.println(this->gettabMoteur()[0].getDir());

    Serial.println(F("###########"));
    Serial.print(F("Name : "));Serial.println(this->gettabMoteur()[1].getName());
    Serial.print(F("Speed : "));Serial.println(this->gettabMoteur()[1].getSpeed());
    Serial.print(F("Angle : "));Serial.println(this->gettabMoteur()[1].getAngle());
    Serial.print(F("Type : "));Serial.println(this->gettabMoteur()[1].getType());
    Serial.print(F("Direction : "));Serial.println(this->gettabMoteur()[1].getDir());
    Serial.println(F("###########"));
    Serial.print(F("Name : "));Serial.println(this->gettabMoteur()[2].getName());
    Serial.print(F("Speed : "));Serial.println(this->gettabMoteur()[2].getSpeed());
    Serial.print(F("Angle : "));Serial.println(this->gettabMoteur()[2].getAngle());
    Serial.print(F("Type : ")); Serial.println(this->gettabMoteur()[2].getType());
    Serial.print(F("Direction : "));Serial.println(this->gettabMoteur()[2].getDir());
    Serial.println(F("###########"));
    Serial.print(F("Name : "));Serial.println(this->gettabMoteur()[3].getName());
    Serial.print(F("Speed : "));Serial.println(this->gettabMoteur()[3].getSpeed());
    Serial.print(F("Angle : "));Serial.println(this->gettabMoteur()[3].getAngle());
    Serial.print(F("Type : "));Serial.println(this->gettabMoteur()[3].getType());
    Serial.print(F("Direction : "));Serial.println(this->gettabMoteur()[3].getDir());


}
/*
*/