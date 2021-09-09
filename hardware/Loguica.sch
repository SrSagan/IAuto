EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 3
Title "IAuto"
Date ""
Rev "0.1"
Comp "E.E.S.T. N°5"
Comment1 "Autor: Maximiliano Barzola "
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 3000 2700 2    50   ~ 0
EN
Wire Wire Line
	3000 2700 3100 2700
Text Label 4500 3900 0    50   ~ 0
GPIO0
Wire Wire Line
	4500 3900 4400 3900
Text Label 4500 4000 0    50   ~ 0
RXD
Text Label 4500 3800 0    50   ~ 0
TXD
$Comp
L MacroLib:CONN_02X20 P1
U 1 1 60E26820
P 9000 3450
F 0 "P1" H 9000 4665 50  0000 C CNN
F 1 "CONN_02X20" H 9000 4574 50  0000 C CNN
F 2 "EESTN5:Pin_Header_Straight_2x20" H 9000 4200 50  0001 C CNN
F 3 "" H 9000 4200 50  0001 C CNN
	1    9000 3450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR04
U 1 1 60E28E27
P 9550 2300
F 0 "#PWR04" H 9550 2150 50  0001 C CNN
F 1 "+5V" H 9565 2473 50  0000 C CNN
F 2 "" H 9550 2300 50  0001 C CNN
F 3 "" H 9550 2300 50  0001 C CNN
	1    9550 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 60E3089C
P 8400 4500
F 0 "#PWR03" H 8400 4250 50  0001 C CNN
F 1 "GND" H 8405 4327 50  0000 C CNN
F 2 "" H 8400 4500 50  0001 C CNN
F 3 "" H 8400 4500 50  0001 C CNN
	1    8400 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 2300 9550 2400
Wire Wire Line
	9550 2500 9350 2500
Wire Wire Line
	9250 2600 9350 2600
Wire Wire Line
	9350 2600 9350 2500
Connection ~ 9350 2500
Wire Wire Line
	9350 2500 9250 2500
$Comp
L power:GND #PWR05
U 1 1 60E4AFBC
P 9600 4200
F 0 "#PWR05" H 9600 3950 50  0001 C CNN
F 1 "GND" H 9605 4027 50  0000 C CNN
F 2 "" H 9600 4200 50  0001 C CNN
F 3 "" H 9600 4200 50  0001 C CNN
	1    9600 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 4500 8400 4400
Wire Wire Line
	8400 4400 8750 4400
Wire Wire Line
	8400 4400 8400 3700
Connection ~ 8400 4400
Wire Wire Line
	8400 3700 8750 3700
Wire Wire Line
	8400 3700 8400 2900
Connection ~ 8400 3700
Wire Wire Line
	8400 2900 8750 2900
Wire Wire Line
	9250 4100 9600 4100
Wire Wire Line
	9600 4100 9600 4200
Wire Wire Line
	9600 2700 9600 3100
Connection ~ 9600 4100
Wire Wire Line
	9250 2700 9600 2700
Connection ~ 9600 3400
Wire Wire Line
	9600 3400 9600 3900
Wire Wire Line
	9250 3400 9600 3400
Wire Wire Line
	9250 3100 9600 3100
Connection ~ 9600 3100
Wire Wire Line
	9600 3100 9600 3400
Wire Wire Line
	9250 3900 9600 3900
Connection ~ 9600 3900
Wire Wire Line
	9600 3900 9600 4100
Text Label 8650 3400 2    50   ~ 0
MOSI
Text Label 8650 3500 2    50   ~ 0
MISO
Wire Wire Line
	8650 3500 8750 3500
Wire Wire Line
	8650 3400 8750 3400
Text Label 8650 3600 2    50   ~ 0
CLK
Text Label 9350 3600 0    50   ~ 0
CS
Wire Wire Line
	9350 3600 9250 3600
Wire Wire Line
	8750 3600 8650 3600
Text Label 2750 3700 2    50   ~ 0
MOSI
Text Label 2750 3800 2    50   ~ 0
MISO
Text Label 3000 4000 2    50   ~ 0
CLK
Text GLabel 4500 2800 2    50   Input ~ 0
AIN1
Text GLabel 4500 3100 2    50   Input ~ 0
AIN2
Text GLabel 3000 3300 0    50   Input ~ 0
BIN1
Text GLabel 3000 3600 0    50   Input ~ 0
BIN2
Wire Wire Line
	4400 3100 4500 3100
