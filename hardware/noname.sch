EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MacroLib:XL4005 U?
U 1 1 60D93143
P 4050 3450
F 0 "U?" H 4494 3496 50  0000 L CNN
F 1 "XL4005" H 4494 3405 50  0000 L CNN
F 2 "" H 4050 3450 50  0001 C CNN
F 3 "" H 4050 3450 50  0001 C CNN
	1    4050 3450
	1    0    0    -1  
$EndComp
$Comp
L MacroLib:H J??
U 1 1 60D93B16
P 5150 3450
F 0 "J??" H 5150 3715 50  0000 C CNN
F 1 "H" H 5150 3624 50  0000 C CNN
F 2 "" H 5100 3450 50  0001 C CNN
F 3 "" H 5100 3450 50  0001 C CNN
	1    5150 3450
	1    0    0    -1  
$EndComp
$Comp
L EESTN5:C C?
U 1 1 60D9441C
P 3100 3850
F 0 "C?" H 3215 3888 40  0000 L CNN
F 1 "C" H 3215 3812 40  0000 L CNN
F 2 "" H 3138 3700 30  0000 C CNN
F 3 "" H 3100 3850 60  0000 C CNN
	1    3100 3850
	1    0    0    -1  
$EndComp
$Comp
L EESTN5:SW_SPDT SW?
U 1 1 60D9482B
P 3650 3800
F 0 "SW?" H 3650 3567 50  0000 C CNN
F 1 "SW_SPDT" H 3650 3600 50  0001 C CNN
F 2 "" H 3650 3800 50  0000 C CNN
F 3 "" H 3650 3800 50  0000 C CNN
	1    3650 3800
	-1   0    0    1   
$EndComp
$Comp
L EESTN5:R R?
U 1 1 60D94BF9
P 4500 2900
F 0 "R?" H 4548 2946 50  0000 L CNN
F 1 "R" H 4548 2855 50  0000 L CNN
F 2 "" H 4500 2900 60  0000 C CNN
F 3 "" H 4500 2900 60  0000 C CNN
	1    4500 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 3800 3950 3800
Wire Wire Line
	3950 3800 3950 3700
Wire Wire Line
	3450 3700 3350 3700
Wire Wire Line
	3350 3700 3350 3450
Wire Wire Line
	3350 3450 3650 3450
$Comp
L EESTN5:C C?
U 1 1 60D97B07
P 2750 3850
F 0 "C?" H 2865 3888 40  0000 L CNN
F 1 "C" H 2865 3812 40  0000 L CNN
F 2 "" H 2788 3700 30  0000 C CNN
F 3 "" H 2750 3850 60  0000 C CNN
	1    2750 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 3650 2750 3450
Wire Wire Line
	2750 3450 3100 3450
Connection ~ 3350 3450
Wire Wire Line
	3100 3650 3100 3450
Connection ~ 3100 3450
Wire Wire Line
	3100 3450 3350 3450
Wire Wire Line
	3100 4050 3100 4200
Wire Wire Line
	2750 4050 2750 4200
Wire Wire Line
	2750 4200 3100 4200
Wire Wire Line
	4150 3700 4150 4200
Connection ~ 3100 4200
Wire Wire Line
	3100 4200 3350 4200
Wire Wire Line
	3450 3900 3350 3900
Wire Wire Line
	3350 3900 3350 4200
Connection ~ 3350 4200
Wire Wire Line
	3350 4200 4150 4200
$EndSCHEMATC
