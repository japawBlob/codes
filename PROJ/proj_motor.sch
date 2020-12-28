EESchema Schematic File Version 4
LIBS:proj_motor-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Pill helper V1.2 (motor approach)"
Date "2020-12-14"
Rev "1.2"
Comp "FEL CVUT"
Comment1 "First ideas about all potential functionalities of Pill helper using motor"
Comment2 "Most of the functionality is theoretical, implemented features may and will differ"
Comment3 ""
Comment4 "Author: Jakub Jira"
$EndDescr
$Comp
L MCU_Module:Arduino_UNO_R3 A?
U 1 1 5FD8FBFE
P 2500 2050
F 0 "A?" H 2500 3228 50  0000 C CNN
F 1 "Arduino_UNO_R3" H 2500 3137 50  0000 C CNN
F 2 "Module:Arduino_UNO_R3" H 2650 1000 50  0001 L CNN
F 3 "https://www.arduino.cc/en/Main/arduinoBoardUno" H 2300 3100 50  0001 C CNN
	1    2500 2050
	1    0    0    -1  
$EndComp
$Comp
L Device:Rotary_Encoder_KY-040 SW?
U 1 1 5FD97BB7
P 5800 1500
F 0 "SW?" H 5800 1875 50  0001 C CNN
F 1 "Rotary_Encoder_KY-040" H 5800 1783 50  0000 C CNN
F 2 "" H 5650 1660 50  0001 C CNN
F 3 "~" H 5800 1760 50  0001 C CNN
	1    5800 1500
	1    0    0    -1  
$EndComp
Text Notes 5450 1400 0    50   ~ 0
Clk
Text Notes 5450 1500 0    50   ~ 0
DT
Text Notes 5450 1600 0    50   ~ 0
SW
$Comp
L power:GND #PWR?
U 1 1 5FDA60FC
P 6100 1350
F 0 "#PWR?" H 6100 1100 50  0001 C CNN
F 1 "GND" V 6105 1222 50  0000 R CNN
F 2 "" H 6100 1350 50  0001 C CNN
F 3 "" H 6100 1350 50  0001 C CNN
	1    6100 1350
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FDA6182
P 6100 1650
F 0 "#PWR?" H 6100 1500 50  0001 C CNN
F 1 "+5V" V 6115 1778 50  0000 L CNN
F 2 "" H 6100 1650 50  0001 C CNN
F 3 "" H 6100 1650 50  0001 C CNN
	1    6100 1650
	0    1    1    0   
$EndComp
Text GLabel 1800 1750 0    50   Output ~ 0
Rot_Clk
Text GLabel 1800 1850 0    50   Output ~ 0
Rot_DT
Wire Wire Line
	1800 1750 2000 1750
Wire Wire Line
	1800 1850 2000 1850
Text GLabel 4800 1400 0    50   Input ~ 0
Rot_Clk
Text GLabel 4800 1500 0    50   Input ~ 0
Rot_DT
$Comp
L power:+5V #PWR?
U 1 1 5FDA62C3
P 5000 2100
F 0 "#PWR?" H 5000 1950 50  0001 C CNN
F 1 "+5V" V 5015 2228 50  0000 L CNN
F 2 "" H 5000 2100 50  0001 C CNN
F 3 "" H 5000 2100 50  0001 C CNN
	1    5000 2100
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R1
U 1 1 5FDA6344
P 5050 1850
F 0 "R1" H 5120 1896 50  0000 L CNN
F 1 "10k" H 5120 1805 50  0000 L CNN
F 2 "" V 4980 1850 50  0001 C CNN
F 3 "~" H 5050 1850 50  0001 C CNN
	1    5050 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5FDA63AE
P 5350 1850
F 0 "R2" H 5420 1896 50  0000 L CNN
F 1 "10k" H 5420 1805 50  0000 L CNN
F 2 "" V 5280 1850 50  0001 C CNN
F 3 "~" H 5350 1850 50  0001 C CNN
	1    5350 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 1400 5350 1400
Wire Wire Line
	4800 1500 5050 1500
Wire Wire Line
	5050 1700 5050 1500
Connection ~ 5050 1500
Wire Wire Line
	5050 1500 5500 1500
Wire Wire Line
	5350 1400 5350 1700
Connection ~ 5350 1400
Wire Wire Line
	5350 1400 5500 1400
