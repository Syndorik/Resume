
int incomingByte = 0;
// variable to hold sensor value
int sensorValue;
// variable to calibrate low value
int sensorLow = 1023;
// variable to calibrate high value
int sensorHigh = 0;
// LED pin
const int ledPin = 13;
const int DELAY = 2;

const int ONE = 1;
const int ZERO = 0;

//The sensor can be decalibrated at one point. So if the level is under the minimum value or above the maximum Value
//We change the value detecte by the sensor respectively to min and max value. 
void checkValue() {
  if (sensorValue > sensorHigh) {
    sensorValue = sensorHigh;
  }
  else if (sensorValue < sensorLow) {
    sensorValue = sensorLow;
  }
}

//If the light detected by the sensor is above a certain threshold, it's a '1' otherwise it's a '0'
int translate(int pitch) {
  if (pitch > 400) {
    pitch = ONE;
    return pitch;
  }
  else {
    pitch = ZERO;
    return pitch;
  }
}


//This function is in a first is emmiting the char bit per bits. This means that in a first part, the light is emitted, and in the other part it's detected by the sensor
void choose(char c) {
  int pitch;
  int char_2_send[8];
  char letter = 0;

  //Emiting and receiving each bit of the char. A char is coded on 8 bits so that's why the for-loop is limited to 8 loops. 
  for (int k = 7; k >= 0; k--) {
    int tmp = ((int) (c >> k) & 0x01); //Checking wether a '1' or a '0' should be emitted

    //We turn on the light (or keep it on). The delay is here so that the sensor actually detects the light
    if ( tmp == 1) {
      digitalWrite(ledPin, HIGH); 
      delay(DELAY / 2);
      sensorValue = analogRead(A0);
      delay(DELAY / 2);
      checkValue();
      pitch = map(sensorValue, sensorLow - 1, sensorHigh, 0, 1000);
      char_2_send[k] = translate(pitch);

      //Serial.print("Sensor Value :"); Serial.println(sensorValue);
      //Serial.print("The input is :"); Serial.print(tmp); Serial.print(" and "); Serial.print("led HIGH = " ); Serial.println(pitch);
    }

    //Light is turned off (or kept off). The sensor detects it as a 0.
    else {
      digitalWrite(ledPin, LOW);
      delay(DELAY / 2);
      sensorValue = analogRead(A0);
      delay(DELAY / 2);
      checkValue();
      pitch = map(sensorValue, sensorLow - 1, sensorHigh, 0, 1000);
      char_2_send[k] = translate(pitch);

      //Serial.print("Sensor Value :"); Serial.println(sensorValue);
      //Serial.print("The input is :"); Serial.print(tmp); Serial.print(" and "); Serial.print("led LOW = "); Serial.println(pitch);
    }
    
    letter = letter + (char_2_send[k] << k); //At the end of the forloop we have the letter we wanted to have. 
    
    //Serial.print("Le bit : ");Serial.print(char_2_send[k]); Serial.print(" Et la conv en nombre : ");Serial.println(char_2_send[k]<<k);Serial.print("Letter A= ");Serial.println((int) letter);
  }
  //Serial.print("The letter is : "); Serial.print(letter);Serial.print(" And The number corresponding is : "); Serial.println((int) letter);
  
  Serial.print(letter); //Each Time a letter is received, it's printed
}

/*
 *
 */

void setup() {
  // Make the LED pin an output and turn it on
  pinMode(ledPin, OUTPUT);
  digitalWrite(ledPin, HIGH);
  Serial.begin(9600);

  // calibrate for the first 21 seconds after program runs
  while (millis() < 7000) {
    // record the maximum sensor value
    sensorValue = analogRead(A0);
    if (sensorValue > sensorHigh) {
      sensorHigh = sensorValue;
    }
  }

  digitalWrite(ledPin, LOW);
  while (millis() < 14000) {
    // record the maximum sensor value
    sensorValue = analogRead(A0);
    if (sensorValue < sensorLow) {
      sensorLow = sensorValue;
    }
  }

  Serial.print("sensorLow :"); Serial.println(sensorLow);
  Serial.print("sensorHigh :"); Serial.println(sensorHigh);
  Serial.println("#########################");
  delay(1000);
}

void loop() {
  //This system works also if you write on the Serial link. Open the Serial Monitor and send something in it. 
  //However there's a buffer limit of 64 bytes. So you can actually only send 64 char through this method.   
  if (Serial.available() > 0) {
    // read the incoming byte:
    incomingByte = Serial.read();

    choose(incomingByte);
  }

  // If Nothing is received on the Serial Link, my Student ID will be printed over and over. 
  else {
    char* d = "20186024\n";
    int len_d = strlen(d);
    for (int i = 0; i < len_d; i++) {
      choose(d[i]);
    }
    delay(1000);
  }
}