Wire Wire Line
	3000 3600 3100 3600
Wire Wire Line
	4500 3300 4400 3300
Wire Wire Line
	4500 3500 4400 3500
Text GLabel 3000 2800 0    50   Input ~ 0
AO1
Text GLabel 4500 2700 2    50   Input ~ 0
AO2
Wire Wire Line
	3000 2800 3100 2800
Wire Wire Line
	4500 4000 4400 4000
Wire Wire Line
	4500 3800 4400 3800
Text Label 2650 3100 2    50   ~ 0
GPIO35
Wire Wire Line
	2650 3000 3100 3000
Wire Wire Line
	3100 3100 2650 3100
Wire Wire Line
	3100 3200 2650 3200
Wire Wire Line
	3100 3300 3000 3300
Wire Wire Line
	3100 3400 2650 3400
Wire Wire Line
	3100 3500 2650 3500
Text Label 2650 3200 2    50   ~ 0
GPIO32
Text Label 4500 3500 0    50   ~ 0
GPIO5
Text Label 2650 3400 2    50   ~ 0
GPIO25
Text Label 2650 3500 2    50   ~ 0
GPIO26
Text GLabel 7100 3650 2    50   Input ~ 0
+5VF
$Comp
L MacroLib:ESP32_NODEMCU U1
U 1 1 60E15DDE
P 3750 2800
F 0 "U1" H 3750 3265 50  0000 C CNN
F 1 "ESP32_NODEMCU" H 3750 3174 50  0000 C CNN
F 2 "MacroLib:NodeMCU-ESP32" H 3750 3400 50  0001 C CNN
F 3 "" H 3750 3400 50  0001 C CNN
	1    3750 2800
	1    0    0    -1  
$EndComp
Text Label 4500 3600 0    50   ~ 0
SDA
Text Label 4500 3700 0    50   ~ 0
SCL
Wire Wire Line
	4500 2800 4400 2800
Wire Wire Line
	3000 4000 3100 4000
Wire Wire Line
	2750 3800 3100 3800
Wire Wire Line
	2750 3700 3100 3700
Wire Wire Line
	4500 4100 4400 4100
Wire Wire Line
	4400 3700 4500 3700
Wire Wire Line
	4400 3600 4500 3600
Text Label 9350 2900 0    50   ~ 0
RXD
Text Label 9350 2800 0    50   ~ 0
TXD
Wire Wire Line
	9350 2800 9250 2800
Wire Wire Line
	9350 2900 9250 2900
Text Label 8650 2600 2    50   ~ 0
SDA
Text Label 8650 2700 2    50   ~ 0
SCL
Wire Wire Line
	8650 2600 8750 2600
Wire Wire Line
	8650 2700 8750 2700
$Comp
L power:GND #PWR01
U 1 1 60E2B635
P 2700 4350
F 0 "#PWR01" H 2700 4100 50  0001 C CNN
F 1 "GND" H 2705 4177 50  0000 C CNN
F 2 "" H 2700 4350 50  0001 C CNN
F 3 "" H 2700 4350 50  0001 C CNN
	1    2700 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 4350 2700 3900
Wire Wire Line
	2700 3900 3100 3900
$Comp
L power:GND #PWR02
U 1 1 60E365DC
P 5050 3400
F 0 "#PWR02" H 5050 3150 50  0001 C CNN
F 1 "GND" H 5055 3227 50  0000 C CNN
F 2 "" H 5050 3400 50  0001 C CNN
F 3 "" H 5050 3400 50  0001 C CNN
	1    5050 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 3200 5050 3200
Wire Wire Line
	5050 3200 5050 3400
Wire Wire Line
	4400 2600 5050 2600
Wire Wire Line
	5050 2600 5050 3200
Connection ~ 5050 3200
Wire Wire Line
	9550 2400 9650 2400
Connection ~ 9550 2400
Wire Wire Line
	9550 2400 9550 2500