Wire Wire Line
	5000 2100 5050 2100
Wire Wire Line
	5050 2100 5050 2000
Wire Wire Line
	5050 2100 5350 2100
Wire Wire Line
	5350 2100 5350 2000
Connection ~ 5050 2100
Text Notes 4900 2250 0    50   ~ 0
Pull Up resistors
Text GLabel 1800 2550 0    50   Output ~ 0
Alarm
$Comp
L Device:Buzzer BZ?
U 1 1 5FDA69A7
P 8650 3050
F 0 "BZ?" H 8803 3079 50  0001 L CNN
F 1 "Buzzer" H 8803 3033 50  0000 L CNN
F 2 "" V 8625 3150 50  0001 C CNN
F 3 "~" V 8625 3150 50  0001 C CNN
	1    8650 3050
	1    0    0    -1  
$EndComp
Text GLabel 7350 2950 0    50   Input ~ 0
Alarm
$Comp
L power:GND #PWR?
U 1 1 5FDA6EF6
P 8550 3150
F 0 "#PWR?" H 8550 2900 50  0001 C CNN
F 1 "GND" V 8555 3022 50  0000 R CNN
F 2 "" H 8550 3150 50  0001 C CNN
F 3 "" H 8550 3150 50  0001 C CNN
	1    8550 3150
	0    1    1    0   
$EndComp
Text GLabel 1800 1650 0    50   Output ~ 0
Button_User_1
Text GLabel 1800 2150 0    50   Output ~ 0
Button_User_2
Wire Wire Line
	1800 2150 2000 2150
Wire Wire Line
	1800 1650 2000 1650
Wire Wire Line
	1800 2550 2000 2550
Text Notes 7500 3300 0    50   ~ 0
Buzzer and LED for notifying user
$Comp
L Display_Character:EA_T123X-I2C U?
U 1 1 5FDA9357
P 8800 1550
F 0 "U?" H 9229 1596 50  0001 L CNN
F 1 "LCD-I2C-display" H 9229 1550 50  0000 L CNN
F 2 "Display:EA_T123X-I2C" H 8800 950 50  0001 C CNN
F 3 "http://www.lcd-module.de/pdf/doma/t123-i2c.pdf" H 8800 1050 50  0001 C CNN
	1    8800 1550
	1    0    0    -1  
$EndComp
Text Notes 8250 2200 0    50   ~ 0
Generic I2C display\nUsed for displaying time for user
Text GLabel 3300 2450 2    50   Output ~ 0
Display_SDA
Text GLabel 3300 2550 2    50   Output ~ 0
Display_SCL
Wire Wire Line
	3000 2450 3300 2450
Wire Wire Line
	3000 2550 3300 2550
Text GLabel 8000 1350 0    50   Input ~ 0
Display_SDA
Text GLabel 8000 1250 0    50   Input ~ 0
Display_SCL
Wire Wire Line
	8000 1250 8300 1250
Wire Wire Line
	8000 1350 8300 1350
$Comp
L power:+5V #PWR?
U 1 1 5FDAE85E
P 8300 1900
F 0 "#PWR?" H 8300 1750 50  0001 C CNN
F 1 "+5V" V 8315 2028 50  0000 L CNN
F 2 "" H 8300 1900 50  0001 C CNN
F 3 "" H 8300 1900 50  0001 C CNN
	1    8300 1900
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FDAF034
P 8300 1800
F 0 "#PWR?" H 8300 1550 50  0001 C CNN
F 1 "GND" V 8305 1672 50  0000 R CNN
F 2 "" H 8300 1800 50  0001 C CNN
F 3 "" H 8300 1800 50  0001 C CNN
	1    8300 1800
	0    1    1    0   
$EndComp
$Comp
L Device:LED D?
U 1 1 5FDAF8D1
P 8100 2950
F 0 "D?" H 8091 3166 50  0001 C CNN
F 1 "RED_LED" H 8092 2786 50  0000 C CNN
F 2 "" H 8100 2950 50  0001 C CNN
F 3 "~" H 8100 2950 50  0001 C CNN
	1    8100 2950
	-1   0    0    1   
$EndComp
Wire Wire Line
	1800 2250 2000 2250
Wire Wire Line
	1800 2650 2000 2650
