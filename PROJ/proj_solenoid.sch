EESchema Schematic File Version 4
LIBS:proj_solenoid-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Pill helper V1.4 (solenoid approach)"
Date "2020-12-26"
Rev "1.4"
Comp "FEL CVUT"
Comment1 "First potential implementation of Pill helper"
Comment2 "Most of the functionality is theoretical, implemented features may and will differ"
Comment3 ""
Comment4 "Author: Jakub Jira"
$EndDescr
$Comp
L MCU_Module:Arduino_UNO_R3 A?
U 1 1 5FD8FBFE
P 3600 1950
F 0 "A?" H 3600 3128 50  0001 C CNN
F 1 "Arduino_UNO_R3" H 4200 2950 50  0000 C CNN
F 2 "Module:Arduino_UNO_R3" H 3750 900 50  0001 L CNN
F 3 "https://www.arduino.cc/en/Main/arduinoBoardUno" H 3400 3000 50  0001 C CNN
	1    3600 1950
	1    0    0    -1  
$EndComp
$Comp
L Device:Rotary_Encoder_KY-040 SW?
U 1 1 5FD97BB7
P 7950 2150
F 0 "SW?" H 7950 2525 50  0001 C CNN
F 1 "Rotary_Encoder_KY-040" H 7950 2433 50  0000 C CNN
F 2 "" H 7800 2310 50  0001 C CNN
F 3 "~" H 7950 2410 50  0001 C CNN
	1    7950 2150
	1    0    0    -1  
$EndComp
Text Notes 7600 2050 0    50   ~ 0
Clk
Text Notes 7600 2150 0    50   ~ 0
DT
Text Notes 7600 2250 0    50   ~ 0
SW
$Comp
L power:GND #PWR?
U 1 1 5FDA60FC
P 8250 2000
F 0 "#PWR?" H 8250 1750 50  0001 C CNN
F 1 "GND" V 8255 1872 50  0000 R CNN
F 2 "" H 8250 2000 50  0001 C CNN
F 3 "" H 8250 2000 50  0001 C CNN
	1    8250 2000
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FDA6182
P 8250 2300
F 0 "#PWR?" H 8250 2150 50  0001 C CNN
F 1 "+5V" V 8265 2428 50  0000 L CNN
F 2 "" H 8250 2300 50  0001 C CNN
F 3 "" H 8250 2300 50  0001 C CNN
	1    8250 2300
	0    1    1    0   
$EndComp
Text GLabel 2900 1650 0    50   Output ~ 0
Rot_Clk
Text GLabel 2900 1750 0    50   Output ~ 0
Rot_DT
Wire Wire Line
	2900 1650 3100 1650
Wire Wire Line
	2900 1750 3100 1750
Text GLabel 6950 2050 0    50   Input ~ 0
Rot_Clk
Text GLabel 6950 2150 0    50   Input ~ 0
Rot_DT
$Comp
L power:+5V #PWR?
U 1 1 5FDA62C3
P 7150 2750
F 0 "#PWR?" H 7150 2600 50  0001 C CNN
F 1 "+5V" V 7165 2878 50  0000 L CNN
F 2 "" H 7150 2750 50  0001 C CNN
F 3 "" H 7150 2750 50  0001 C CNN
	1    7150 2750
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R1
U 1 1 5FDA6344
P 7200 2500
F 0 "R1" H 7270 2546 50  0000 L CNN
F 1 "10k" H 7270 2455 50  0000 L CNN
F 2 "" V 7130 2500 50  0001 C CNN
F 3 "~" H 7200 2500 50  0001 C CNN
	1    7200 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5FDA63AE
P 7500 2500
F 0 "R2" H 7570 2546 50  0000 L CNN
F 1 "10k" H 7570 2455 50  0000 L CNN
F 2 "" V 7430 2500 50  0001 C CNN
F 3 "~" H 7500 2500 50  0001 C CNN
	1    7500 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 2050 7500 2050