Text Label 9650 2400 0    50   ~ 0
+5V
Text Label 3000 4400 2    50   ~ 0
+5V
Wire Wire Line
	3000 4400 3100 4400
Text Label 6400 3450 2    50   ~ 0
GPIO35
Text Label 6400 3350 2    50   ~ 0
GPIO32
Text Label 7100 3250 0    50   ~ 0
GPIO5
Text Label 6400 3250 2    50   ~ 0
GPIO26
Wire Wire Line
	6400 3150 6500 3150
Wire Wire Line
	6400 3250 6500 3250
Wire Wire Line
	7100 3650 7000 3650
Wire Wire Line
	7100 3150 7000 3150
Wire Wire Line
	7100 3250 7000 3250
Wire Wire Line
	7100 3350 7000 3350
Wire Wire Line
	7100 3550 7000 3550
Text Label 2150 2600 2    50   ~ 0
F+3.3V
Wire Wire Line
	2150 2600 2250 2600
Text Label 7100 3550 0    50   ~ 0
F+3.3V
Wire Wire Line
	6400 3350 6500 3350
Text Label 7100 3150 0    50   ~ 0
GPIO0
Text Label 6400 3150 2    50   ~ 0
GPIO25
Text GLabel 3000 2900 0    50   Input ~ 0
GPIO39
Wire Notes Line
	8050 1800 8050 5000
Wire Notes Line
	8050 5000 10100 5000
Wire Notes Line
	10100 5000 10100 1800
Wire Notes Line
	10100 1800 8050 1800
Wire Notes Line
	7900 1800 7900 5000
Wire Notes Line
	7900 5000 5750 5000
Wire Notes Line
	5750 5000 5750 1800
Wire Notes Line
	5750 1800 7900 1800
Wire Notes Line
	5600 6200 1700 6200
Wire Notes Line
	1700 6200 1700 1800
Wire Notes Line
	5600 6200 5600 1800
Wire Notes Line
	5600 1800 1700 1800
Text Notes 1950 2050 0    118  ~ 0
MICROCONTROLER
Text Notes 8250 2050 0    118  ~ 0
R-PI CONECTOR 
Text Notes 6000 2050 0    118  ~ 0
PINES GPIO 
$Comp
L EESTN5:LOGO_ROTULO #G1
U 1 1 6105039F
P 10850 6850
F 0 "#G1" H 10850 6628 60  0001 C CNN
F 1 "LOGO_ROTULO" H 10850 7072 60  0001 C CNN
F 2 "" H 10850 6850 60  0001 C CNN
F 3 "" H 10850 6850 60  0001 C CNN
	1    10850 6850
	1    0    0    -1  
$EndComp
Text GLabel 3850 5100 2    50   Input ~ 0
AIN1
Text GLabel 3850 5600 2    50   Input ~ 0
AIN2
Text GLabel 3850 5350 2    50   Input ~ 0
BIN1
Text GLabel 3850 4850 2    50   Input ~ 0
BIN2
$Comp
L EESTN5:R R26
U 1 1 61313539
P 3550 4850
F 0 "R26" V 3365 4850 50  0000 C CNN
F 1 "R" V 3456 4850 50  0000 C CNN
F 2 "EESTN5:R_0805" H 3550 4850 60  0001 C CNN
F 3 "" H 3550 4850 60  0000 C CNN
	1    3550 4850
	0    1    1    0   
$EndComp
$Comp
L EESTN5:R R27
U 1 1 61313917
P 3550 5100
F 0 "R27" V 3365 5100 50  0000 C CNN
F 1 "R" V 3456 5100 50  0000 C CNN
F 2 "EESTN5:R_0805" H 3550 5100 60  0001 C CNN
F 3 "" H 3550 5100 60  0000 C CNN
	1    3550 5100
	0    1    1    0   
$EndComp
$Comp
L EESTN5:R R28
U 1 1 61313A99
P 3550 5350
F 0 "R28" V 3365 5350 50  0000 C CNN
F 1 "R" V 3456 5350 50  0000 C CNN
F 2 "EESTN5:R_0805" H 3550 5350 60  0001 C CNN
F 3 "" H 3550 5350 60  0000 C CNN
	1    3550 5350
	0    1    1    0   