$Comp
L Device:R R4
U 1 1 5FDB61AB
P 7650 2950
F 0 "R4" V 7857 2950 50  0000 C CNN
F 1 "470" V 7766 2950 50  0000 C CNN
F 2 "" V 7580 2950 50  0001 C CNN
F 3 "~" H 7650 2950 50  0001 C CNN
	1    7650 2950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7350 2950 7500 2950
Wire Wire Line
	7800 2950 7950 2950
Text GLabel 1800 1450 0    50   Output ~ 0
RX
Text GLabel 1800 1550 0    50   Output ~ 0
TX
Wire Wire Line
	2000 1450 1800 1450
Wire Wire Line
	2000 1550 1800 1550
Text GLabel 8250 5050 0    50   Input ~ 0
RX
Text GLabel 8250 4850 0    50   Input ~ 0
TX
Wire Wire Line
	8250 4850 8500 4850
Wire Wire Line
	8250 5050 8500 5050
$Comp
L power:+3V3 #PWR?
U 1 1 5FDBA398
P 9200 4350
F 0 "#PWR?" H 9200 4200 50  0001 C CNN
F 1 "+3V3" H 9215 4523 50  0000 C CNN
F 2 "" H 9200 4350 50  0001 C CNN
F 3 "" H 9200 4350 50  0001 C CNN
	1    9200 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FDBA3D0
P 9200 5400
F 0 "#PWR?" H 9200 5150 50  0001 C CNN
F 1 "GND" H 9205 5227 50  0000 C CNN
F 2 "" H 9200 5400 50  0001 C CNN
F 3 "" H 9200 5400 50  0001 C CNN
	1    9200 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 5250 9200 5400
Wire Wire Line
	9200 4500 9200 4350
Text Notes 8400 5700 0    50   ~ 0
Scheme for connecting ESP-01S ESP8266
Text GLabel 3300 2050 2    50   Input ~ 0
Keypad
$Comp
L Motor:Stepper_Motor_bipolar M?
U 1 1 5FDDE7B3
P 4150 5100
F 0 "M?" V 4120 4912 50  0000 R CNN
F 1 "Stepper_Motor_bipolar" V 4029 4912 50  0000 R CNN
F 2 "" H 4160 5090 50  0001 C CNN
F 3 "http://www.infineon.com/dgdl/Application-Note-TLE8110EE_driving_UniPolarStepperMotor_V1.1.pdf?fileId=db3a30431be39b97011be5d0aa0a00b0" H 4160 5090 50  0001 C CNN
	1    4150 5100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3200 5050 3850 5050
Wire Wire Line
	3850 5050 3850 5000
Wire Wire Line
	3200 5150 3850 5150
Wire Wire Line
	3850 5150 3850 5200
Wire Wire Line
	3200 5350 3900 5350
Wire Wire Line
	3900 5350 3900 5400
Wire Wire Line
	3900 5400 4050 5400
Wire Wire Line
	3200 5450 4250 5450
Wire Wire Line
	4250 5450 4250 5400
Text GLabel 1800 1950 0    50   Output ~ 0
Motor_IN1
Text GLabel 1800 2050 0    50   Output ~ 0
Motor_IN2
Text GLabel 1800 2350 0    50   Output ~ 0
Motor_IN3
Text GLabel 1800 2450 0    50   Output ~ 0
Motor_IN4
Wire Wire Line
	2000 1950 1800 1950
Wire Wire Line
	2000 2050 1800 2050
Wire Wire Line
	2000 2350 1800 2350
Wire Wire Line
	2000 2450 1800 2450
Text GLabel 1650 5150 0    50   Input ~ 0
Motor_IN3
Text GLabel 1650 5250 0    50   Input ~ 0
Motor_IN4
Text GLabel 1650 4750 0    50   Input ~ 0
Motor_IN1
Text GLabel 1650 4850 0    50   Input ~ 0
Motor_IN2
Wire Wire Line
	1650 4750 2000 4750
Wire Wire Line
	1650 4850 2000 4850
Wire Wire Line
	1650 5150 2000 5150
Wire Wire Line
	1650 5250 2000 5250
$Comp
L power:+5V #PWR?
U 1 1 5FDFB2B3
P 1000 4950
F 0 "#PWR?" H 1000 4800 50  0001 C CNN
F 1 "+5V" V 1015 5078 50  0000 L CNN
F 2 "" H 1000 4950 50  0001 C CNN
F 3 "" H 1000 4950 50  0001 C CNN
	1    1000 4950
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FDFB2FF
P 2600 4550
F 0 "#PWR?" H 2600 4400 50  0001 C CNN
F 1 "+5V" H 2615 4723 50  0000 C CNN
F 2 "" H 2600 4550 50  0001 C CNN
F 3 "" H 2600 4550 50  0001 C CNN
	1    2600 4550
	1    0    0    -1  
