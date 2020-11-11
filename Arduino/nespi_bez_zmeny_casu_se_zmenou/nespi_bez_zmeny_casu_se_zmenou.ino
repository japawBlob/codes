
/*
  Prints time stamps for 5 seconds using getXXX functions
  Based on DS3231_set.pde
  by Eric Ayars
  4/11
  Added printing back of time stamps and increased baud rate
  (to better synchronize computer and RTC)
  Andy Wickert
  5/15/2011
*/
#include  <RTClib.h>
//#include <DS3231.h>
#include <Wire.h>

RTC_DS3231 clock;

bool century = false;
bool h12Flag;
bool pmFlag;

int led_12 = 2;
int led_9 = 5;
int led_6 = 8;
int led_3 = 11;

int minutes12;
int minutes9;
int minutes6;
int minutes3;
int alarmTime;

int buzzer = 9;
int reset_out = 10;
int alarm = 12;

int reset_button = A0;
int alarm_button = A1;
int wait_amount_switch = A2;

void setup() {
  // Start the serial port
  //Serial.begin(57600);

  // Start the I2C interface
  Wire.begin();

  setup_timers();

  pinMode(led_12, OUTPUT);
  pinMode(led_9, OUTPUT);
  pinMode(led_6, OUTPUT);
  pinMode(led_3, OUTPUT);
  pinMode(alarm, OUTPUT);
  pinMode(reset_out, OUTPUT);
  pinMode(buzzer, OUTPUT);

  pinMode(reset_button, INPUT_PULLUP);
  pinMode(wait_amount_switch, INPUT_PULLUP);
  pinMode(alarm_button, INPUT_PULLUP);

  pinMode(LED_BUILTIN, OUTPUT);
}

unsigned int counter = 0;
int local_time = -1;
bool pushed = false;
bool change;
bool anounced = false;
int twoSecondDelay = -1;
bool poplach;

