EESchema Schematic File Version 4
LIBS:proj_motor-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Pill helper V1.3 (motor approach)"
Date "2020-12-27"
Rev "1.3"
Comp "FEL CVUT"
Comment1 "First ideas about all potential functionalities of Pill helper using motor"
Comment2 "Most of the functionality is theoretical, implemented features may and will differ"
Comment3 ""
Comment4 "Author: Jakub Jira"
$EndDescr
$Comp
L MCU_Module:Arduino_UNO_R3 A?
U 1 1 5FD8FBFE
P 3450 2050
F 0 "A?" H 3450 3228 50  0001 C CNN
F 1 "Arduino_UNO_R3" H 4050 3050 50  0000 C CNN
F 2 "Module:Arduino_UNO_R3" H 3600 1000 50  0001 L CNN
F 3 "https://www.arduino.cc/en/Main/arduinoBoardUno" H 3250 3100 50  0001 C CNN
	1    3450 2050
	1    0    0    -1  
$EndComp
$Comp
L Device:Rotary_Encoder_KY-040 SW?
U 1 1 5FD97BB7
P 6350 1400
F 0 "SW?" H 6350 1775 50  0001 C CNN
F 1 "Rotary_Encoder_KY-040" H 6350 1683 50  0000 C CNN
F 2 "" H 6200 1560 50  0001 C CNN
F 3 "~" H 6350 1660 50  0001 C CNN
	1    6350 1400
	1    0    0    -1  
$EndComp
Text Notes 6000 1300 0    50   ~ 0
Clk
Text Notes 6000 1400 0    50   ~ 0
DT
Text Notes 6000 1500 0    50   ~ 0
SW
$Comp
L power:GND #PWR?
U 1 1 5FDA60FC
P 6650 1250
F 0 "#PWR?" H 6650 1000 50  0001 C CNN
F 1 "GND" V 6655 1122 50  0000 R CNN
F 2 "" H 6650 1250 50  0001 C CNN
F 3 "" H 6650 1250 50  0001 C CNN
	1    6650 1250
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FDA6182
P 6650 1550
F 0 "#PWR?" H 6650 1400 50  0001 C CNN
F 1 "+5V" V 6665 1678 50  0000 L CNN
F 2 "" H 6650 1550 50  0001 C CNN
F 3 "" H 6650 1550 50  0001 C CNN
	1    6650 1550
	0    1    1    0   
$EndComp
Text GLabel 2750 1750 0    50   Output ~ 0
Rot_Clk
Text GLabel 2750 1850 0    50   Output ~ 0
Rot_DT
Wire Wire Line
	2750 1750 2950 1750
Wire Wire Line
	2750 1850 2950 1850
Text GLabel 5350 1300 0    50   Input ~ 0
Rot_Clk
Text GLabel 5350 1400 0    50   Input ~ 0
Rot_DT
$Comp
L power:+5V #PWR?
U 1 1 5FDA62C3
P 5550 2000
F 0 "#PWR?" H 5550 1850 50  0001 C CNN
F 1 "+5V" V 5565 2128 50  0000 L CNN
F 2 "" H 5550 2000 50  0001 C CNN
F 3 "" H 5550 2000 50  0001 C CNN
	1    5550 2000
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R1
U 1 1 5FDA6344
P 5600 1750
F 0 "R1" H 5670 1796 50  0000 L CNN
F 1 "10k" H 5670 1705 50  0000 L CNN
F 2 "" V 5530 1750 50  0001 C CNN
F 3 "~" H 5600 1750 50  0001 C CNN
	1    5600 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5FDA63AE
P 5900 1750
F 0 "R2" H 5970 1796 50  0000 L CNN
F 1 "10k" H 5970 1705 50  0000 L CNN
F 2 "" V 5830 1750 50  0001 C CNN
F 3 "~" H 5900 1750 50  0001 C CNN
	1    5900 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 1300 5900 1300
Wire Wire Line
	5350 1400 5600 1400
Wire Wire Line
	5600 1600 5600 1400
Connection ~ 5600 1400
Wire Wire Line
	5600 1400 6050 1400
