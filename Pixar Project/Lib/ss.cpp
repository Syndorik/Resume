#include "ss.h"
#include <stdlib.h> 
#include <Arduino.h>
#include <MemoryFree.h>



/*
WE HAVE TO CREATE TWO CLASS ONE FOR BIG STRING AN OTHER ONE FOR LITTLE STRING!
WE HAVE TO USE STATIC VARIABLE FOR EACH BUFFER !
*/
Ss::Ss(char* k){
  this->length = strlen(k);
  strcpy(this->content,k);
  this->content[length] = '\0';
  this->string = this->content;
}





Ss::~Ss(){
  //free(this->string);
}

int Ss::lengthh(){
  this->length = strlen(this->string);
  return this->length;
}

int Ss::getlength(){
  return this->length;
}

char* Ss::getString(){
  return this->string;
}



void Ss::setString(char* k){
  this->length = strlen(k);
  strcpy(this->content,k);
  this->content[length] = '\0';
  this->string = this->content;

}





char Ss::charAt(int n){
  return this->string[n];

}


Ss& Ss::operator=( const Ss& other ) {
      length = other.length;
      //Serial.println(other.length);
      strcpy(content,other.string);
      string = content;
      content[length] = '\0';
      string = content;
      //Serial.println(string);
      return *this;
  }




void Ss::concatt(char* txt2){
  const int l1 = strlen(this->getString());
  const int l2 = strlen(txt2);
  char* var = this->getString();
  const int ltot = l1+l2;
  char txtconcat[ltot+1] ;
  strncpy(txtconcat,var,l1);
  txtconcat[l1] = '\0';
  strcat(txtconcat,txt2);
  txtconcat[l1+l2] = '\0';
  this->setString(txtconcat);
}




char* Ss::substring( int n){
      char intern[1] = {'\0'};
      Ss gauche(intern);
      char c[2] = {'0','\0'};
      for(int k=0; k<n; k++){
        c[0] = this->charAt(k);
        c[1] = '\0';
        gauche.concatt(c);
      }
      gauche.lengthh();
      return gauche.getString();
      //Serial.print(F("On est dans la fonction substring      ")); Serial.println(gauche.getString());
}






void Ss::remove(int pos, int nbchar){
  char intern[1] = {'\0'};
  Ss left(intern);
  left.setString(this->substring(pos));
  char c[2] = {'0','\0'};
  for(int k=pos+nbchar; k<this->getlength(); k++){
    c[0] = this->charAt(k);
    c[1] = '\0';
    left.concatt(c);
  }
  this->setString(left.getString());

}
