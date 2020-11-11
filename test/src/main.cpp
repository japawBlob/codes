#include <Arduino.h>

const int resetPin = 7;
const int clockPin = 8;
const int dataPin = 9;

const int startButton = A0;
const int increaseButton = 3;
const int decreaseButton = 4;
const int confirmButton = 5;

const int lightPin = A2;

//#define seconds() (millis()/1000)

unsigned long currentTime = 0;

const int numbers[10] = {
  B01100000, B11011010, B11110010, B01100110, B10110110,
  B10111111, B11100000, B11111111, B11110111, B11111100
};

int countdownActivated = 0;
//int i = 0;
int pushedStart = 0, pushedInc = 0, pushedDec = 0, pushedConf = 0;
int defaultValue = 7;
int counter = defaultValue;
int tempValue = defaultValue;

void updateDisplay(int numbers);

void setup() {
  pinMode(resetPin, OUTPUT);
  pinMode(clockPin, OUTPUT);
  pinMode(dataPin, OUTPUT);
  pinMode(lightPin, OUTPUT);
  pinMode(startButton, INPUT_PULLUP);
  pinMode(increaseButton, INPUT_PULLUP);
  pinMode(decreaseButton, INPUT_PULLUP);
  pinMode(confirmButton, INPUT_PULLUP);
  Serial.begin(115200);
  Serial.println("reset");
  digitalWrite(resetPin, HIGH);
  //digitalWrite(clockPin, LOW);
  //(100);
  //digitalWrite(clockPin, HIGH);
  Serial.begin(9600);
  Serial.println("Start");

  updateDisplay(defaultValue);
}

void loop() {


  if (countdownActivated == 1) {
    digitalWrite(lightPin, 1);
    if (millis() >= currentTime) {
      if (counter > 0) {
        //int number = ~numbers[counter - 1];
        currentTime = millis() + 1000;
        updateDisplay(counter);
        counter--;
        Serial.println(counter);
      } else {
        countdownActivated = 0;
        digitalWrite(lightPin, 0);
        counter = defaultValue;
        //int number = ~numbers[counter - 1];
        updateDisplay(counter);
      }
    }
  }

  if (digitalRead(startButton) == LOW && pushedStart == 0) {
    Serial.println("startButton: Pressed");
    currentTime = 0;
    countdownActivated = 1;
    counter = defaultValue;
    tempValue = defaultValue;
    pushedStart = 1;
  } else if (digitalRead(startButton) == HIGH && pushedStart == 1){
    pushedStart = 0;
  }
  
  if (digitalRead(increaseButton) == LOW && pushedInc == 0 && countdownActivated == 0) {
    Serial.println("increaseButton: Pressed");
    tempValue < 10 ? tempValue++ : 1;
    //updateDisplay(~numbers[tempValue - 1]);
    updateDisplay(tempValue);
    pushedInc = 1;
  } else if (digitalRead(increaseButton) == HIGH && pushedInc == 1 && countdownActivated == 0){
    pushedInc = 0;
  }
  if (digitalRead(decreaseButton) == LOW && pushedDec == 0 && countdownActivated == 0) {
    Serial.println("decreaseButton: Pressed");
    //if(tempValue>1) tempValue--;
    tempValue > 1 ? tempValue-- : 1;
    //updateDisplay(~numbers[tempValue - 1]);
    updateDisplay(tempValue);
    pushedDec = 1;
  } else  if (digitalRead(decreaseButton) == HIGH && pushedDec == 1){
    pushedDec = 0;
  }
  if (digitalRead(confirmButton) == LOW && pushedConf == 0 && countdownActivated == 0) {
    Serial.println("confirmButton: Pressed");
    defaultValue = tempValue;
    //updateDisplay(~numbers[tempValue - 1];)
    pushedConf = 1;
  } else  if (digitalRead(confirmButton) == HIGH && pushedConf == 1){
    pushedConf = 0;
  }
}
void updateDisplay(int number){
  number = ~numbers[number - 1];
  int i = 0;
  while (i < 8) {
      Serial.println(currentTime);

      digitalWrite(clockPin, LOW);
      digitalWrite(dataPin, bitRead(number, i));
      //delay(500);
      digitalWrite(clockPin, HIGH);
      //delay(500);
      //registerWriteZero();
      i++;
    }
    //delay(1000);
}