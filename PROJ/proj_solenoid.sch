EESchema Schematic File Version 4
LIBS:proj_solenoid-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Pill helper V1.2 (solenoid approach)"
Date "2020-12-14"
Rev "1.2"
Comp "FEL CVUT"
Comment1 "First potential implementation of Pill helper"
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
P 5350 1150
F 0 "SW?" H 5350 1525 50  0001 C CNN
F 1 "Rotary_Encoder_KY-040" H 5350 1433 50  0000 C CNN
F 2 "" H 5200 1310 50  0001 C CNN
F 3 "~" H 5350 1410 50  0001 C CNN
	1    5350 1150
	1    0    0    -1  
$EndComp
Text Notes 5000 1050 0    50   ~ 0
Clk
Text Notes 5000 1150 0    50   ~ 0
DT
Text Notes 5000 1250 0    50   ~ 0
SW
$Comp
L power:GND #PWR?
U 1 1 5FDA60FC
P 5650 1000
F 0 "#PWR?" H 5650 750 50  0001 C CNN
F 1 "GND" V 5655 872 50  0000 R CNN
F 2 "" H 5650 1000 50  0001 C CNN
F 3 "" H 5650 1000 50  0001 C CNN
	1    5650 1000
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FDA6182
P 5650 1300
F 0 "#PWR?" H 5650 1150 50  0001 C CNN
F 1 "+5V" V 5665 1428 50  0000 L CNN
F 2 "" H 5650 1300 50  0001 C CNN
F 3 "" H 5650 1300 50  0001 C CNN
	1    5650 1300
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
Text GLabel 4350 1050 0    50   Input ~ 0
Rot_Clk
Text GLabel 4350 1150 0    50   Input ~ 0
Rot_DT
$Comp
L power:+5V #PWR?
U 1 1 5FDA62C3
P 4550 1750
F 0 "#PWR?" H 4550 1600 50  0001 C CNN
F 1 "+5V" V 4565 1878 50  0000 L CNN
F 2 "" H 4550 1750 50  0001 C CNN
F 3 "" H 4550 1750 50  0001 C CNN
	1    4550 1750
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R1
U 1 1 5FDA6344
P 4600 1500
F 0 "R1" H 4670 1546 50  0000 L CNN
F 1 "10k" H 4670 1455 50  0000 L CNN
F 2 "" V 4530 1500 50  0001 C CNN
F 3 "~" H 4600 1500 50  0001 C CNN
	1    4600 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5FDA63AE
P 4900 1500
F 0 "R2" H 4970 1546 50  0000 L CNN
F 1 "10k" H 4970 1455 50  0000 L CNN
F 2 "" V 4830 1500 50  0001 C CNN
F 3 "~" H 4900 1500 50  0001 C CNN
	1    4900 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 1050 4900 1050
Wire Wire Line
	4350 1150 4600 1150
Wire Wire Line
	4600 1350 4600 1150
Connection ~ 4600 1150
Wire Wire Line
	4600 1150 5050 1150
Wire Wire Line
	4900 1050 4900 1350
Connection ~ 4900 1050
Wire Wire Line
	4900 1050 5050 1050
Wire Wire Line
	4550 1750 4600 1750
Wire Wire Line
	4600 1750 4600 1650
Wire Wire Line
	4600 1750 4900 1750
Wire Wire Line
	4900 1750 4900 1650
Connection ~ 4600 1750
Text Notes 4450 1900 0    50   ~ 0
Pull Up resistors
Text GLabel 1800 1950 0    50   Output ~ 0
Buzz
$Comp
L Device:Buzzer BZ?
U 1 1 5FDA69A7
P 6800 1100
F 0 "BZ?" H 6953 1129 50  0001 L CNN
F 1 "Buzzer" H 6953 1083 50  0000 L CNN
F 2 "" V 6775 1200 50  0001 C CNN
F 3 "~" V 6775 1200 50  0001 C CNN
	1    6800 1100
	1    0    0    -1  
$EndComp
Text GLabel 6450 1000 0    50   Input ~ 0
Buzz
Wire Wire Line
	6450 1000 6700 1000
$Comp
L power:GND #PWR?
U 1 1 5FDA6EF6
P 6700 1200
F 0 "#PWR?" H 6700 950 50  0001 C CNN
F 1 "GND" V 6705 1072 50  0000 R CNN
F 2 "" H 6700 1200 50  0001 C CNN
F 3 "" H 6700 1200 50  0001 C CNN
	1    6700 1200
	0    1    1    0   
$EndComp
Wire Wire Line
	1800 2150 2000 2150