Wire Wire Line
	6950 2150 7200 2150
Wire Wire Line
	7200 2350 7200 2150
Connection ~ 7200 2150
Wire Wire Line
	7200 2150 7650 2150
Wire Wire Line
	7500 2050 7500 2350
Connection ~ 7500 2050
Wire Wire Line
	7500 2050 7650 2050
Wire Wire Line
	7150 2750 7200 2750
Wire Wire Line
	7200 2750 7200 2650
Wire Wire Line
	7200 2750 7500 2750
Wire Wire Line
	7500 2750 7500 2650
Connection ~ 7200 2750
Text Notes 7050 2900 0    50   ~ 0
Pull Up resistors
Text GLabel 2900 1850 0    50   Output ~ 0
Speaker
Text GLabel 7300 1000 0    50   Input ~ 0
Speaker
Wire Wire Line
	7300 1000 7550 1000
$Comp
L power:GND #PWR?
U 1 1 5FDA6EF6
P 7500 1100
F 0 "#PWR?" H 7500 850 50  0001 C CNN
F 1 "GND" V 7505 972 50  0000 R CNN
F 2 "" H 7500 1100 50  0001 C CNN
F 3 "" H 7500 1100 50  0001 C CNN
	1    7500 1100
	0    1    1    0   
$EndComp
Wire Wire Line
	2900 2050 3100 2050
Wire Wire Line
	2900 1550 3100 1550
Wire Wire Line
	2900 2450 3100 2450
Text Notes 7150 1350 0    50   ~ 0
Speaker for notifying user
$Comp
L Display_Character:EA_T123X-I2C U?
U 1 1 5FDA9357
P 9800 1350
F 0 "U?" H 10229 1396 50  0001 L CNN
F 1 "LCD-I2C-display" H 10229 1350 50  0000 L CNN
F 2 "Display:EA_T123X-I2C" H 9800 750 50  0001 C CNN
F 3 "http://www.lcd-module.de/pdf/doma/t123-i2c.pdf" H 9800 850 50  0001 C CNN
	1    9800 1350
	1    0    0    -1  
$EndComp
Text Notes 9250 2000 0    50   ~ 0
Generic I2C display\nUsed for displaying time for user
Text GLabel 4400 2350 2    50   Output ~ 0
Display_SDA
Text GLabel 4400 2450 2    50   Output ~ 0
Display_SCL
Wire Wire Line
	4100 2350 4400 2350
Wire Wire Line
	4100 2450 4400 2450
Text GLabel 9000 1150 0    50   Input ~ 0
Display_SDA
Text GLabel 9000 1050 0    50   Input ~ 0
Display_SCL
Wire Wire Line
	9000 1050 9300 1050
Wire Wire Line
	9000 1150 9300 1150
$Comp
L power:+5V #PWR?
U 1 1 5FDAE85E
P 9300 1700
F 0 "#PWR?" H 9300 1550 50  0001 C CNN
F 1 "+5V" V 9315 1828 50  0000 L CNN
F 2 "" H 9300 1700 50  0001 C CNN
F 3 "" H 9300 1700 50  0001 C CNN
	1    9300 1700
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FDAF034
P 9300 1600
F 0 "#PWR?" H 9300 1350 50  0001 C CNN
F 1 "GND" V 9305 1472 50  0000 R CNN
F 2 "" H 9300 1600 50  0001 C CNN
F 3 "" H 9300 1600 50  0001 C CNN
	1    9300 1600
	0    1    1    0   
$EndComp
Wire Wire Line
	2900 2150 3100 2150
Wire Wire Line
	2900 2550 3100 2550
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
Text GLabel 2900 1350 0    50   Output ~ 0
RX
Text GLabel 2900 1450 0    50   Output ~ 0
TX
Wire Wire Line
	3100 1350 2900 1350