void loop() {
  if (clock.now().hour() >= 6 && (clock.now().hour() < 20)) {
    if (local_time != clock.now().second()) {
      counter++;
      local_time = clock.now().second();
      //printy();
      if(twoSecondDelay == local_time){
        digitalWrite(reset_out, LOW);
        //twoSecondDelay = -1;
        digitalWrite(led_12, LOW);
      }
      if(twoSecondDelay-1 == local_time){
        digitalWrite(reset_out, LOW);
        //twoSecondDelay = -1;
        digitalWrite(led_12, HIGH);
      }
      if (change) {
        counter = 0;
        change = false;
        digitalWrite(reset_out, HIGH);
        twoSecondDelay = local_time + 2;
        digitalWrite(led_12, LOW);
        poplach = false;
      }

      if (poplach) {
        digitalWrite(alarm, HIGH);
        digitalWrite(LED_BUILTIN, HIGH);
        if(counter%2 == 1){
          digitalWrite(led_3, HIGH);
        } else {
          digitalWrite(led_3, LOW);
        }
      } else {
        digitalWrite(alarm, LOW);
        digitalWrite(led_3, LOW);
      }

      
      if (clock.now().hour() == 6 && anounced == false) {
        analogWrite(buzzer, 200);
        delay(500);
        analogWrite(buzzer, 0);
        delay(500);
        analogWrite(buzzer, 200);
        delay(500);
        analogWrite(buzzer, 0);
        anounced = true;
        counter = 0;
        digitalWrite(led_12, LOW);
        digitalWrite(led_9, LOW);
        digitalWrite(led_6, LOW);
        digitalWrite(led_3, LOW);
        setup_timers();
        if(digitalRead(alarm) == HIGH){
          poplach = true;
        }
        
      }
    }
    if (digitalRead(reset_button) == LOW && !pushed) {
      change = true;
      pushed = true;
      local_time = -1;
    }
    if (digitalRead(reset_button) == HIGH && pushed) {
      change = true;
      pushed = false;
      local_time = -1;
    }
    if (digitalRead(alarm_button) == LOW) {
      local_time = -1;
      poplach = true;
    }
  } else {
    if (anounced == true) {
      analogWrite(buzzer, 200);
      delay(500);
      analogWrite(buzzer, 0);
      anounced = false;
    }
    if (local_time != clock.now().second()) {
      local_time = clock.now().second();
      counter++;
      
      //printy();
      
      if(twoSecondDelay == local_time){
        digitalWrite(reset_out, LOW);
        twoSecondDelay = -1;
        digitalWrite(led_12, LOW);
      }
      if(twoSecondDelay-1 == local_time){
        digitalWrite(reset_out, LOW);
        twoSecondDelay = -1;
        digitalWrite(led_12, HIGH);
      }
      
      if (change) {
        counter = 0;
        change = false;
        digitalWrite(reset_out, HIGH);
        twoSecondDelay = local_time + 2;
        digitalWrite(led_12, LOW);
      }

      if (counter >= minutes12) {
        digitalWrite(led_12, HIGH);
      } else {
        digitalWrite(led_12, LOW);
      }
      if (counter >= minutes9) {
        digitalWrite(led_9, HIGH);
      } else {
        digitalWrite(led_9, LOW);
      }
      if (counter >= minutes6) {
        digitalWrite(led_6, HIGH);
      } else {
        digitalWrite(led_6, LOW);
      }
      if (counter >= minutes3) {
        digitalWrite(led_3, HIGH);
      } else {
        digitalWrite(led_3, LOW);
      }
      if (counter >= alarmTime) {
        digitalWrite(alarm, HIGH);
        digitalWrite(LED_BUILTIN, HIGH);
        if(counter%2 == 1){
          digitalWrite(led_3, HIGH);
        } else {
          digitalWrite(led_3, LOW);
        }
      } else {
        digitalWrite(alarm, LOW);
      }
      if(clock.now().dayOfTheWeek() == 0 && clock.now().month() == 3 && clock.now().day() >= 26 && clock.now().day() <= 31 && clock.now().hour() == 2 && clock.now().minute() == 0 && clock.now().second() == 0){
        clock.adjust(DateTime(clock.now().year(), clock.now().month(), clock.now().day(), clock.now().hour()+1, clock.now().minute(), clock.now().second()));    
      }
      if(clock.now().dayOfTheWeek() == 0 && clock.now().month() == 10 && clock.now().day() >= 26 && clock.now().day() <= 31 && clock.now().hour() == 3 && clock.now().minute() == 0 && clock.now().second() == 0){
        clock.adjust(DateTime(clock.now().year(), clock.now().month(), clock.now().day(), clock.now().hour()-1, clock.now().minute(), clock.now().second()));    
      }
    }

    if (digitalRead(reset_button) == LOW && !pushed) {
      change = true;
      pushed = true;
      local_time = -1;
    }
    if (digitalRead(reset_button) == HIGH && pushed) {
      change = true;
      pushed = false;
      local_time = -1;
    }
    if (digitalRead(alarm_button) == LOW) {
      local_time = -1;
      counter = 32767;
    }
  }
  /*
    delay(1000);
    Serial.print(clock.getYear(), DEC);
    Serial.print("-");
    Serial.print(clock.getMonth(century), DEC);
    Serial.print("-");
    Serial.print(clock.getDate(), DEC);
    Serial.print(" ");
    Serial.print(clock.getHour(h12Flag, pmFlag), DEC); //24-hr
    Serial.print(":");
    Serial.print(clock.getMinute(), DEC);
    Serial.print(":");
    Serial.println(clock.getSecond(), DEC);
  */
}

const int minute = 60;

void setup_timers() {
  if (digitalRead(wait_amount_switch) == HIGH) {
    minutes12 = 15*minute + 60*minute;
    minutes9 = 30*minute + 60*minute;
    minutes6 = 45*minute + 60*minute;
    minutes3 = 55*minute + 60*minute;
    alarmTime = 65*minute + 60*minute;
  } else {
    minutes12 = 15*minute;
    minutes9 = 30*minute;
    minutes6 = 45*minute;
    minutes3 = 55*minute;
    alarmTime = 65*minute;
  }
}

void printy(){
  Serial.print("Counter nyní ");
  Serial.print(counter, DEC);
  Serial.println("");
  Serial.print("minutes12 ");
  Serial.print(minutes12, DEC);
  Serial.println("");
  Serial.println(poplach);
  Serial.println(clock.now().dayOfTheWeek());

  Serial.print(clock.now().year(), DEC);
  Serial.print("-");
  Serial.print(clock.now().month(), DEC);
  Serial.print("-");
  Serial.print(clock.now().day(), DEC);
  Serial.print(" ");
  Serial.print(clock.now().hour(), DEC); //24-hr
  Serial.print(":");
  Serial.print(clock.now().minute(), DEC);
  Serial.print(":");
  Serial.println(clock.now().second(), DEC);
}