Wire Wire Line
	1800 1650 2000 1650
Wire Wire Line
	1800 2550 2000 2550
Text Notes 6100 1350 0    50   ~ 0
Buzzer for notifying user
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
Wire Wire Line
	1800 2250 2000 2250
Wire Wire Line
	1800 2650 2000 2650
$Comp
L My_lib:ESP8266 U?
U 1 1 5FDB7852
P 9850 3050
F 0 "U?" H 10250 3450 50  0001 C CNN
F 1 "ESP8266" H 10200 3400 50  0000 C CNN
F 2 "" H 9350 3450 50  0001 C CNN
F 3 "" H 9350 3450 50  0001 C CNN
	1    9850 3050
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
Text GLabel 8900 3250 0    50   Input ~ 0
RX
Text GLabel 8900 3050 0    50   Input ~ 0
TX
Wire Wire Line
	8900 3050 9150 3050
Wire Wire Line
	8900 3250 9150 3250
$Comp
L power:+3V3 #PWR?
U 1 1 5FDBA398
P 9850 2550
F 0 "#PWR?" H 9850 2400 50  0001 C CNN
F 1 "+3V3" H 9865 2723 50  0000 C CNN
F 2 "" H 9850 2550 50  0001 C CNN
F 3 "" H 9850 2550 50  0001 C CNN
	1    9850 2550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FDBA3D0
P 9850 3600
F 0 "#PWR?" H 9850 3350 50  0001 C CNN
F 1 "GND" H 9855 3427 50  0000 C CNN
F 2 "" H 9850 3600 50  0001 C CNN
F 3 "" H 9850 3600 50  0001 C CNN
	1    9850 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 3450 9850 3600
Wire Wire Line
	9850 2700 9850 2550
Text Notes 9050 3900 0    50   ~ 0
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
P 2750 3600
F 0 "R5" V 2957 3600 50  0000 C CNN
F 1 "220" V 2866 3600 50  0000 C CNN
F 2 "" V 2680 3600 50  0001 C CNN
F 3 "~" H 2750 3600 50  0001 C CNN
	1    2750 3600
	0    -1   -1   0   
$EndComp
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
Text Notes 1200 4950 0    50   ~ 0
Solenoid used for locking individual partitions. \nOperated trough shift register.
Wire Wire Line
	1850 3750 1850 4350
Wire Wire Line
	2600 3600 2550 3600
Text GLabel 2800 5900 2    50   Output ~ 0
Solenoid
Text GLabel 3000 3600 2    50   Input ~ 0
Solenoid
Wire Wire Line
	3000 3600 2900 3600
Wire Wire Line
	2000 1950 1800 1950
Wire Wire Line
	2000 2050 1800 2050
Wire Wire Line
	2000 2350 1800 2350
Wire Wire Line
	2000 2450 1800 2450
NoConn ~ 5050 1250
Wire Wire Line
	2750 4350 2750 4500
NoConn ~ 9150 2950
NoConn ~ 9150 3150
NoConn ~ 10550 2950
NoConn ~ 10550 3250
$Comp
L My_lib:74HC596 U?
U 1 1 5FEC2ABD
P 2200 6300
F 0 "U?" H 2200 7078 50  0001 C CNN
F 1 "74HC595" H 1950 6900 50  0000 C CNN
F 2 "" H 2200 6300 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT595.pdf" H 2200 6300 50  0001 C CNN
	1    2200 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 5900 2800 5900
Text GLabel 2800 6000 2    50   Output ~ 0
Solenoid
Wire Wire Line
	2600 6000 2800 6000
Text GLabel 2800 6100 2    50   Output ~ 0
Solenoid
Wire Wire Line
	2600 6100 2800 6100
Text GLabel 2800 6200 2    50   Output ~ 0
Solenoid
Wire Wire Line
	2600 6200 2800 6200
Text GLabel 2800 6300 2    50   Output ~ 0
Solenoid
Wire Wire Line
	2600 6300 2800 6300
Text GLabel 2800 6400 2    50   Output ~ 0
Solenoid
Wire Wire Line
	2600 6400 2800 6400
Text GLabel 2800 6500 2    50   Output ~ 0
Solenoid
Wire Wire Line
	2600 6500 2800 6500
Text GLabel 2800 6600 2    50   Output ~ 0
Solenoid
Wire Wire Line
	2600 6600 2800 6600
Text GLabel 1600 5900 0    50   Input ~ 0
Solenoid_DATA
Text GLabel 1600 6100 0    50   Input ~ 0
Solenoid_CLK
Text GLabel 1600 6400 0    50   Input ~ 0
Solenoid_STORE
Wire Wire Line
	1800 6400 1600 6400