Wire Wire Line
	5900 1300 5900 1600
Connection ~ 5900 1300
Wire Wire Line
	5900 1300 6050 1300
Wire Wire Line
	5550 2000 5600 2000
Wire Wire Line
	5600 2000 5600 1900
Wire Wire Line
	5600 2000 5900 2000
Wire Wire Line
	5900 2000 5900 1900
Connection ~ 5600 2000
Text Notes 5450 2150 0    50   ~ 0
Pull Up resistors
Text GLabel 2750 2550 0    50   Output ~ 0
Alarm
$Comp
L Device:Buzzer BZ?
U 1 1 5FDA69A7
P 9300 3050
F 0 "BZ?" H 9453 3079 50  0001 L CNN
F 1 "Buzzer" H 9453 3033 50  0000 L CNN
F 2 "" V 9275 3150 50  0001 C CNN
F 3 "~" V 9275 3150 50  0001 C CNN
	1    9300 3050
	1    0    0    -1  
$EndComp
Text GLabel 8000 2950 0    50   Input ~ 0
Alarm
$Comp
L power:GND #PWR?
U 1 1 5FDA6EF6
P 9200 3150
F 0 "#PWR?" H 9200 2900 50  0001 C CNN
F 1 "GND" V 9205 3022 50  0000 R CNN
F 2 "" H 9200 3150 50  0001 C CNN
F 3 "" H 9200 3150 50  0001 C CNN
	1    9200 3150
	0    1    1    0   
$EndComp
Text GLabel 2750 1650 0    50   Output ~ 0
Button_User_1
Text GLabel 2750 2150 0    50   Output ~ 0
Button_User_2
Wire Wire Line
	2750 2150 2950 2150
Wire Wire Line
	2750 1650 2950 1650
Wire Wire Line
	2750 2550 2950 2550
Text Notes 8150 3300 0    50   ~ 0
Buzzer and LED for notifying user
$Comp
L Display_Character:EA_T123X-I2C U?
U 1 1 5FDA9357
P 9450 1550
F 0 "U?" H 9879 1596 50  0001 L CNN
F 1 "LCD-I2C-display" H 9879 1550 50  0000 L CNN
F 2 "Display:EA_T123X-I2C" H 9450 950 50  0001 C CNN
F 3 "http://www.lcd-module.de/pdf/doma/t123-i2c.pdf" H 9450 1050 50  0001 C CNN
	1    9450 1550
	1    0    0    -1  
$EndComp
Text Notes 8900 2200 0    50   ~ 0
Generic I2C display\nUsed for displaying time for user
Text GLabel 4250 2450 2    50   Output ~ 0
Display_SDA
Text GLabel 4250 2550 2    50   Output ~ 0
Display_SCL
Wire Wire Line
	3950 2450 4250 2450
Wire Wire Line
	3950 2550 4250 2550
Text GLabel 8650 1350 0    50   Input ~ 0
Display_SDA
Text GLabel 8650 1250 0    50   Input ~ 0
Display_SCL
Wire Wire Line
	8650 1250 8950 1250
Wire Wire Line
	8650 1350 8950 1350
$Comp
L power:+5V #PWR?
U 1 1 5FDAE85E
P 8950 1900
F 0 "#PWR?" H 8950 1750 50  0001 C CNN
F 1 "+5V" V 8965 2028 50  0000 L CNN
F 2 "" H 8950 1900 50  0001 C CNN
F 3 "" H 8950 1900 50  0001 C CNN
	1    8950 1900
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FDAF034
P 8950 1800
F 0 "#PWR?" H 8950 1550 50  0001 C CNN
F 1 "GND" V 8955 1672 50  0000 R CNN
F 2 "" H 8950 1800 50  0001 C CNN
F 3 "" H 8950 1800 50  0001 C CNN
	1    8950 1800
	0    1    1    0   
$EndComp
$Comp
L Device:LED D?
U 1 1 5FDAF8D1
P 8750 2950
F 0 "D?" H 8741 3166 50  0001 C CNN
F 1 "RED_LED" H 8742 2786 50  0000 C CNN
F 2 "" H 8750 2950 50  0001 C CNN
F 3 "~" H 8750 2950 50  0001 C CNN
	1    8750 2950
	-1   0    0    1   
