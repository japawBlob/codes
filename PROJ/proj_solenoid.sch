EESchema Schematic File Version 4
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Pill helper V1.1"
Date "2020-12-14"
Rev "1.1"
Comp "FEL CVUT"
Comment1 "First ideas about all potential functionalities of Pill helper"
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
Buzz
$Comp
L Device:Buzzer BZ?
U 1 1 5FDA69A7
P 5750 2850
F 0 "BZ?" H 5903 2879 50  0001 L CNN
F 1 "Buzzer" H 5903 2833 50  0000 L CNN
F 2 "" V 5725 2950 50  0001 C CNN
F 3 "~" V 5725 2950 50  0001 C CNN
	1    5750 2850
	1    0    0    -1  
$EndComp
Text GLabel 5400 2750 0    50   Input ~ 0
Buzz
Wire Wire Line
	5400 2750 5650 2750
$Comp
L power:GND #PWR?
U 1 1 5FDA6EF6
P 5650 2950
F 0 "#PWR?" H 5650 2700 50  0001 C CNN
F 1 "GND" V 5655 2822 50  0000 R CNN
F 2 "" H 5650 2950 50  0001 C CNN
F 3 "" H 5650 2950 50  0001 C CNN
	1    5650 2950
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
$Comp
L Switch:SW_Push SW?
U 1 1 5FDA81C1
P 5600 3550
F 0 "SW?" H 5600 3835 50  0001 C CNN
F 1 "SW_Push" H 5600 3743 50  0000 C CNN
F 2 "" H 5600 3750 50  0001 C CNN
F 3 "" H 5600 3750 50  0001 C CNN
	1    5600 3550
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW?
U 1 1 5FDA827E
P 5600 3900
F 0 "SW?" H 5600 4185 50  0001 C CNN
F 1 "SW_Push" H 5600 4093 50  0000 C CNN
F 2 "" H 5600 4100 50  0001 C CNN
F 3 "" H 5600 4100 50  0001 C CNN
	1    5600 3900
	1    0    0    -1  
$EndComp
Text GLabel 5200 3550 0    50   Input ~ 0
Button_User_1
Text GLabel 5200 3900 0    50   Input ~ 0
Button_User_2
Wire Wire Line
	5200 3900 5400 3900
Wire Wire Line
	5200 3550 5400 3550
$Comp
L power:+3V3 #PWR?
U 1 1 5FDA89F3
P 5800 3550
F 0 "#PWR?" H 5800 3400 50  0001 C CNN
F 1 "+3V3" V 5815 3678 50  0000 L CNN
F 2 "" H 5800 3550 50  0001 C CNN
F 3 "" H 5800 3550 50  0001 C CNN
	1    5800 3550
	0    1    1    0   
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5FDA8D81
P 5800 3900
F 0 "#PWR?" H 5800 3750 50  0001 C CNN
F 1 "+3V3" V 5815 4028 50  0000 L CNN
F 2 "" H 5800 3900 50  0001 C CNN
F 3 "" H 5800 3900 50  0001 C CNN
	1    5800 3900
	0    1    1    0   
$EndComp
Text Notes 5050 3100 0    50   ~ 0
Buzzer for notifying user
Text Notes 4700 4200 0    50   ~ 0
Two user buttons \nOne can be used for canceling alarm\nSecond for entering time setup phase\n
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
P 9050 3000
F 0 "D?" H 9041 3216 50  0001 C CNN
F 1 "RED_LED" H 9042 2836 50  0000 C CNN
F 2 "" H 9050 3000 50  0001 C CNN
F 3 "~" H 9050 3000 50  0001 C CNN
	1    9050 3000
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D?
U 1 1 5FDAFB2F
P 9050 3400
F 0 "D?" H 9041 3616 50  0001 C CNN
F 1 "GREEN_LED" H 9042 3236 50  0000 C CNN
F 2 "" H 9050 3400 50  0001 C CNN
F 3 "~" H 9050 3400 50  0001 C CNN
	1    9050 3400
	-1   0    0    1   
$EndComp
Text GLabel 1800 2250 0    50   Output ~ 0
Green_LED
Wire Wire Line
	1800 2250 2000 2250
Wire Wire Line
	1800 2650 2000 2650
Text GLabel 1800 2650 0    50   Output ~ 0
Red_LED
Text GLabel 8300 3000 0    50   Input ~ 0
Green_LED
Text GLabel 8300 3400 0    50   Input ~ 0
Red_LED
$Comp
L power:GND #PWR?
U 1 1 5FDB2714
P 9500 3000
F 0 "#PWR?" H 9500 2750 50  0001 C CNN
F 1 "GND" V 9505 2872 50  0000 R CNN
F 2 "" H 9500 3000 50  0001 C CNN
F 3 "" H 9500 3000 50  0001 C CNN
	1    9500 3000
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FDB2739
P 9500 3400
F 0 "#PWR?" H 9500 3150 50  0001 C CNN
F 1 "GND" V 9505 3272 50  0000 R CNN
F 2 "" H 9500 3400 50  0001 C CNN
F 3 "" H 9500 3400 50  0001 C CNN
	1    9500 3400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9200 3000 9500 3000
