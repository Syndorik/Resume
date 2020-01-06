const int PIEZO = 8;
const int BF = 19000;
const int MF = 20000;
const int HF = 21000;
const int DURATION = 25;
const int DURA = 40;
const char* MYNAME = "Alexandre Allani\n";
const int LEN = strlen(MYNAME);

int previous = BF;

void tsend(char c){
  int tmp;

  for(int k=7; k>=0; k--){
    tmp = (int) ((c>>k)&0x01);
    switch(previous){
      case HF:
        if(tmp){
          tone(PIEZO,MF,DURATION);
          delay(DURA);
          previous = MF;
          Serial.print("MF");Serial.print(" ");
        }else{
          tone(PIEZO,BF,DURATION);
          delay(DURA);
          previous = BF;
          Serial.print("BF");Serial.print(" ");
        }
        break;  
      
      case MF:
        if(tmp){
          tone(PIEZO,BF,DURATION);
          delay(DURA);
          previous = BF;
          Serial.print("BF");Serial.print(" ");
        }else{
          tone(PIEZO,HF,DURATION);
          delay(DURA);
          previous= HF;
          Serial.print("HF");Serial.print(" ");
        }
        break;
      
      case BF:
        if(tmp){
          tone(PIEZO,HF,DURATION);
          delay(DURA);
          previous = HF;
          Serial.print("HF");Serial.print(" ");
        }
        else{
          tone(PIEZO,MF,DURATION);
          delay(DURA);
          previous = MF;
          Serial.print("MF");Serial.print(" ");
        }
        break;
    }
  }
}

void setup() {
  Serial.begin(9600);

}

void loop() {
  for(int i =0; i<LEN;i++){
    tsend(MYNAME[i]);
    Serial.println();
  }
}