$EndComp
Wire Wire Line
	2750 2250 2950 2250
Wire Wire Line
	2750 2650 2950 2650
$Comp
L Device:R R4
U 1 1 5FDB61AB
P 8300 2950
F 0 "R4" V 8507 2950 50  0000 C CNN
F 1 "470" V 8416 2950 50  0000 C CNN
F 2 "" V 8230 2950 50  0001 C CNN
F 3 "~" H 8300 2950 50  0001 C CNN
	1    8300 2950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8000 2950 8150 2950
Wire Wire Line
	8450 2950 8600 2950
Text GLabel 2750 1450 0    50   Output ~ 0
RX
Text GLabel 2750 1550 0    50   Output ~ 0
TX
Wire Wire Line
	2950 1450 2750 1450
Wire Wire Line
	2950 1550 2750 1550
Text GLabel 7350 5250 0    50   Input ~ 0
RX
Text GLabel 7350 5050 0    50   Input ~ 0
TX
Wire Wire Line
	7350 5050 7600 5050
Wire Wire Line
	7350 5250 7600 5250
$Comp
L power:+3V3 #PWR?
U 1 1 5FDBA398
P 8300 4550
F 0 "#PWR?" H 8300 4400 50  0001 C CNN
F 1 "+3V3" H 8315 4723 50  0000 C CNN
F 2 "" H 8300 4550 50  0001 C CNN
F 3 "" H 8300 4550 50  0001 C CNN
	1    8300 4550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FDBA3D0
P 8300 5600
F 0 "#PWR?" H 8300 5350 50  0001 C CNN
F 1 "GND" H 8305 5427 50  0000 C CNN
F 2 "" H 8300 5600 50  0001 C CNN
F 3 "" H 8300 5600 50  0001 C CNN
	1    8300 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 5450 8300 5600
Wire Wire Line
	8300 4700 8300 4550
Text Notes 7500 5900 0    50   ~ 0
Scheme for connecting ESP-01S ESP8266
Text GLabel 4250 2050 2    50   Input ~ 0
Keypad
$Comp
L Motor:Stepper_Motor_bipolar M?
U 1 1 5FDDE7B3
P 4950 5950
F 0 "M?" V 4920 5762 50  0000 R CNN
F 1 "Stepper_Motor_bipolar" V 4829 5762 50  0000 R CNN
F 2 "" H 4960 5940 50  0001 C CNN
F 3 "http://www.infineon.com/dgdl/Application-Note-TLE8110EE_driving_UniPolarStepperMotor_V1.1.pdf?fileId=db3a30431be39b97011be5d0aa0a00b0" H 4960 5940 50  0001 C CNN
	1    4950 5950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4000 5900 4650 5900
Wire Wire Line
	4650 5900 4650 5850
Wire Wire Line
	4000 6000 4650 6000
Wire Wire Line
	4650 6000 4650 6050
Wire Wire Line
	4000 6200 4700 6200
Wire Wire Line
	4700 6200 4700 6250
Wire Wire Line
	4700 6250 4850 6250
Wire Wire Line
	4000 6300 5050 6300
Wire Wire Line
	5050 6300 5050 6250
Text GLabel 2750 1950 0    50   Output ~ 0
Motor_IN1
Text GLabel 2750 2050 0    50   Output ~ 0
Motor_IN2
Text GLabel 2750 2350 0    50   Output ~ 0
Motor_IN3
Text GLabel 2750 2450 0    50   Output ~ 0
Motor_IN4
Wire Wire Line
	2950 1950 2750 1950
Wire Wire Line
	2950 2050 2750 2050
Wire Wire Line
	2950 2350 2750 2350
Wire Wire Line
	2950 2450 2750 2450