Wire Wire Line
	9200 3400 9500 3400
$Comp
L Device:R R3
U 1 1 5FDB2F97
P 8600 3400
F 0 "R3" V 8807 3400 50  0000 C CNN
F 1 "470" V 8716 3400 50  0000 C CNN
F 2 "" V 8530 3400 50  0001 C CNN
F 3 "~" H 8600 3400 50  0001 C CNN
	1    8600 3400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8300 3400 8450 3400
Wire Wire Line
	8750 3400 8900 3400
$Comp
L Device:R R4
U 1 1 5FDB61AB
P 8600 3000
F 0 "R4" V 8807 3000 50  0000 C CNN
F 1 "470" V 8716 3000 50  0000 C CNN
F 2 "" V 8530 3000 50  0001 C CNN
F 3 "~" H 8600 3000 50  0001 C CNN
	1    8600 3000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8300 3000 8450 3000
Wire Wire Line
	8750 3000 8900 3000
Text Notes 8150 3600 0    50   ~ 0
LED for potencial notifying user
$Comp
L My_lib:ESP8266 U?
U 1 1 5FDB7852
P 9200 4850
F 0 "U?" H 9600 5250 50  0001 C CNN
F 1 "ESP8266" H 9550 5200 50  0000 C CNN
F 2 "" H 8700 5250 50  0001 C CNN
F 3 "" H 8700 5250 50  0001 C CNN
	1    9200 4850
	1    0    0    -1  
$EndComp
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
$Comp
L Transistor_BJT:2N3904 Q?
U 1 1 5FDBCEE1
P 2550 4250
F 0 "Q?" H 2741 4296 50  0001 L CNN
F 1 "2N3904" V 2500 3850 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 2750 4175 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 2550 4250 50  0001 L CNN
	1    2550 4250
	0    -1   1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FDBEE44
P 2750 4500
F 0 "#PWR?" H 2750 4250 50  0001 C CNN
F 1 "GND" H 2755 4327 50  0000 C CNN
F 2 "" H 2750 4500 50  0001 C CNN
F 3 "" H 2750 4500 50  0001 C CNN
	1    2750 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5FDBF5E7
P 2750 3800
F 0 "R5" V 2957 3800 50  0000 C CNN
F 1 "220" V 2866 3800 50  0000 C CNN
F 2 "" V 2680 3800 50  0001 C CNN
F 3 "~" H 2750 3800 50  0001 C CNN
	1    2750 3800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2550 3800 2550 4050
$Comp
L power:+5V #PWR?
U 1 1 5FDBFEC7
P 1850 3750
F 0 "#PWR?" H 1850 3600 50  0001 C CNN
F 1 "+5V" H 1865 3923 50  0000 C CNN
F 2 "" H 1850 3750 50  0001 C CNN
F 3 "" H 1850 3750 50  0001 C CNN
	1    1850 3750
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4001 D?
U 1 1 5FDC573A
P 2100 4350
F 0 "D?" H 2100 4566 50  0001 C CNN
F 1 "1N4001" H 2100 4474 50  0000 C CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 2100 4175 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 2100 4350 50  0001 C CNN
	1    2100 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 4350 1850 4350
Wire Wire Line
	2350 4350 2300 4350
Wire Wire Line
	1950 4350 1850 4350
Connection ~ 1850 4350
$Comp
L My_lib:Solenoid U?
U 1 1 5FDBCCC0
P 1450 4450
F 0 "U?" H 1430 4775 50  0001 C CNN
F 1 "Solenoid_5V" H 1450 4700 50  0000 C CNN
F 2 "" H 1450 4700 50  0001 C CNN
F 3 "" H 1450 4700 50  0001 C CNN
	1    1450 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 4500 2300 4500
Wire Wire Line
	2300 4500 2300 4350
Connection ~ 2300 4350
Wire Wire Line
	2300 4350 2250 4350
Text Notes 1150 5100 0    50   ~ 0
Solenoid can be used for locking mechanism.\nMultiple solenoids can be added using shift register.
Wire Wire Line
	1850 3750 1850 4350
Wire Wire Line
	2600 3800 2550 3800
Text GLabel 3300 2050 2    50   Output ~ 0
Solenoid
Text GLabel 3000 3800 2    50   Input ~ 0
Solenoid
Wire Wire Line
	3000 3800 2900 3800
