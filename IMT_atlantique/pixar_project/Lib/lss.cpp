#include "lss.h"
#include <stdlib.h> 
#include <Arduino.h>
#include <MemoryFree.h>



/*
WE HAVE TO CREATE TWO CLASS ONE FOR BIG STRING AN OTHER ONE FOR LITTLE STRING!
WE HAVE TO USE STATIC VARIABLE FOR EACH BUFFER !
*/
lSs::lSs(char* k){
  this->length = strlen(k);
  strcpy(this->content,k);
  this->content[length] = '\0';
  this->string = this->content;
}

lSs::lSs(){
  
}




lSs::~lSs(){
  //free(this->string);
}

int lSs::lengthh(){
  this->length = strlen(this->string);
  return this->length;
}

int lSs::getlength(){
  return this->length;
}

char* lSs::getString(){
  return this->string;
}



void lSs::setString(char* k){
  this->length = strlen(k);
  strcpy(this->content,k);
  this->content[length] = '\0';
  this->string = this->content;

}





char lSs::charAt(int n){
  return this->string[n];

}


lSs& lSs::operator=( const lSs& other ) {
      length = other.length;
      //Serial.println(other.length);
      strcpy(content,other.string);
      string = content;
      content[length] = '\0';
      string = content;
      //Serial.println(string);
      return *this;
  }




void lSs::concatt(char* txt2){
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




char* lSs::substring( int n){
      char intern[1] = {'\0'};
      lSs gauche(intern);
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






void lSs::remove(int pos, int nbchar){
  char intern[1] = {'\0'};
  lSs left(intern);
  left.setString(this->substring(pos));
  char c[2] = {'0','\0'};
  for(int k=pos+nbchar; k<this->getlength(); k++){
    c[0] = this->charAt(k);
    c[1] = '\0';
    left.concatt(c);
  }
  this->setString(left.getString());

}