Wire Wire Line
	3100 1450 2900 1450
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
P 2500 4350
F 0 "Q?" H 2691 4396 50  0001 L CNN
F 1 "2N3904" V 2450 3950 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 2700 4275 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 2500 4350 50  0001 L CNN
	1    2500 4350
	0    -1   1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FDBEE44
P 2700 4600
F 0 "#PWR?" H 2700 4350 50  0001 C CNN
F 1 "GND" H 2705 4427 50  0000 C CNN
F 2 "" H 2700 4600 50  0001 C CNN
F 3 "" H 2700 4600 50  0001 C CNN
	1    2700 4600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5FDBF5E7
P 2700 3700
F 0 "R5" V 2907 3700 50  0000 C CNN
F 1 "220" V 2816 3700 50  0000 C CNN
F 2 "" V 2630 3700 50  0001 C CNN
F 3 "~" H 2700 3700 50  0001 C CNN
	1    2700 3700
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FDBFEC7
P 1800 3850
F 0 "#PWR?" H 1800 3700 50  0001 C CNN
F 1 "+5V" H 1815 4023 50  0000 C CNN
F 2 "" H 1800 3850 50  0001 C CNN
F 3 "" H 1800 3850 50  0001 C CNN
	1    1800 3850
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4001 D?
U 1 1 5FDC573A
P 2050 4450
F 0 "D?" H 2050 4666 50  0001 C CNN
F 1 "1N4001" H 2050 4574 50  0000 C CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 2050 4275 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 2050 4450 50  0001 C CNN
	1    2050 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 4450 1800 4450
Wire Wire Line
	2300 4450 2250 4450
Wire Wire Line
	1900 4450 1800 4450
Connection ~ 1800 4450
$Comp
L My_lib:Solenoid U?
U 1 1 5FDBCCC0
P 1400 4550
F 0 "U?" H 1380 4875 50  0001 C CNN
F 1 "Solenoid_5V" H 1400 4800 50  0000 C CNN
F 2 "" H 1400 4800 50  0001 C CNN
F 3 "" H 1400 4800 50  0001 C CNN
	1    1400 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 4600 2250 4600
Wire Wire Line
	2250 4600 2250 4450
Connection ~ 2250 4450
Wire Wire Line
	2250 4450 2200 4450
Text Notes 1150 5050 0    50   ~ 0
Solenoid used for locking individual partitions. \nOperated trough shift register.
Wire Wire Line
	1800 3850 1800 4450
Wire Wire Line
	2550 3700 2500 3700
Text GLabel 2800 5900 2    50   Output ~ 0
Solenoid
Text GLabel 2950 3700 2    50   Input ~ 0
Solenoid
Wire Wire Line
	2950 3700 2850 3700
Wire Wire Line
	3100 1850 2900 1850
Wire Wire Line
	3100 1950 2900 1950
Wire Wire Line
	3100 2250 2900 2250
Wire Wire Line
	3100 2350 2900 2350
NoConn ~ 7650 2250
Wire Wire Line
	2700 4450 2700 4600
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
Text GLabel 2900 1950 0    50   Output ~ 0
Solenoid_DATA
Text GLabel 2900 2050 0    50   Output ~ 0
Solenoid_CLK
Text GLabel 2900 2250 0    50   Output ~ 0
Solenoid_STORE
Text GLabel 2900 2150 0    50   Output ~ 0
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
P 7500 3650
F 0 "U?" H 7500 3850 50  0001 C CNN
F 1 "analog_keypad" H 7927 3650 50  0000 L CNN
F 2 "" H 7500 3850 50  0001 C CNN
F 3 "" H 7500 3850 50  0001 C CNN
	1    7500 3650
	1    0    0    -1  
$EndComp
Text GLabel 4400 1950 2    50   Input ~ 0
Keypad
Wire Wire Line
	4100 1950 4400 1950