$Comp
L Motor:Stepper_Motor_bipolar M?
U 1 1 5FDDE7B3
P 4400 6400
F 0 "M?" V 4370 6212 50  0000 R CNN
F 1 "Stepper_Motor_bipolar" V 4279 6212 50  0000 R CNN
F 2 "" H 4410 6390 50  0001 C CNN
F 3 "http://www.infineon.com/dgdl/Application-Note-TLE8110EE_driving_UniPolarStepperMotor_V1.1.pdf?fileId=db3a30431be39b97011be5d0aa0a00b0" H 4410 6390 50  0001 C CNN
	1    4400 6400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3450 6350 4100 6350
Wire Wire Line
	4100 6350 4100 6300
Wire Wire Line
	3450 6450 4100 6450
Wire Wire Line
	4100 6450 4100 6500
Wire Wire Line
	3450 6650 4150 6650
Wire Wire Line
	4150 6650 4150 6700
Wire Wire Line
	4150 6700 4300 6700
Wire Wire Line
	3450 6750 4500 6750
Wire Wire Line
	4500 6750 4500 6700
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
Text GLabel 1900 6450 0    50   Input ~ 0
Motor_IN3
Text GLabel 1900 6550 0    50   Input ~ 0
Motor_IN4
Text GLabel 1900 6050 0    50   Input ~ 0
Motor_IN1
Text GLabel 1900 6150 0    50   Input ~ 0
Motor_IN2
Wire Wire Line
	1900 6050 2250 6050
Wire Wire Line
	1900 6150 2250 6150
Wire Wire Line
	1900 6450 2250 6450
Wire Wire Line
	1900 6550 2250 6550
$Comp
L power:+5V #PWR?
U 1 1 5FDFB2B3
P 1250 6250
F 0 "#PWR?" H 1250 6100 50  0001 C CNN
F 1 "+5V" V 1265 6378 50  0000 L CNN
F 2 "" H 1250 6250 50  0001 C CNN
F 3 "" H 1250 6250 50  0001 C CNN
	1    1250 6250
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FDFB2FF
P 2850 5850
F 0 "#PWR?" H 2850 5700 50  0001 C CNN
F 1 "+5V" H 2865 6023 50  0000 C CNN
F 2 "" H 2850 5850 50  0001 C CNN
F 3 "" H 2850 5850 50  0001 C CNN
	1    2850 5850
	1    0    0    -1  
$EndComp
$Comp
L Driver_Motor:L298HN U?
U 1 1 5FDFF0E4
P 2850 6550
F 0 "U?" H 2550 7450 50  0001 C CNN
F 1 "L298HN" H 3200 7200 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-15_P2.54x2.54mm_StaggerOdd_Lead4.58mm_Vertical" H 2900 5900 50  0001 L CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00000240.pdf" H 3000 6800 50  0001 C CNN
	1    2850 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 6250 1300 6250
Wire Wire Line
	1300 6250 1300 6650
Wire Wire Line
	1300 6650 2250 6650
Connection ~ 1300 6250
Wire Wire Line
	1300 6250 2250 6250
$Comp
L power:GND #PWR?
U 1 1 5FE03F2B
P 2650 7500
F 0 "#PWR?" H 2650 7250 50  0001 C CNN
F 1 "GND" H 2655 7327 50  0000 C CNN
F 2 "" H 2650 7500 50  0001 C CNN
F 3 "" H 2650 7500 50  0001 C CNN
	1    2650 7500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 7250 2550 7500
Wire Wire Line
	2550 7500 2650 7500
Wire Wire Line
	2650 7250 2650 7500
Connection ~ 2650 7500
Wire Wire Line
	2850 7250 2850 7500
Wire Wire Line
	2850 7500 2650 7500
Wire Wire Line
	2950 5850 2950 5700
Wire Wire Line
	2950 5700 3700 5700
Wire Wire Line
	3700 5700 3700 5500
$Comp
L power:+12V #PWR?
U 1 1 5FE0DAED
P 3700 5500
F 0 "#PWR?" H 3700 5350 50  0001 C CNN
F 1 "+12V" H 3715 5673 50  0000 C CNN
F 2 "" H 3700 5500 50  0001 C CNN
F 3 "" H 3700 5500 50  0001 C CNN
	1    3700 5500
	1    0    0    -1  
$EndComp
Text Notes 3800 5600 0    50   ~ 0
External psu needed
Text Notes 3000 7450 0    50   ~ 0
Stepper motor could be used for mechanism which would allow circular\nmovement of pill partitions, allowing only one to be accest at a time.\nNot big fan of this approach.
NoConn ~ 5500 1600
Wire Wire Line
	2750 4350 2750 4500
NoConn ~ 8500 4750
NoConn ~ 8500 4950
NoConn ~ 9900 4750
NoConn ~ 9900 5050
$EndSCHEMATC