$EndComp
$Comp
L EESTN5:R R29
U 1 1 61313D18
P 3550 5600
F 0 "R29" V 3365 5600 50  0000 C CNN
F 1 "R" V 3456 5600 50  0000 C CNN
F 2 "EESTN5:R_0805" H 3550 5600 60  0001 C CNN
F 3 "" H 3550 5600 60  0000 C CNN
	1    3550 5600
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR031
U 1 1 6132838D
P 3250 5800
F 0 "#PWR031" H 3250 5550 50  0001 C CNN
F 1 "GND" H 3255 5627 50  0000 C CNN
F 2 "" H 3250 5800 50  0001 C CNN
F 3 "" H 3250 5800 50  0001 C CNN
	1    3250 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 5800 3250 5600
Wire Wire Line
	3250 5600 3450 5600
Wire Wire Line
	3450 5350 3250 5350
Wire Wire Line
	3250 5350 3250 5600
Connection ~ 3250 5600
Wire Wire Line
	3650 5600 3850 5600
Wire Wire Line
	3650 5350 3850 5350
Wire Wire Line
	3650 5100 3850 5100
Wire Wire Line
	3650 4850 3850 4850
Wire Wire Line
	3450 4850 3250 4850
Wire Wire Line
	3250 4850 3250 5100
Connection ~ 3250 5350
Wire Wire Line
	3450 5100 3250 5100
Connection ~ 3250 5100
Wire Wire Line
	3250 5100 3250 5350
Text Label 4500 4100 0    50   ~ 0
CS
$Comp
L MacroLib:FUSE F1
U 1 1 60E10EEE
P 2550 2600
F 0 "F1" H 2550 2825 50  0000 C CNN
F 1 "FUSE 0,5A" H 2550 2734 50  0000 C CNN
F 2 "EESTN5:R_1206" H 2550 2700 50  0001 C CNN
F 3 "" H 2550 2700 50  0001 C CNN
	1    2550 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 2600 3000 2600
$Comp
L power:+3.3V #PWR0101
U 1 1 61468625
P 3000 2450
F 0 "#PWR0101" H 3000 2300 50  0001 C CNN
F 1 "+3.3V" H 3015 2623 50  0000 C CNN
F 2 "" H 3000 2450 50  0001 C CNN
F 3 "" H 3000 2450 50  0001 C CNN
	1    3000 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 2450 3000 2600
Connection ~ 3000 2600
Wire Wire Line
	3000 2600 3100 2600
Wire Wire Line
	4500 2700 4400 2700
Text Label 4500 3300 0    50   ~ 0
GPIO19
Wire Wire Line
	6400 3450 6500 3450
Text Label 4500 3400 0    50   ~ 0
GPIO18
Wire Wire Line
	4500 3400 4400 3400
Wire Wire Line
	3000 2900 3100 2900
Text Label 2650 3000 2    50   ~ 0
GPIO34
$Comp
L MacroLib:CONN_02x6 P2
U 1 1 61691005
P 6750 3400
F 0 "P2" H 6750 3875 50  0000 C CNN
F 1 "CONN_02x6" H 6750 3784 50  0000 C CNN
F 2 "MacroLib:Pin_strip_2x6" H 6750 3800 50  0001 C CNN
F 3 "" H 6750 3800 50  0001 C CNN
	1    6750 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 3650 6400 3850
Wire Wire Line
	6400 3650 6500 3650
$Comp
L power:GND #PWR06
U 1 1 60E92CD9
P 6400 3850
F 0 "#PWR06" H 6400 3600 50  0001 C CNN
F 1 "GND" H 6405 3677 50  0000 C CNN
F 2 "" H 6400 3850 50  0001 C CNN
F 3 "" H 6400 3850 50  0001 C CNN
	1    6400 3850
	-1   0    0    -1  
$EndComp
Text Label 6400 3550 2    50   ~ 0
GPIO34
Wire Wire Line
	6400 3550 6500 3550
Text Label 7100 3350 0    50   ~ 0
GPIO18
Text Label 7100 3450 0    50   ~ 0
GPIO19
Wire Wire Line
	7100 3450 7000 3450
$EndSCHEMATC