Text GLabel 2450 6000 0    50   Input ~ 0
Motor_IN3
Text GLabel 2450 6100 0    50   Input ~ 0
Motor_IN4
Text GLabel 2450 5600 0    50   Input ~ 0
Motor_IN1
Text GLabel 2450 5700 0    50   Input ~ 0
Motor_IN2
Wire Wire Line
	2450 5600 2800 5600
Wire Wire Line
	2450 5700 2800 5700
Wire Wire Line
	2450 6000 2800 6000
Wire Wire Line
	2450 6100 2800 6100
$Comp
L power:+5V #PWR?
U 1 1 5FDFB2B3
P 1800 5800
F 0 "#PWR?" H 1800 5650 50  0001 C CNN
F 1 "+5V" V 1815 5928 50  0000 L CNN
F 2 "" H 1800 5800 50  0001 C CNN
F 3 "" H 1800 5800 50  0001 C CNN
	1    1800 5800
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FDFB2FF
P 3400 5400
F 0 "#PWR?" H 3400 5250 50  0001 C CNN
F 1 "+5V" H 3415 5573 50  0000 C CNN
F 2 "" H 3400 5400 50  0001 C CNN
F 3 "" H 3400 5400 50  0001 C CNN
	1    3400 5400
	1    0    0    -1  
$EndComp
$Comp
L Driver_Motor:L298HN U?
U 1 1 5FDFF0E4
P 3400 6100
F 0 "U?" H 3100 7000 50  0001 C CNN
F 1 "L298HN" H 3750 6750 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-15_P2.54x2.54mm_StaggerOdd_Lead4.58mm_Vertical" H 3450 5450 50  0001 L CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00000240.pdf" H 3550 6350 50  0001 C CNN
	1    3400 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 5800 1850 5800
Wire Wire Line
	1850 5800 1850 6200
Wire Wire Line
	1850 6200 2800 6200
Connection ~ 1850 5800
Wire Wire Line
	1850 5800 2800 5800
$Comp
L power:GND #PWR?
U 1 1 5FE03F2B
P 3200 7050
F 0 "#PWR?" H 3200 6800 50  0001 C CNN
F 1 "GND" H 3205 6877 50  0000 C CNN
F 2 "" H 3200 7050 50  0001 C CNN
F 3 "" H 3200 7050 50  0001 C CNN
	1    3200 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 6800 3100 7050
Wire Wire Line
	3100 7050 3200 7050
Wire Wire Line
	3200 6800 3200 7050
Connection ~ 3200 7050
Wire Wire Line
	3400 6800 3400 7050
Wire Wire Line
	3400 7050 3200 7050
Wire Wire Line
	3500 5400 3500 5250
Wire Wire Line
	3500 5250 4250 5250
Wire Wire Line
	4250 5250 4250 5050
$Comp
L power:+12V #PWR?
U 1 1 5FE0DAED
P 4250 5050
F 0 "#PWR?" H 4250 4900 50  0001 C CNN
F 1 "+12V" H 4265 5223 50  0000 C CNN
F 2 "" H 4250 5050 50  0001 C CNN
F 3 "" H 4250 5050 50  0001 C CNN
	1    4250 5050
	1    0    0    -1  
$EndComp
Text Notes 4350 5150 0    50   ~ 0
External psu needed
Text Notes 3550 7000 0    50   ~ 0
Stepper motor could be used for mechanism which would allow circular\nmovement of pill partitions, allowing only one to be accest at a time.
NoConn ~ 6050 1500
$Comp
L My_lib:ESP8266 U?
U 1 1 5FEAA6E5
P 8300 5050
F 0 "U?" H 8700 5450 50  0001 C CNN
F 1 "ESP8266" H 8300 5486 50  0000 C CNN
F 2 "" H 7800 5450 50  0001 C CNN
F 3 "" H 7800 5450 50  0001 C CNN
	1    8300 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 2950 9200 2950
Wire Wire Line
	4250 2050 3950 2050
$Comp
L My_lib:analog_keypad U?
U 1 1 5FEB9987
P 6200 2950
F 0 "U?" H 6200 3150 50  0001 C CNN
F 1 "analog_keypad" H 6627 2950 50  0000 L CNN
F 2 "" H 6200 3150 50  0001 C CNN
F 3 "" H 6200 3150 50  0001 C CNN
	1    6200 2950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FEB99A3