Text GLabel 6850 3550 0    50   Output ~ 0
Keypad
$Comp
L power:+5V #PWR?
U 1 1 5FEF769C
P 6500 3650
F 0 "#PWR?" H 6500 3500 50  0001 C CNN
F 1 "+5V" V 6515 3778 50  0000 L CNN
F 2 "" H 6500 3650 50  0001 C CNN
F 3 "" H 6500 3650 50  0001 C CNN
	1    6500 3650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7000 3550 6850 3550
Wire Wire Line
	7000 3650 6500 3650
$Comp
L power:GND #PWR?
U 1 1 5FEF9D8F
P 6500 3750
F 0 "#PWR?" H 6500 3500 50  0001 C CNN
F 1 "GND" V 6505 3622 50  0000 R CNN
F 2 "" H 6500 3750 50  0001 C CNN
F 3 "" H 6500 3750 50  0001 C CNN
	1    6500 3750
	0    1    1    0   
$EndComp
Wire Wire Line
	7000 3750 6500 3750
$Comp
L 74xx:74LS151 U?
U 1 1 5FEFB817
P 5400 5550
F 0 "U?" H 5400 6628 50  0001 C CNN
F 1 "74LS151" H 5650 6450 50  0000 C CNN
F 2 "" H 5400 5550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS151" H 5400 5550 50  0001 C CNN
	1    5400 5550
	-1   0    0    -1  
$EndComp
Text GLabel 4400 2050 2    50   Input ~ 0
Magnet_Mux
Wire Wire Line
	4400 2050 4100 2050
Text GLabel 4600 4950 0    50   Output ~ 0
Magnet_Mux
Wire Wire Line
	4900 4950 4600 4950
NoConn ~ 4900 5050
NoConn ~ 5900 6250
Text GLabel 2900 2350 0    50   Output ~ 0
Mux_S0
Text GLabel 2900 2450 0    50   Output ~ 0
Mux_S1
Text GLabel 2900 2550 0    50   Output ~ 0
Mux_S2
Text GLabel 6150 5850 2    50   Output ~ 0
Mux_S0
Text GLabel 6150 5950 2    50   Output ~ 0
Mux_S1
Text GLabel 6150 6050 2    50   Output ~ 0
Mux_S2
Wire Wire Line
	5900 5850 6150 5850
Wire Wire Line
	5900 5950 6150 5950
Wire Wire Line
	5900 6050 6150 6050
$Comp
L power:+5V #PWR?
U 1 1 5FF0ED25
P 5400 4450
F 0 "#PWR?" H 5400 4300 50  0001 C CNN
F 1 "+5V" H 5415 4623 50  0000 C CNN
F 2 "" H 5400 4450 50  0001 C CNN
F 3 "" H 5400 4450 50  0001 C CNN
	1    5400 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 4450 5400 4650
$Comp
L power:GND #PWR?
U 1 1 5FF1071E
P 5400 6650
F 0 "#PWR?" H 5400 6400 50  0001 C CNN
F 1 "GND" H 5405 6477 50  0000 C CNN
F 2 "" H 5400 6650 50  0001 C CNN
F 3 "" H 5400 6650 50  0001 C CNN
	1    5400 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 6550 5400 6650
$Comp
L Switch:SW_Reed SW?
U 1 1 5FF122C7
P 8200 5050
F 0 "SW?" V 8154 5135 50  0001 L CNN
F 1 "SW_Reed" V 8200 5135 50  0000 L CNN
F 2 "" H 8200 5050 50  0001 C CNN
F 3 "" H 8200 5050 50  0001 C CNN
	1    8200 5050
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FF13DB9
P 8200 4750
F 0 "#PWR?" H 8200 4600 50  0001 C CNN
F 1 "+5V" H 8215 4923 50  0000 C CNN
F 2 "" H 8200 4750 50  0001 C CNN
F 3 "" H 8200 4750 50  0001 C CNN
	1    8200 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 4750 8200 4850