Wire Wire Line
	1800 6100 1600 6100
Wire Wire Line
	1800 5900 1600 5900
Wire Wire Line
	2200 5700 2200 5500
$Comp
L power:+5V #PWR?
U 1 1 5FED5690
P 2200 5500
F 0 "#PWR?" H 2200 5350 50  0001 C CNN
F 1 "+5V" H 2215 5673 50  0000 C CNN
F 2 "" H 2200 5500 50  0001 C CNN
F 3 "" H 2200 5500 50  0001 C CNN
	1    2200 5500
	1    0    0    -1  
$EndComp
Text GLabel 1800 2050 0    50   Output ~ 0
Solenoid_DATA
Text GLabel 1800 2150 0    50   Output ~ 0
Solenoid_CLK
Text GLabel 1800 2350 0    50   Output ~ 0
Solenoid_STORE
Text GLabel 1800 2250 0    50   Output ~ 0
Solenoid_RESET
Text GLabel 1600 6200 0    50   Input ~ 0
Solenoid_RESET
Wire Wire Line
	1800 6200 1600 6200
NoConn ~ 1800 6500
NoConn ~ 2600 6800
$Comp
L power:GND #PWR?
U 1 1 5FEE9A3D
P 2200 7150
F 0 "#PWR?" H 2200 6900 50  0001 C CNN
F 1 "GND" H 2205 6977 50  0000 C CNN
F 2 "" H 2200 7150 50  0001 C CNN
F 3 "" H 2200 7150 50  0001 C CNN
	1    2200 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 7000 2200 7150
$Comp
L My_lib:analog_keypad U?
U 1 1 5FEF2A01
P 6000 2400
F 0 "U?" H 6000 2600 50  0001 C CNN
F 1 "analog_keypad" H 6427 2400 50  0000 L CNN
F 2 "" H 6000 2600 50  0001 C CNN
F 3 "" H 6000 2600 50  0001 C CNN
	1    6000 2400
	1    0    0    -1  
$EndComp
Text GLabel 3300 2050 2    50   Input ~ 0
Keypad
Wire Wire Line
	3000 2050 3300 2050
Text GLabel 5350 2300 0    50   Output ~ 0
Keypad
$Comp
L power:+5V #PWR?
U 1 1 5FEF769C
P 5000 2400
F 0 "#PWR?" H 5000 2250 50  0001 C CNN
F 1 "+5V" V 5015 2528 50  0000 L CNN
F 2 "" H 5000 2400 50  0001 C CNN
F 3 "" H 5000 2400 50  0001 C CNN
	1    5000 2400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5500 2300 5350 2300
Wire Wire Line
	5500 2400 5000 2400
$Comp
L power:GND #PWR?
U 1 1 5FEF9D8F
P 5000 2500
F 0 "#PWR?" H 5000 2250 50  0001 C CNN
F 1 "GND" V 5005 2372 50  0000 R CNN
F 2 "" H 5000 2500 50  0001 C CNN
F 3 "" H 5000 2500 50  0001 C CNN
	1    5000 2500
	0    1    1    0   
$EndComp
Wire Wire Line
	5500 2500 5000 2500
$Comp
L 74xx:74LS151 U?
U 1 1 5FEFB817
P 6400 4700
F 0 "U?" H 6400 5778 50  0001 C CNN
F 1 "74LS151" H 6650 5600 50  0000 C CNN
F 2 "" H 6400 4700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS151" H 6400 4700 50  0001 C CNN
	1    6400 4700
	-1   0    0    -1  
$EndComp
Text GLabel 3300 2150 2    50   Input ~ 0
Magnet_Mux
Wire Wire Line
	3300 2150 3000 2150
Text GLabel 5600 4100 0    50   Output ~ 0
Magnet_Mux
Wire Wire Line
	5900 4100 5600 4100
NoConn ~ 5900 4200
NoConn ~ 6900 5400
Text GLabel 1800 2450 0    50   Output ~ 0
Mux_S0
Text GLabel 1800 2550 0    50   Output ~ 0
Mux_S1
Text GLabel 1800 2650 0    50   Output ~ 0
Mux_S2
Text GLabel 7150 5000 2    50   Output ~ 0
Mux_S0
Text GLabel 7150 5100 2    50   Output ~ 0
Mux_S1
Text GLabel 7150 5200 2    50   Output ~ 0
Mux_S2
Wire Wire Line
	6900 5000 7150 5000
Wire Wire Line
	6900 5100 7150 5100
Wire Wire Line
	6900 5200 7150 5200