$EndComp
$Comp
L Driver_Motor:L298HN U?
U 1 1 5FDFF0E4
P 2600 5250
F 0 "U?" H 2300 6150 50  0001 C CNN
F 1 "L298HN" H 2950 5900 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-15_P2.54x2.54mm_StaggerOdd_Lead4.58mm_Vertical" H 2650 4600 50  0001 L CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00000240.pdf" H 2750 5500 50  0001 C CNN
	1    2600 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 4950 1050 4950
Wire Wire Line
	1050 4950 1050 5350
Wire Wire Line
	1050 5350 2000 5350
Connection ~ 1050 4950
Wire Wire Line
	1050 4950 2000 4950
$Comp
L power:GND #PWR?
U 1 1 5FE03F2B
P 2400 6200
F 0 "#PWR?" H 2400 5950 50  0001 C CNN
F 1 "GND" H 2405 6027 50  0000 C CNN
F 2 "" H 2400 6200 50  0001 C CNN
F 3 "" H 2400 6200 50  0001 C CNN
	1    2400 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 5950 2300 6200
Wire Wire Line
	2300 6200 2400 6200
Wire Wire Line
	2400 5950 2400 6200
Connection ~ 2400 6200
Wire Wire Line
	2600 5950 2600 6200
Wire Wire Line
	2600 6200 2400 6200
Wire Wire Line
	2700 4550 2700 4400
Wire Wire Line
	2700 4400 3450 4400
Wire Wire Line
	3450 4400 3450 4200
$Comp
L power:+12V #PWR?
U 1 1 5FE0DAED
P 3450 4200
F 0 "#PWR?" H 3450 4050 50  0001 C CNN
F 1 "+12V" H 3465 4373 50  0000 C CNN
F 2 "" H 3450 4200 50  0001 C CNN
F 3 "" H 3450 4200 50  0001 C CNN
	1    3450 4200
	1    0    0    -1  
$EndComp
Text Notes 3550 4300 0    50   ~ 0
External psu needed
Text Notes 2750 6150 0    50   ~ 0
Stepper motor could be used for mechanism which would allow circular\nmovement of pill partitions, allowing only one to be accest at a time.
NoConn ~ 5500 1600
$Comp
L My_lib:ESP8266 U?
U 1 1 5FEAA6E5
P 9200 4850
F 0 "U?" H 9600 5250 50  0001 C CNN
F 1 "ESP8266" H 9200 5286 50  0000 C CNN
F 2 "" H 8700 5250 50  0001 C CNN
F 3 "" H 8700 5250 50  0001 C CNN
	1    9200 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 2950 8550 2950
Wire Wire Line
	3300 2050 3000 2050
$Comp
L My_lib:analog_keypad U?
U 1 1 5FEB9987
P 5650 3050
F 0 "U?" H 5650 3250 50  0001 C CNN
F 1 "analog_keypad" H 6077 3050 50  0000 L CNN
F 2 "" H 5650 3250 50  0001 C CNN
F 3 "" H 5650 3250 50  0001 C CNN
	1    5650 3050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FEB99A3
P 4650 3150
F 0 "#PWR?" H 4650 2900 50  0001 C CNN
F 1 "GND" V 4655 3022 50  0000 R CNN
F 2 "" H 4650 3150 50  0001 C CNN
F 3 "" H 4650 3150 50  0001 C CNN
	1    4650 3150
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FEB99B8
P 4650 3050
F 0 "#PWR?" H 4650 2900 50  0001 C CNN
F 1 "+5V" H 4665 3223 50  0000 C CNN
F 2 "" H 4650 3050 50  0001 C CNN
F 3 "" H 4650 3050 50  0001 C CNN
	1    4650 3050
	0    -1   -1   0   
$EndComp
Text GLabel 4950 2950 0    50   Output ~ 0
Keypad
Wire Wire Line
	5150 2950 4950 2950
Wire Wire Line
	5150 3050 4650 3050
Wire Wire Line
	4650 3150 5150 3150
$EndSCHEMATC