P 5200 3050
F 0 "#PWR?" H 5200 2800 50  0001 C CNN
F 1 "GND" V 5205 2922 50  0000 R CNN
F 2 "" H 5200 3050 50  0001 C CNN
F 3 "" H 5200 3050 50  0001 C CNN
	1    5200 3050
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FEB99B8
P 5200 2950
F 0 "#PWR?" H 5200 2800 50  0001 C CNN
F 1 "+5V" H 5215 3123 50  0000 C CNN
F 2 "" H 5200 2950 50  0001 C CNN
F 3 "" H 5200 2950 50  0001 C CNN
	1    5200 2950
	0    -1   -1   0   
$EndComp
Text GLabel 5500 2850 0    50   Output ~ 0
Keypad
Wire Wire Line
	5700 2850 5500 2850
Wire Wire Line
	5700 2950 5200 2950
Wire Wire Line
	5200 3050 5700 3050
$Comp
L power:+12V #PWR?
U 1 1 5FEBA436
P 1000 900
F 0 "#PWR?" H 1000 750 50  0001 C CNN
F 1 "+12V" V 1015 1028 50  0000 L CNN
F 2 "" H 1000 900 50  0001 C CNN
F 3 "" H 1000 900 50  0001 C CNN
	1    1000 900 
	0    -1   -1   0   
$EndComp
$Comp
L Diode:1N4001 D?
U 1 1 5FEBA576
P 1350 900
F 0 "D?" H 1350 684 50  0001 C CNN
F 1 "1N4001" H 1350 776 50  0000 C CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 1350 725 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 1350 900 50  0001 C CNN
	1    1350 900 
	-1   0    0    1   
$EndComp
$Comp
L Diode:1N4001 D?
U 1 1 5FEBA627
P 1850 1250
F 0 "D?" H 1850 1034 50  0001 C CNN
F 1 "1N4001" V 1850 1329 50  0000 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 1850 1075 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 1850 1250 50  0001 C CNN
	1    1850 1250
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5FEBA646
P 1500 1250
F 0 "R?" H 1570 1296 50  0001 L CNN
F 1 "10k" H 1570 1205 50  0000 L CNN
F 2 "" V 1430 1250 50  0001 C CNN
F 3 "~" H 1500 1250 50  0001 C CNN
	1    1500 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:Battery BT?
U 1 1 5FEBBE4E
P 1500 1800
F 0 "BT?" H 1608 1846 50  0001 L CNN
F 1 "10V Battery" H 1608 1800 50  0000 L CNN
F 2 "" V 1500 1860 50  0001 C CNN
F 3 "~" V 1500 1860 50  0001 C CNN
	1    1500 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 1600 1500 1500
Wire Wire Line
	1500 1500 1850 1500
Wire Wire Line
	1850 1500 1850 1400
Connection ~ 1500 1500
Wire Wire Line
	1500 1500 1500 1400
Wire Wire Line
	1500 1100 1500 900 
Wire Wire Line
	1850 1100 1850 900 
Wire Wire Line
	1850 900  1500 900 
Connection ~ 1500 900 
Wire Wire Line
	1850 900  3350 900 
Wire Wire Line
	3350 900  3350 1050
Connection ~ 1850 900 
Wire Wire Line
	1000 900  1200 900 
Wire Wire Line
	1500 2000 1500 3300
Wire Wire Line
	1500 3300 1000 3300
$Comp
L power:GND #PWR?
U 1 1 5FEC9851
P 1000 3300
F 0 "#PWR?" H 1000 3050 50  0001 C CNN
F 1 "GND" V 1005 3172 50  0000 R CNN
F 2 "" H 1000 3300 50  0001 C CNN
F 3 "" H 1000 3300 50  0001 C CNN
	1    1000 3300
	0    1    1    0   
$EndComp
Wire Wire Line
	1500 3300 3350 3300
Wire Wire Line
	3350 3300 3350 3150
Connection ~ 1500 3300
$EndSCHEMATC