$Comp
L power:+5V #PWR?
U 1 1 5FF0ED25
P 6400 3600
F 0 "#PWR?" H 6400 3450 50  0001 C CNN
F 1 "+5V" H 6415 3773 50  0000 C CNN
F 2 "" H 6400 3600 50  0001 C CNN
F 3 "" H 6400 3600 50  0001 C CNN
	1    6400 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 3600 6400 3800
$Comp
L power:GND #PWR?
U 1 1 5FF1071E
P 6400 5800
F 0 "#PWR?" H 6400 5550 50  0001 C CNN
F 1 "GND" H 6405 5627 50  0000 C CNN
F 2 "" H 6400 5800 50  0001 C CNN
F 3 "" H 6400 5800 50  0001 C CNN
	1    6400 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 5700 6400 5800
$Comp
L Switch:SW_Reed SW?
U 1 1 5FF122C7
P 9150 4700
F 0 "SW?" V 9104 4785 50  0001 L CNN
F 1 "SW_Reed" V 9150 4785 50  0000 L CNN
F 2 "" H 9150 4700 50  0001 C CNN
F 3 "" H 9150 4700 50  0001 C CNN
	1    9150 4700
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FF13DB9
P 9150 4400
F 0 "#PWR?" H 9150 4250 50  0001 C CNN
F 1 "+5V" H 9165 4573 50  0000 C CNN
F 2 "" H 9150 4400 50  0001 C CNN
F 3 "" H 9150 4400 50  0001 C CNN
	1    9150 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 4400 9150 4500
$Comp
L power:GND #PWR?
U 1 1 5FF1580F
P 9150 5550
F 0 "#PWR?" H 9150 5300 50  0001 C CNN
F 1 "GND" H 9155 5377 50  0000 C CNN
F 2 "" H 9150 5550 50  0001 C CNN
F 3 "" H 9150 5550 50  0001 C CNN
	1    9150 5550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5FF1C5D6
P 9150 5250
F 0 "R?" H 9220 5296 50  0000 L CNN
F 1 "10k" H 9220 5205 50  0000 L CNN
F 2 "" V 9080 5250 50  0001 C CNN
F 3 "~" H 9150 5250 50  0001 C CNN
	1    9150 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 4900 9150 5000
Wire Wire Line
	9150 5400 9150 5550
Wire Wire Line
	9150 5000 8800 5000
Connection ~ 9150 5000
Wire Wire Line
	9150 5000 9150 5100
Text GLabel 8800 5000 0    50   Output ~ 0
Magnet_Sensor
Text GLabel 7150 4100 2    50   Input ~ 0
Magnet_Sensor
Wire Wire Line
	7150 4100 6900 4100
Text GLabel 7150 4200 2    50   Input ~ 0
Magnet_Sensor
Wire Wire Line
	7150 4200 6900 4200
Text GLabel 7150 4300 2    50   Input ~ 0
Magnet_Sensor
Wire Wire Line
	7150 4300 6900 4300
Text GLabel 7150 4400 2    50   Input ~ 0
Magnet_Sensor
Wire Wire Line
	7150 4400 6900 4400
Text GLabel 7150 4500 2    50   Input ~ 0
Magnet_Sensor
Wire Wire Line
	7150 4500 6900 4500
Text GLabel 7150 4600 2    50   Input ~ 0
Magnet_Sensor
Wire Wire Line
	7150 4600 6900 4600
Text GLabel 7150 4700 2    50   Input ~ 0
Magnet_Sensor
Wire Wire Line
	7150 4700 6900 4700
Text GLabel 7150 4800 2    50   Input ~ 0
Magnet_Sensor
Wire Wire Line
	7150 4800 6900 4800
Text Notes 8300 6050 0    50   ~ 0
Each partition will have its own magnet detector, \nwhich will detect if its open or not.
Text Notes 5600 6250 0    50   ~ 0
Multiplexer for connecting multiple sensors
$Comp
L Device:LED D?
U 1 1 5FF2D6BE
P 2550 3800
F 0 "D?" V 2588 3683 50  0001 R CNN
F 1 "LED" V 2542 3683 50  0000 R CNN
F 2 "" H 2550 3800 50  0001 C CNN
F 3 "~" H 2550 3800 50  0001 C CNN
	1    2550 3800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2550 3600 2550 3650
Wire Wire Line
	2550 3950 2550 4050
Text Notes 2850 4000 0    50   ~ 0
Led signaling that partition is open
Text Notes 1100 7600 0    50   ~ 0
Shift register used for operating solenoids
$EndSCHEMATC