$Comp
L power:GND #PWR?
U 1 1 5FF1580F
P 8200 5900
F 0 "#PWR?" H 8200 5650 50  0001 C CNN
F 1 "GND" H 8205 5727 50  0000 C CNN
F 2 "" H 8200 5900 50  0001 C CNN
F 3 "" H 8200 5900 50  0001 C CNN
	1    8200 5900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5FF1C5D6
P 8200 5600
F 0 "R?" H 8270 5646 50  0000 L CNN
F 1 "10k" H 8270 5555 50  0000 L CNN
F 2 "" V 8130 5600 50  0001 C CNN
F 3 "~" H 8200 5600 50  0001 C CNN
	1    8200 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 5250 8200 5350
Wire Wire Line
	8200 5750 8200 5900
Wire Wire Line
	8200 5350 7850 5350
Connection ~ 8200 5350
Wire Wire Line
	8200 5350 8200 5450
Text GLabel 7850 5350 0    50   Output ~ 0
Magnet_Sensor
Text GLabel 6150 4950 2    50   Input ~ 0
Magnet_Sensor
Wire Wire Line
	6150 4950 5900 4950
Text GLabel 6150 5050 2    50   Input ~ 0
Magnet_Sensor
Wire Wire Line
	6150 5050 5900 5050
Text GLabel 6150 5150 2    50   Input ~ 0
Magnet_Sensor
Wire Wire Line
	6150 5150 5900 5150
Text GLabel 6150 5250 2    50   Input ~ 0
Magnet_Sensor
Wire Wire Line
	6150 5250 5900 5250
Text GLabel 6150 5350 2    50   Input ~ 0
Magnet_Sensor
Wire Wire Line
	6150 5350 5900 5350
Text GLabel 6150 5450 2    50   Input ~ 0
Magnet_Sensor
Wire Wire Line
	6150 5450 5900 5450
Text GLabel 6150 5550 2    50   Input ~ 0
Magnet_Sensor
Wire Wire Line
	6150 5550 5900 5550
Text GLabel 6150 5650 2    50   Input ~ 0
Magnet_Sensor
Wire Wire Line
	6150 5650 5900 5650
Text Notes 7350 6400 0    50   ~ 0
Each partition will have its own magnet detector, \nwhich will detect if its open or not.
Text Notes 4600 7100 0    50   ~ 0
Multiplexer for connecting multiple sensors
$Comp
L Device:LED D?
U 1 1 5FF2D6BE
P 2500 3900
F 0 "D?" V 2538 3783 50  0001 R CNN
F 1 "LED" V 2492 3783 50  0000 R CNN
F 2 "" H 2500 3900 50  0001 C CNN
F 3 "~" H 2500 3900 50  0001 C CNN
	1    2500 3900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2500 3700 2500 3750
Wire Wire Line
	2500 4050 2500 4150
Text Notes 2800 4100 0    50   ~ 0
Led signaling that partition is open
Text Notes 1100 7600 0    50   ~ 0
Shift register used for operating solenoids
$Comp
L power:+12V #PWR?
U 1 1 5FEC8D87
P 1050 750
F 0 "#PWR?" H 1050 600 50  0001 C CNN
F 1 "+12V" V 1065 878 50  0000 L CNN
F 2 "" H 1050 750 50  0001 C CNN
F 3 "" H 1050 750 50  0001 C CNN
	1    1050 750 
	0    -1   -1   0   
$EndComp
$Comp
L Diode:1N4001 D?
U 1 1 5FEC8DB5
P 1950 1150
F 0 "D?" H 1950 1366 50  0001 C CNN
F 1 "1N4001" V 1950 1350 50  0000 C CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 1950 975 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 1950 1150 50  0001 C CNN
	1    1950 1150
	0    1    1    0   
$EndComp
$Comp
L Diode:1N4001 D?
U 1 1 5FECD82E
P 1350 750
F 0 "D?" H 1350 966 50  0001 C CNN
F 1 "1N4001" H 1350 874 50  0000 C CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 1350 575 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 1350 750 50  0001 C CNN
	1    1350 750 
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 5FED4855
P 1600 1150
F 0 "R?" H 1670 1196 50  0001 L CNN
F 1 "10k" H 1700 1150 50  0000 L CNN
F 2 "" V 1530 1150 50  0001 C CNN
F 3 "~" H 1600 1150 50  0001 C CNN
	1    1600 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 750  1200 750 
Wire Wire Line
	1500 750  1600 750 
Wire Wire Line
	1600 750  1600 1000
Wire Wire Line
	1600 750  1950 750 
Wire Wire Line
	3500 750  3500 950 
Connection ~ 1600 750 
Wire Wire Line
	1950 1000 1950 750 
Connection ~ 1950 750 
Wire Wire Line
	1950 750  3500 750 
Wire Wire Line
	1950 1300 1950 1500
Wire Wire Line
	1950 1500 1600 1500
Wire Wire Line
	1600 1500 1600 1300
Wire Wire Line
	1600 1500 1600 1650
Connection ~ 1600 1500
$Comp
L Device:Battery BT?
U 1 1 5FEE7290
P 1600 1850
F 0 "BT?" H 1708 1896 50  0001 L CNN
F 1 "10V Battery" H 1708 1850 50  0000 L CNN
F 2 "" V 1600 1910 50  0001 C CNN
F 3 "~" V 1600 1910 50  0001 C CNN
	1    1600 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 2050 1600 2200
Wire Wire Line
	1600 2200 1000 2200
Wire Wire Line
	1600 2200 1600 3200
Wire Wire Line
	1600 3200 3500 3200
Wire Wire Line
	3500 3200 3500 3050
Connection ~ 1600 2200
$Comp
L power:GND #PWR?
U 1 1 5FEEDA1E
P 1000 2200
F 0 "#PWR?" H 1000 1950 50  0001 C CNN
F 1 "GND" V 1005 2072 50  0000 R CNN
F 2 "" H 1000 2200 50  0001 C CNN
F 3 "" H 1000 2200 50  0001 C CNN
	1    1000 2200
	0    1    1    0   
$EndComp
$Comp
L Device:Speaker LS?
U 1 1 60008504
P 7750 1000
F 0 "LS?" H 7920 996 50  0001 L CNN
F 1 "Speaker" H 7920 950 50  0000 L CNN
F 2 "" H 7750 800 50  0001 C CNN
F 3 "~" H 7740 950 50  0001 C CNN
	1    7750 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 1100 7500 1100
Text GLabel 4400 2150 2    50   Input ~ 0
Offline-online_switch
Wire Wire Line
	4100 2150 4400 2150
$Comp
L Switch:SW_DIP_x01 SW?
U 1 1 60016750
P 5950 1100
F 0 "SW?" H 5950 1367 50  0001 C CNN
F 1 "SW_DIP_x01" H 5950 1275 50  0000 C CNN
F 2 "" H 5950 1100 50  0001 C CNN
F 3 "" H 5950 1100 50  0001 C CNN
	1    5950 1100
	1    0    0    -1  
$EndComp
Text GLabel 5550 1100 0    50   Output ~ 0
Offline-online_switch
$Comp
L power:+3.3V #PWR?
U 1 1 6001D755
P 6450 1100
F 0 "#PWR?" H 6450 950 50  0001 C CNN
F 1 "+3.3V" V 6465 1228 50  0000 L CNN
F 2 "" H 6450 1100 50  0001 C CNN
F 3 "" H 6450 1100 50  0001 C CNN
	1    6450 1100
	0    1    1    0   
$EndComp
Wire Wire Line
	6450 1100 6250 1100
Wire Wire Line
	5650 1100 5550 1100
Text Notes 5350 1400 0    50   ~ 0
Switch for switching between \noffline and online mode
$EndSCHEMATC
