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
L MCU_Module:Arduino_Nano_v3.x A1
U 1 1 610425E2
P 4150 3050
F 0 "A1" H 4150 1961 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 4150 1870 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 4150 3050 50  0001 C CIN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 4150 3050 50  0001 C CNN
	1    4150 3050
	1    0    0    -1  
$EndComp
Text Notes 1750 1400 0    50   ~ 0
The quiescent current of a nano is 19 mA, and each I/O pin can put out up to 40 mA.  \nUSB 2.0 can source up to 500 mA.\nSo, to be safe, I'll assume that the Arduino could take up to 200 mA, which leaves 300 mA to charge the capacitors.\nThat means that V = IR -> R = V/I = 5/(0.3) = 17 ohms.\nWe have a bunch of 51 ohm resistors.  Three in parallel gives us 17 ohms.\nThe diode needs to take the whole 500 mA.
$Comp
L Device:D D1
U 1 1 61045C0C
P 2050 1800
F 0 "D1" H 2050 1583 50  0000 C CNN
F 1 "1N4937RLG" H 2050 1674 50  0000 C CNN
F 2 "" H 2050 1800 50  0001 C CNN
F 3 "~" H 2050 1800 50  0001 C CNN
	1    2050 1800
	-1   0    0    1   
$EndComp
$Comp
L Device:R_US Rcharge1
U 1 1 61047040
P 5600 3000
F 0 "Rcharge1" H 5668 3046 50  0000 L CNN
F 1 "10 ohm  1 W" H 5668 2955 50  0000 L CNN
F 2 "" V 5640 2990 50  0001 C CNN
F 3 "~" H 5600 3000 50  0001 C CNN
	1    5600 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C1
U 1 1 61048CF1
P 5600 2350
F 0 "C1" H 5715 2396 50  0000 L CNN
F 1 "3.3 F" H 5715 2305 50  0000 L CNN
F 2 "" H 5600 2350 50  0001 C CNN
F 3 "~" H 5600 2350 50  0001 C CNN
	1    5600 2350
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C2
U 1 1 6104949A
P 5600 3700
F 0 "C2" H 5715 3746 50  0000 L CNN
F 1 "3.3 F" H 5715 3655 50  0000 L CNN
F 2 "" H 5600 3700 50  0001 C CNN
F 3 "~" H 5600 3700 50  0001 C CNN
	1    5600 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 3850 5600 4050
Wire Wire Line
	5600 4050 5000 4050
$Comp
L Regulator_Linear:LM7805_TO220 U1
U 1 1 610862EF
P 2700 1800
F 0 "U1" H 2700 2042 50  0000 C CNN
F 1 "LM7805_TO220" H 2700 1951 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 2700 2025 50  0001 C CIN
F 3 "http://www.fairchildsemi.com/ds/LM/LM7805.pdf" H 2700 1750 50  0001 C CNN
	1    2700 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 1800 2400 1800
$Comp
L power:GNDREF #PWR0101
U 1 1 6108B2E9
P 5000 4050
F 0 "#PWR0101" H 5000 3800 50  0001 C CNN
F 1 "GNDREF" H 5005 3877 50  0001 C CNN
F 2 "" H 5000 4050 50  0001 C CNN
F 3 "" H 5000 4050 50  0001 C CNN
	1    5000 4050
	1    0    0    -1  
$EndComp
Connection ~ 5000 4050
Wire Wire Line
	5000 4050 4250 4050
$Comp
L power:GNDREF #PWR0102
U 1 1 6108B96C
P 2700 2100
F 0 "#PWR0102" H 2700 1850 50  0001 C CNN
F 1 "GNDREF" H 2705 1927 50  0001 C CNN
F 2 "" H 2700 2100 50  0001 C CNN
F 3 "" H 2700 2100 50  0001 C CNN
	1    2700 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 1800 4050 1800
$Comp
L power:+24V #PWR0103
U 1 1 6108C435
P 1550 1800
F 0 "#PWR0103" H 1550 1650 50  0001 C CNN
F 1 "+24V" H 1565 1973 50  0000 C CNN
F 2 "" H 1550 1800 50  0001 C CNN
F 3 "" H 1550 1800 50  0001 C CNN
	1    1550 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 1800 1900 1800
$Comp
L Device:LED Dgreen1
U 1 1 6108D27A
P 1400 2350
F 0 "Dgreen1" H 1393 2567 50  0001 C CNN
F 1 "GreenLED" H 1393 2475 50  0000 C CNN
F 2 "" H 1400 2350 50  0001 C CNN
F 3 "~" H 1400 2350 50  0001 C CNN
	1    1400 2350
	1    0    0    -1  
$EndComp
$Comp
L Device:LED Dred1
U 1 1 6108DFEE
P 1400 2650
F 0 "Dred1" H 1393 2867 50  0001 C CNN
F 1 "Red LED" H 1393 2775 50  0000 C CNN
F 2 "" H 1400 2650 50  0001 C CNN
F 3 "~" H 1400 2650 50  0001 C CNN
	1    1400 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 2350 1550 2350
Wire Wire Line
	1250 2350 900  2350
Wire Wire Line
	900  2350 900  2650
Wire Wire Line
	900  2650 1250 2650
$Comp
L power:GNDREF #PWR0104
U 1 1 6108F831
P 900 2650
F 0 "#PWR0104" H 900 2400 50  0001 C CNN
F 1 "GNDREF" H 905 2477 50  0001 C CNN
F 2 "" H 900 2650 50  0001 C CNN
F 3 "" H 900 2650 50  0001 C CNN
	1    900  2650
	1    0    0    -1  
$EndComp
Connection ~ 900  2650
$Comp
L Device:R_US Rgreen1
U 1 1 6109CF30
P 2000 2350
F 0 "Rgreen1" V 1795 2350 50  0000 C CNN
F 1 "200" V 1886 2350 50  0000 C CNN
F 2 "" V 2040 2340 50  0001 C CNN
F 3 "~" H 2000 2350 50  0001 C CNN
	1    2000 2350
	0    1    1    0   
$EndComp
$Comp
L Device:R_US Rred1
U 1 1 6109DFF4
P 2000 2650
F 0 "Rred1" V 1795 2650 50  0000 C CNN
F 1 "200" V 1886 2650 50  0000 C CNN
F 2 "" V 2040 2640 50  0001 C CNN
F 3 "~" H 2000 2650 50  0001 C CNN
	1    2000 2650
	0    1    1    0   
$EndComp
Wire Wire Line
	1550 2650 1850 2650
Wire Wire Line
	3550 2650 3650 2650
Text GLabel 2350 2850 0    50   Input ~ 0
Empty
Wire Wire Line
	2150 2350 3550 2350
Wire Wire Line
	3550 2350 3550 2650
Wire Wire Line
	3650 2750 3450 2750
Wire Wire Line
	3450 2750 3450 2650
Wire Wire Line
	2150 2650 3450 2650
Wire Wire Line
	2350 2850 3650 2850
$Comp
L MCU_Module:Arduino_Nano_v3.x A2
U 1 1 610EF6E0
P 4100 5750
F 0 "A2" H 4100 4661 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 4100 4570 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 4100 5750 50  0001 C CIN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 4100 5750 50  0001 C CNN
	1    4100 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 4600 4000 4750
$Comp
L power:GNDREF #PWR0109
U 1 1 610EF6F2
P 4200 6750
F 0 "#PWR0109" H 4200 6500 50  0001 C CNN
F 1 "GNDREF" H 4205 6577 50  0001 C CNN
F 2 "" H 4200 6750 50  0001 C CNN
F 3 "" H 4200 6750 50  0001 C CNN
	1    4200 6750
	1    0    0    -1  
$EndComp
Text GLabel 2400 6050 0    50   Input ~ 0
DVI_pins_1-8
Text GLabel 2500 6150 0    50   Input ~ 0
DVI_pins_17-24
Text GLabel 2300 6250 0    50   Input ~ 0
DVI_pin_16
Text GLabel 2300 5650 0    50   Input ~ 0
DVI_pin_C1
Text GLabel 2300 5550 0    50   Input ~ 0
DVI_pin_C2
Text GLabel 2300 5850 0    50   Input ~ 0
DVI_pin_C3
Text GLabel 2300 5750 0    50   Input ~ 0
DVI_pin_C4
Text GLabel 2300 5950 0    50   Input ~ 0
DVI_pin_C5
Wire Wire Line
	2300 5550 3600 5550
Wire Wire Line
	2300 5650 3600 5650
Wire Wire Line
	2300 5750 3600 5750
Wire Wire Line
	2300 5850 3600 5850
Wire Wire Line
	2400 6050 2550 6050
Wire Wire Line
	2550 6050 2550 5950
Wire Wire Line
	2550 5950 2300 5950
$Comp
L power:GNDREF #PWR0111
U 1 1 610EF739
P 2700 5950
F 0 "#PWR0111" H 2700 5700 50  0001 C CNN
F 1 "GNDREF" H 2705 5777 50  0001 C CNN
F 2 "" H 2700 5950 50  0001 C CNN
F 3 "" H 2700 5950 50  0001 C CNN
	1    2700 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 5950 2700 5950
Connection ~ 2550 5950
$Comp
L power:+24V #PWR0112
U 1 1 610EF741
P 2950 6100
F 0 "#PWR0112" H 2950 5950 50  0001 C CNN
F 1 "+24V" H 2965 6273 50  0000 C CNN
F 2 "" H 2950 6100 50  0001 C CNN
F 3 "" H 2950 6100 50  0001 C CNN
	1    2950 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 6150 2950 6150
Wire Wire Line
	2950 6150 2950 6100
Wire Wire Line
	2300 6250 2550 6250
Wire Wire Line
	2550 6250 2550 6350
Wire Wire Line
	2550 6350 3600 6350
Text GLabel 2400 7050 0    50   Input ~ 0
DVI_pins_1-8
Text GLabel 2500 7150 0    50   Input ~ 0
DVI_pins_17-24
Text GLabel 2300 7250 0    50   Input ~ 0
DVI_pin_16
Text GLabel 2300 6650 0    50   Input ~ 0
DVI_pin_C1
Text GLabel 2300 6550 0    50   Input ~ 0
DVI_pin_C2
Text GLabel 2300 6850 0    50   Input ~ 0
DVI_pin_C3
Text GLabel 2300 6750 0    50   Input ~ 0
DVI_pin_C4
Text GLabel 2300 6950 0    50   Input ~ 0
DVI_pin_C5
Wire Wire Line
	2300 6550 3200 6550
Wire Wire Line
	2300 6650 3300 6650
Wire Wire Line
	2300 6750 3400 6750
Wire Wire Line
	2300 6850 3500 6850
Wire Wire Line
	2400 7050 2550 7050
Wire Wire Line
	2550 7050 2550 6950
Wire Wire Line
	2550 6950 2300 6950
$Comp
L power:GNDREF #PWR0113
U 1 1 610EF75B
P 2700 6950
F 0 "#PWR0113" H 2700 6700 50  0001 C CNN
F 1 "GNDREF" H 2705 6777 50  0001 C CNN
F 2 "" H 2700 6950 50  0001 C CNN
F 3 "" H 2700 6950 50  0001 C CNN
	1    2700 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 6950 2700 6950
Connection ~ 2550 6950
$Comp
L power:+24V #PWR0114
U 1 1 610EF763
P 2950 7100
F 0 "#PWR0114" H 2950 6950 50  0001 C CNN
F 1 "+24V" H 2965 7273 50  0000 C CNN
F 2 "" H 2950 7100 50  0001 C CNN
F 3 "" H 2950 7100 50  0001 C CNN
	1    2950 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 7150 2950 7150
Wire Wire Line
	2950 7150 2950 7100
Connection ~ 2950 6100
Wire Wire Line
	2950 6100 2950 6050
Connection ~ 2950 7100
Wire Wire Line
	2950 7100 2950 7050
Wire Wire Line
	3600 5950 3200 5950
Wire Wire Line
	3200 5950 3200 6550
Wire Wire Line
	3600 6050 3300 6050
Wire Wire Line
	3300 6650 3300 6050
Wire Wire Line
	3600 6150 3400 6150
Wire Wire Line
	3400 6150 3400 6750
Wire Wire Line
	3600 6250 3500 6250
Wire Wire Line
	3500 6250 3500 6850
Wire Wire Line
	3600 6450 3600 7250
Wire Wire Line
	2300 7250 3600 7250
Wire Wire Line
	4000 4600 6200 4600
Connection ~ 4050 1800
Wire Wire Line
	4050 1800 4050 2050
Wire Wire Line
	4050 1800 5600 1800
Wire Wire Line
	6200 1800 6200 4600
Wire Wire Line
	5600 1800 5600 2200
Connection ~ 5600 1800
Wire Wire Line
	5600 1800 6200 1800
Wire Wire Line
	4600 6150 7000 6150
Wire Wire Line
	4600 6250 6750 6250
Wire Wire Line
	6750 6250 6750 4900
Wire Wire Line
	6750 4550 7000 4550
Wire Wire Line
	7000 6150 7000 4750
$Comp
L Connector_Generic:Conn_02x06_Counter_Clockwise JLevelConv1
U 1 1 6118565C
P 7300 4450
F 0 "JLevelConv1" H 7350 4867 50  0001 C CNN
F 1 "I2C Level Converter" H 7350 4017 50  0000 C CNN
F 2 "" H 7300 4450 50  0001 C CNN
F 3 "~" H 7300 4450 50  0001 C CNN
	1    7300 4450
	-1   0    0    1   
$EndComp
Wire Wire Line
	4650 3450 5200 3450
Wire Wire Line
	5200 3450 5200 4750
Wire Wire Line
	5200 4750 7000 4750
Connection ~ 7000 4750
Wire Wire Line
	7000 4750 7000 4650
Wire Wire Line
	4650 3550 5100 3550
Wire Wire Line
	5100 3550 5100 4900
Wire Wire Line
	5100 4900 6750 4900
Connection ~ 6750 4900
Wire Wire Line
	6750 4900 6750 4550
Wire Wire Line
	7000 4450 6750 4450
Wire Wire Line
	6750 4450 6750 1800
Wire Wire Line
	6750 1800 6200 1800
Connection ~ 6200 1800
$Comp
L power:GNDREF #PWR?
U 1 1 611BBE0E
P 7300 3550
F 0 "#PWR?" H 7300 3300 50  0001 C CNN
F 1 "GNDREF" H 7305 3377 50  0001 C CNN
F 2 "" H 7300 3550 50  0001 C CNN
F 3 "" H 7300 3550 50  0001 C CNN
	1    7300 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 4350 6900 4350
Wire Wire Line
	6900 4350 6900 3550
Wire Wire Line
	6900 3550 7300 3550
$Comp
L Connector:Conn_01x01_Male Jpi3
U 1 1 611C254A
P 7700 4650
F 0 "Jpi3" H 7672 4582 50  0001 R CNN
F 1 "Rpi 3 (SDA0)" H 7672 4628 50  0000 R CNN
F 2 "" H 7700 4650 50  0001 C CNN
F 3 "~" H 7700 4650 50  0001 C CNN
	1    7700 4650
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x01_Male Jpi?
U 1 1 611CDAE1
P 7700 4550
F 0 "Jpi?" H 7672 4482 50  0001 R CNN
F 1 "Rpi 5 (SDL0)" H 7672 4528 50  0000 R CNN
F 2 "" H 7700 4550 50  0001 C CNN
F 3 "~" H 7700 4550 50  0001 C CNN
	1    7700 4550
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x01_Male Jpi?
U 1 1 611CDC22
P 7700 4450
F 0 "Jpi?" H 7672 4382 50  0001 R CNN
F 1 "Rpi 1 (3.3V)" H 7672 4428 50  0000 R CNN
F 2 "" H 7700 4450 50  0001 C CNN
F 3 "~" H 7700 4450 50  0001 C CNN
	1    7700 4450
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x01_Male Jpi?
U 1 1 611CDDF1
P 7700 4350
F 0 "Jpi?" H 7672 4282 50  0001 R CNN
F 1 "Rpi 6 (0V)" H 7672 4328 50  0000 R CNN
F 2 "" H 7700 4350 50  0001 C CNN
F 3 "~" H 7700 4350 50  0001 C CNN
	1    7700 4350
	-1   0    0    1   
$EndComp
Text Label 3750 1650 0    50   ~ 0
Power_And_Interface
$Comp
L Switch:SW_Push SW6
U 1 1 611BEABC
P 8400 1900
F 0 "SW6" H 8400 2093 50  0000 C CNN
F 1 "SW_Push" H 8400 2094 50  0001 C CNN
F 2 "" H 8400 2100 50  0001 C CNN
F 3 "~" H 8400 2100 50  0001 C CNN
	1    8400 1900
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW5
U 1 1 611C1D61
P 8400 2200
F 0 "SW5" H 8400 2393 50  0000 C CNN
F 1 "SW_Push" H 8400 2394 50  0001 C CNN
F 2 "" H 8400 2400 50  0001 C CNN
F 3 "~" H 8400 2400 50  0001 C CNN
	1    8400 2200
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW4
U 1 1 611C2123
P 8400 2500
F 0 "SW4" H 8400 2693 50  0000 C CNN
F 1 "SW_Push" H 8400 2694 50  0001 C CNN
F 2 "" H 8400 2700 50  0001 C CNN
F 3 "~" H 8400 2700 50  0001 C CNN
	1    8400 2500
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW3
U 1 1 611C24FE
P 8400 2800
F 0 "SW3" H 8400 2993 50  0000 C CNN
F 1 "SW_Push" H 8400 2994 50  0001 C CNN
F 2 "" H 8400 3000 50  0001 C CNN
F 3 "~" H 8400 3000 50  0001 C CNN
	1    8400 2800
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW2
U 1 1 611C8228
P 8400 3100
F 0 "SW2" H 8400 3293 50  0000 C CNN
F 1 "SW_Push" H 8400 3294 50  0001 C CNN
F 2 "" H 8400 3300 50  0001 C CNN
F 3 "~" H 8400 3300 50  0001 C CNN
	1    8400 3100
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW1
U 1 1 611C85B1
P 8400 3400
F 0 "SW1" H 8400 3593 50  0000 C CNN
F 1 "SW_Push" H 8400 3594 50  0001 C CNN
F 2 "" H 8400 3600 50  0001 C CNN
F 3 "~" H 8400 3600 50  0001 C CNN
	1    8400 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US Rsw1
U 1 1 611C88EA
P 9150 2050
F 0 "Rsw1" H 9218 2096 50  0000 L CNN
F 1 "10k" H 9218 2005 50  0000 L CNN
F 2 "" V 9190 2040 50  0001 C CNN
F 3 "~" H 9150 2050 50  0001 C CNN
	1    9150 2050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 611C9691
P 6750 1800
F 0 "#PWR?" H 6750 1650 50  0001 C CNN
F 1 "+5V" H 6765 1973 50  0000 C CNN
F 2 "" H 6750 1800 50  0001 C CNN
F 3 "" H 6750 1800 50  0001 C CNN
	1    6750 1800
	1    0    0    -1  
$EndComp
Connection ~ 6750 1800
$Comp
L power:+5V #PWR?
U 1 1 611CA02F
P 9150 1900
F 0 "#PWR?" H 9150 1750 50  0001 C CNN
F 1 "+5V" H 9165 2073 50  0000 C CNN
F 2 "" H 9150 1900 50  0001 C CNN
F 3 "" H 9150 1900 50  0001 C CNN
	1    9150 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 2200 8600 2200
$Comp
L Device:R_US Rsw2
U 1 1 611D87A6
P 9150 2350
F 0 "Rsw2" H 9218 2396 50  0000 L CNN
F 1 "10k" H 9218 2305 50  0000 L CNN
F 2 "" V 9190 2340 50  0001 C CNN
F 3 "~" H 9150 2350 50  0001 C CNN
	1    9150 2350
	1    0    0    -1  
$EndComp
Connection ~ 9150 2200
$Comp
L Device:R_US Rsw3
U 1 1 611D8B24
P 9150 2650
F 0 "Rsw3" H 9218 2696 50  0000 L CNN
F 1 "10k" H 9218 2605 50  0000 L CNN
F 2 "" V 9190 2640 50  0001 C CNN
F 3 "~" H 9150 2650 50  0001 C CNN
	1    9150 2650
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US Rsw4
U 1 1 611D8DF9
P 9150 2950
F 0 "Rsw4" H 9218 2996 50  0000 L CNN
F 1 "10k" H 9218 2905 50  0000 L CNN
F 2 "" V 9190 2940 50  0001 C CNN
F 3 "~" H 9150 2950 50  0001 C CNN
	1    9150 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US Rsw5
U 1 1 611D912E
P 9150 3250
F 0 "Rsw5" H 9218 3296 50  0000 L CNN
F 1 "10k" H 9218 3205 50  0000 L CNN
F 2 "" V 9190 3240 50  0001 C CNN
F 3 "~" H 9150 3250 50  0001 C CNN
	1    9150 3250
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US Rsw6
U 1 1 611D9599
P 9150 3550
F 0 "Rsw6" H 9218 3596 50  0000 L CNN
F 1 "10k" H 9218 3505 50  0000 L CNN
F 2 "" V 9190 3540 50  0001 C CNN
F 3 "~" H 9150 3550 50  0001 C CNN
	1    9150 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 2500 8600 2500
Connection ~ 9150 2500
Wire Wire Line
	9150 2800 8600 2800
Connection ~ 9150 2800
Wire Wire Line
	9150 1900 8600 1900
Connection ~ 9150 1900
Wire Wire Line
	8600 3100 9150 3100
Connection ~ 9150 3100
Wire Wire Line
	9150 3400 8600 3400
Connection ~ 9150 3400
Wire Wire Line
	8200 1900 8200 2200
Wire Wire Line
	8200 2500 8200 2200
Connection ~ 8200 2200
Wire Wire Line
	8200 2500 8200 2800
Connection ~ 8200 2500
Wire Wire Line
	8200 2800 8200 3100
Connection ~ 8200 2800
Wire Wire Line
	8200 3100 8200 3250
Connection ~ 8200 3100
$Comp
L power:+24V #PWR?
U 1 1 61236CB4
P 7400 1450
F 0 "#PWR?" H 7400 1300 50  0001 C CNN
F 1 "+24V" H 7415 1623 50  0000 C CNN
F 2 "" H 7400 1450 50  0001 C CNN
F 3 "" H 7400 1450 50  0001 C CNN
	1    7400 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US Rmeas1
U 1 1 6123C4B9
P 7400 1600
F 0 "Rmeas1" H 7468 1646 50  0000 L CNN
F 1 "10k" H 7468 1555 50  0000 L CNN
F 2 "" V 7440 1590 50  0001 C CNN
F 3 "~" H 7400 1600 50  0001 C CNN
	1    7400 1600
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US Rmeas2
U 1 1 61243123
P 7400 1900
F 0 "Rmeas2" H 7468 1946 50  0000 L CNN
F 1 "1k" H 7468 1855 50  0000 L CNN
F 2 "" V 7440 1890 50  0001 C CNN
F 3 "~" H 7400 1900 50  0001 C CNN
	1    7400 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 2000 7100 1750
Wire Wire Line
	7100 1750 7400 1750
Connection ~ 7400 1750
$Comp
L power:GNDREF #PWR?
U 1 1 612494DA
P 7400 2050
F 0 "#PWR?" H 7400 1800 50  0001 C CNN
F 1 "GNDREF" H 7405 1877 50  0001 C CNN
F 2 "" H 7400 2050 50  0001 C CNN
F 3 "" H 7400 2050 50  0001 C CNN
	1    7400 2050
	1    0    0    -1  
$EndComp
$Comp
L Device:Rotary_Encoder EncA
U 1 1 61249DC8
P 10750 1000
F 0 "EncA" H 10980 1000 50  0000 L CNN
F 1 "Rotary_Encoder" H 10980 955 50  0001 L CNN
F 2 "" H 10600 1160 50  0001 C CNN
F 3 "~" H 10750 1260 50  0001 C CNN
	1    10750 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 3350 4850 3350
Wire Wire Line
	4850 3350 4850 2000
Wire Wire Line
	4850 2000 7100 2000
Connection ~ 8200 3250
Wire Wire Line
	8200 3250 8200 3400
Text Label 7050 3200 0    50   ~ 0
1023,682,512,409,341,292
Connection ~ 7900 3250
Wire Wire Line
	7900 3250 8200 3250
$Comp
L power:GNDREF #PWR?
U 1 1 611D9E69
P 9150 3700
F 0 "#PWR?" H 9150 3450 50  0001 C CNN
F 1 "GNDREF" H 9155 3527 50  0001 C CNN
F 2 "" H 9150 3700 50  0001 C CNN
F 3 "" H 9150 3700 50  0001 C CNN
	1    9150 3700
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 6125E6F0
P 7900 3550
F 0 "#PWR?" H 7900 3300 50  0001 C CNN
F 1 "GNDREF" H 7905 3377 50  0001 C CNN
F 2 "" H 7900 3550 50  0001 C CNN
F 3 "" H 7900 3550 50  0001 C CNN
	1    7900 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US Rsw7
U 1 1 6125E063
P 7900 3400
F 0 "Rsw7" H 7968 3446 50  0000 L CNN
F 1 "20k" H 7968 3355 50  0000 L CNN
F 2 "" V 7940 3390 50  0001 C CNN
F 3 "~" H 7900 3400 50  0001 C CNN
	1    7900 3400
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 612C1DD9
P 9750 1150
F 0 "#PWR?" H 9750 900 50  0001 C CNN
F 1 "GNDREF" H 9755 977 50  0001 C CNN
F 2 "" H 9750 1150 50  0001 C CNN
F 3 "" H 9750 1150 50  0001 C CNN
	1    9750 1150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 612C36BE
P 9750 850
F 0 "#PWR?" H 9750 700 50  0001 C CNN
F 1 "+5V" H 9765 1023 50  0000 C CNN
F 2 "" H 9750 850 50  0001 C CNN
F 3 "" H 9750 850 50  0001 C CNN
	1    9750 850 
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US RencA1
U 1 1 612D87DB
P 10100 850
F 0 "RencA1" H 10168 896 50  0000 L CNN
F 1 "10k" H 10168 805 50  0000 L CNN
F 2 "" V 10140 840 50  0001 C CNN
F 3 "~" H 10100 850 50  0001 C CNN
	1    10100 850 
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9750 850  9950 850 
$Comp
L Device:R_US RencA2
U 1 1 612F747F
P 10100 1150
F 0 "RencA2" H 10168 1196 50  0000 L CNN
F 1 "10k" H 10168 1105 50  0000 L CNN
F 2 "" V 10140 1140 50  0001 C CNN
F 3 "~" H 10100 1150 50  0001 C CNN
	1    10100 1150
	0    1    1    0   
$EndComp
Wire Wire Line
	9950 1150 9750 1150
$Comp
L Device:R_US RencA3
U 1 1 61301E38
P 10250 1000
F 0 "RencA3" H 10318 1046 50  0000 L CNN
F 1 "10k" H 10318 955 50  0000 L CNN
F 2 "" V 10290 990 50  0001 C CNN
F 3 "~" H 10250 1000 50  0001 C CNN
	1    10250 1000
	-1   0    0    1   
$EndComp
Wire Wire Line
	10250 850  10450 850 
Wire Wire Line
	10450 850  10450 900 
Connection ~ 10250 850 
Wire Wire Line
	10450 1100 10250 1100
Wire Wire Line
	10250 1100 10250 1150
Connection ~ 10250 1150
$Comp
L Device:R_US RencA4
U 1 1 61329AD0
P 10400 1750
F 0 "RencA4" H 10468 1796 50  0000 L CNN
F 1 "10k" H 10468 1705 50  0000 L CNN
F 2 "" V 10440 1740 50  0001 C CNN
F 3 "~" H 10400 1750 50  0001 C CNN
	1    10400 1750
	-1   0    0    1   
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 6132F9BE
P 10400 1900
F 0 "#PWR?" H 10400 1650 50  0001 C CNN
F 1 "GNDREF" H 10405 1727 50  0001 C CNN
F 2 "" H 10400 1900 50  0001 C CNN
F 3 "" H 10400 1900 50  0001 C CNN
	1    10400 1900
	1    0    0    -1  
$EndComp
Text Label 8600 4100 0    50   ~ 0
Encoder_Equivalent_Circuits
Text Label 8600 4300 0    50   ~ 0
None
$Comp
L Device:R_US RencEquiv1
U 1 1 61330C25
P 9200 4400
F 0 "RencEquiv1" H 9268 4446 50  0001 L CNN
F 1 "10k" H 9268 4355 50  0000 L CNN
F 2 "" V 9240 4390 50  0001 C CNN
F 3 "~" H 9200 4400 50  0001 C CNN
	1    9200 4400
	-1   0    0    1   
$EndComp
Wire Wire Line
	8950 4250 9200 4250
$Comp
L power:GNDREF #PWR?
U 1 1 613370D1
P 9200 4550
F 0 "#PWR?" H 9200 4300 50  0001 C CNN
F 1 "GNDREF" H 9205 4377 50  0001 C CNN
F 2 "" H 9200 4550 50  0001 C CNN
F 3 "" H 9200 4550 50  0001 C CNN
	1    9200 4550
	1    0    0    -1  
$EndComp
Text Label 9800 4300 0    50   ~ 0
A
$Comp
L Device:R_US RencEquiv?
U 1 1 61344062
P 10800 4400
F 0 "RencEquiv?" H 10868 4446 50  0001 L CNN
F 1 "10k" H 10868 4355 50  0000 L CNN
F 2 "" V 10840 4390 50  0001 C CNN
F 3 "~" H 10800 4400 50  0001 C CNN
	1    10800 4400
	-1   0    0    1   
$EndComp
$Comp
L Device:R_US RencEquiv?
U 1 1 613442AF
P 10800 4700
F 0 "RencEquiv?" H 10868 4746 50  0001 L CNN
F 1 "6.667k" H 10868 4655 50  0000 L CNN
F 2 "" V 10840 4690 50  0001 C CNN
F 3 "~" H 10800 4700 50  0001 C CNN
	1    10800 4700
	-1   0    0    1   
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 61344518
P 10800 4850
F 0 "#PWR?" H 10800 4600 50  0001 C CNN
F 1 "GNDREF" H 10805 4677 50  0001 C CNN
F 2 "" H 10800 4850 50  0001 C CNN
F 3 "" H 10800 4850 50  0001 C CNN
	1    10800 4850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6134A6DC
P 10800 4250
F 0 "#PWR?" H 10800 4100 50  0001 C CNN
F 1 "+5V" H 10815 4423 50  0000 C CNN
F 2 "" H 10800 4250 50  0001 C CNN
F 3 "" H 10800 4250 50  0001 C CNN
	1    10800 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	10800 4550 10100 4550
Connection ~ 10800 4550
Text Label 8600 4400 0    50   ~ 0
0V---0
Text Label 9800 4400 0    50   ~ 0
2V---409.2
Text Label 8300 5200 0    50   ~ 0
B
$Comp
L Device:R_US RencEquiv?
U 1 1 61358E84
P 9300 5300
F 0 "RencEquiv?" H 9368 5346 50  0001 L CNN
F 1 "20k" H 9368 5255 50  0000 L CNN
F 2 "" V 9340 5290 50  0001 C CNN
F 3 "~" H 9300 5300 50  0001 C CNN
	1    9300 5300
	-1   0    0    1   
$EndComp
$Comp
L Device:R_US RencEquiv?
U 1 1 61358E8A
P 9300 5600
F 0 "RencEquiv?" H 9368 5646 50  0001 L CNN
F 1 "5k" H 9368 5555 50  0000 L CNN
F 2 "" V 9340 5590 50  0001 C CNN
F 3 "~" H 9300 5600 50  0001 C CNN
	1    9300 5600
	-1   0    0    1   
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 61358E90
P 9300 5750
F 0 "#PWR?" H 9300 5500 50  0001 C CNN
F 1 "GNDREF" H 9305 5577 50  0001 C CNN
F 2 "" H 9300 5750 50  0001 C CNN
F 3 "" H 9300 5750 50  0001 C CNN
	1    9300 5750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61358E96
P 9300 5150
F 0 "#PWR?" H 9300 5000 50  0001 C CNN
F 1 "+5V" H 9315 5323 50  0000 C CNN
F 2 "" H 9300 5150 50  0001 C CNN
F 3 "" H 9300 5150 50  0001 C CNN
	1    9300 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 5450 8600 5450
Connection ~ 9300 5450
Text Label 8300 5300 0    50   ~ 0
1V---204.6
Text Label 9700 5400 0    50   ~ 0
AB
$Comp
L Device:R_US RencEquiv?
U 1 1 6137AABC
P 10700 5500
F 0 "RencEquiv?" H 10768 5546 50  0001 L CNN
F 1 "10k" H 10768 5455 50  0000 L CNN
F 2 "" V 10740 5490 50  0001 C CNN
F 3 "~" H 10700 5500 50  0001 C CNN
	1    10700 5500
	-1   0    0    1   
$EndComp
$Comp
L Device:R_US RencEquiv?
U 1 1 6137AAC2
P 10700 5800
F 0 "RencEquiv?" H 10768 5846 50  0001 L CNN
F 1 "5k" H 10768 5755 50  0000 L CNN
F 2 "" V 10740 5790 50  0001 C CNN
F 3 "~" H 10700 5800 50  0001 C CNN
	1    10700 5800
	-1   0    0    1   
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 6137AAC8
P 10700 5950
F 0 "#PWR?" H 10700 5700 50  0001 C CNN
F 1 "GNDREF" H 10705 5777 50  0001 C CNN
F 2 "" H 10700 5950 50  0001 C CNN
F 3 "" H 10700 5950 50  0001 C CNN
	1    10700 5950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6137AACE
P 10700 5350
F 0 "#PWR?" H 10700 5200 50  0001 C CNN
F 1 "+5V" H 10715 5523 50  0000 C CNN
F 2 "" H 10700 5350 50  0001 C CNN
F 3 "" H 10700 5350 50  0001 C CNN
	1    10700 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	10700 5650 10000 5650
Connection ~ 10700 5650
Text Label 9700 5500 0    50   ~ 0
1.6V---341.0
Wire Wire Line
	4650 3250 7900 3250
Wire Wire Line
	4650 3050 5250 3050
Wire Wire Line
	5250 3050 5250 2750
Wire Wire Line
	5250 2750 7950 2750
Wire Wire Line
	7950 2750 7950 1600
Wire Wire Line
	7950 1600 10400 1600
$Comp
L Device:Rotary_Encoder EncA?
U 1 1 61396C6A
P 10850 2700
F 0 "EncA?" H 11080 2700 50  0000 L CNN
F 1 "Rotary_Encoder" H 11080 2655 50  0001 L CNN
F 2 "" H 10700 2860 50  0001 C CNN
F 3 "~" H 10850 2960 50  0001 C CNN
	1    10850 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 61396C70
P 9850 2850
F 0 "#PWR?" H 9850 2600 50  0001 C CNN
F 1 "GNDREF" H 9855 2677 50  0001 C CNN
F 2 "" H 9850 2850 50  0001 C CNN
F 3 "" H 9850 2850 50  0001 C CNN
	1    9850 2850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61396C76
P 9850 2550
F 0 "#PWR?" H 9850 2400 50  0001 C CNN
F 1 "+5V" H 9865 2723 50  0000 C CNN
F 2 "" H 9850 2550 50  0001 C CNN
F 3 "" H 9850 2550 50  0001 C CNN
	1    9850 2550
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US RencA?
U 1 1 61396C7C
P 10200 2550
F 0 "RencA?" H 10268 2596 50  0000 L CNN
F 1 "10k" H 10268 2505 50  0000 L CNN
F 2 "" V 10240 2540 50  0001 C CNN
F 3 "~" H 10200 2550 50  0001 C CNN
	1    10200 2550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9850 2550 10050 2550
$Comp
L Device:R_US RencA?
U 1 1 61396C83
P 10200 2850
F 0 "RencA?" H 10268 2896 50  0000 L CNN
F 1 "10k" H 10268 2805 50  0000 L CNN
F 2 "" V 10240 2840 50  0001 C CNN
F 3 "~" H 10200 2850 50  0001 C CNN
	1    10200 2850
	0    1    1    0   
$EndComp
Wire Wire Line
	10050 2850 9850 2850
$Comp
L Device:R_US RencA?
U 1 1 61396C8A
P 10350 2700
F 0 "RencA?" H 10418 2746 50  0000 L CNN
F 1 "10k" H 10418 2655 50  0000 L CNN
F 2 "" V 10390 2690 50  0001 C CNN
F 3 "~" H 10350 2700 50  0001 C CNN
	1    10350 2700
	-1   0    0    1   
$EndComp
Wire Wire Line
	10350 2550 10550 2550
Wire Wire Line
	10550 2550 10550 2600
Connection ~ 10350 2550
Wire Wire Line
	10550 2800 10350 2800
Wire Wire Line
	10350 2800 10350 2850
Connection ~ 10350 2850
$Comp
L Device:R_US RencA?
U 1 1 61396C99
P 10500 3450
F 0 "RencA?" H 10568 3496 50  0000 L CNN
F 1 "10k" H 10568 3405 50  0000 L CNN
F 2 "" V 10540 3440 50  0001 C CNN
F 3 "~" H 10500 3450 50  0001 C CNN
	1    10500 3450
	-1   0    0    1   
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 61396CA0
P 10500 3600
F 0 "#PWR?" H 10500 3350 50  0001 C CNN
F 1 "GNDREF" H 10505 3427 50  0001 C CNN
F 2 "" H 10500 3600 50  0001 C CNN
F 3 "" H 10500 3600 50  0001 C CNN
	1    10500 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	10450 1000 10400 1000
Wire Wire Line
	10400 1000 10400 1600
Connection ~ 10400 1600
Wire Wire Line
	10550 2700 10500 2700
Wire Wire Line
	10500 2700 10500 3150
Wire Wire Line
	10500 3150 9550 3150
Wire Wire Line
	9550 3150 9550 1650
Wire Wire Line
	9550 1650 8000 1650
Wire Wire Line
	8000 1650 8000 2800
Wire Wire Line
	8000 2800 5300 2800
Wire Wire Line
	5300 2800 5300 3150
Wire Wire Line
	5300 3150 4650 3150
Connection ~ 10500 3150
Wire Wire Line
	10500 3150 10500 3300
Text Label 3700 4500 0    50   ~ 0
Stepper_Control
Wire Wire Line
	5600 2500 5600 2600
Wire Wire Line
	5600 3150 5600 3450
Wire Wire Line
	5450 3750 5450 3450
Wire Wire Line
	5450 3450 5600 3450
Wire Wire Line
	4650 3750 5450 3750
Connection ~ 5600 3450
Wire Wire Line
	5600 3450 5600 3550
Wire Wire Line
	4650 3650 5400 3650
Wire Wire Line
	5400 3650 5400 2600
Wire Wire Line
	5400 2600 5600 2600
Connection ~ 5600 2600
Wire Wire Line
	5600 2600 5600 2850
$Comp
L Device:LED_CRGB DRGB1
U 1 1 613DABF6
P 850 3250
F 0 "DRGB1" H 550 3450 50  0000 C CNN
F 1 "LED_CRGB" H 850 3656 50  0001 C CNN
F 2 "" H 850 3200 50  0001 C CNN
F 3 "~" H 850 3200 50  0001 C CNN
	1    850  3250
	-1   0    0    1   
$EndComp
Wire Wire Line
	1050 2950 3650 2950
Wire Wire Line
	2000 3350 2000 2800
Wire Wire Line
	2000 2800 500  2800
Wire Wire Line
	1950 3450 1950 2850
Wire Wire Line
	1950 2850 550  2850
Wire Wire Line
	550  3250 650  3250
Wire Wire Line
	550  2850 550  3250
Wire Wire Line
	500  3450 650  3450
Wire Wire Line
	500  2800 500  3450
Wire Wire Line
	1050 2950 1050 3250
Wire Wire Line
	1900 3550 1900 2900
$Comp
L Device:LED_CRGB DRGB2
U 1 1 61432B52
P 850 3900
F 0 "DRGB2" H 550 4100 50  0000 C CNN
F 1 "LED_CRGB" H 850 4306 50  0001 C CNN
F 2 "" H 850 3850 50  0001 C CNN
F 3 "~" H 850 3850 50  0001 C CNN
	1    850  3900
	-1   0    0    1   
$EndComp
$Comp
L Device:LED_CRGB DRGB3
U 1 1 61433B64
P 850 4550
F 0 "DRGB3" H 550 4750 50  0000 C CNN
F 1 "LED_CRGB" H 850 4956 50  0001 C CNN
F 2 "" H 850 4500 50  0001 C CNN
F 3 "~" H 850 4500 50  0001 C CNN
	1    850  4550
	-1   0    0    1   
$EndComp
$Comp
L Device:LED_CRGB DRGB4
U 1 1 61434729
P 850 5200
F 0 "DRGB4" H 550 5400 50  0000 C CNN
F 1 "LED_CRGB" H 850 5606 50  0001 C CNN
F 2 "" H 850 5150 50  0001 C CNN
F 3 "~" H 850 5150 50  0001 C CNN
	1    850  5200
	-1   0    0    1   
$EndComp
$Comp
L Device:LED_CRGB DRGB5
U 1 1 61435B03
P 850 5850
F 0 "DRGB5" H 550 6050 50  0000 C CNN
F 1 "LED_CRGB" H 850 6256 50  0001 C CNN
F 2 "" H 850 5800 50  0001 C CNN
F 3 "~" H 850 5800 50  0001 C CNN
	1    850  5850
	-1   0    0    1   
$EndComp
$Comp
L Device:LED_CRGB DRGB6
U 1 1 614365AB
P 850 6500
F 0 "DRGB6" H 550 6700 50  0000 C CNN
F 1 "LED_CRGB" H 850 6906 50  0001 C CNN
F 2 "" H 850 6450 50  0001 C CNN
F 3 "~" H 850 6450 50  0001 C CNN
	1    850  6500
	-1   0    0    1   
$EndComp
Wire Wire Line
	500  3450 500  4100
Wire Wire Line
	500  4100 650  4100
Connection ~ 500  3450
Wire Wire Line
	500  4100 500  4750
Wire Wire Line
	500  4750 650  4750
Connection ~ 500  4100
Wire Wire Line
	500  4750 500  5400
Wire Wire Line
	500  5400 650  5400
Connection ~ 500  4750
Wire Wire Line
	500  5400 500  6050
Wire Wire Line
	500  6050 650  6050
Connection ~ 500  5400
Wire Wire Line
	500  6050 500  6700
Wire Wire Line
	500  6700 650  6700
Connection ~ 500  6050
$Comp
L Device:R_US Rrgbred
U 1 1 6145FEB1
P 3150 3350
F 0 "Rrgbred" V 2945 3350 50  0001 C CNN
F 1 "82" V 3100 3150 50  0000 C CNN
F 2 "" V 3190 3340 50  0001 C CNN
F 3 "~" H 3150 3350 50  0001 C CNN
	1    3150 3350
	0    1    1    0   
$EndComp
Wire Wire Line
	3650 3350 3300 3350
Wire Wire Line
	3000 3350 2000 3350
$Comp
L Device:R_US Rrgbgreen
U 1 1 61471DA4
P 2950 3450
F 0 "Rrgbgreen" V 2745 3450 50  0001 C CNN
F 1 "82" V 2900 3250 50  0000 C CNN
F 2 "" V 2990 3440 50  0001 C CNN
F 3 "~" H 2950 3450 50  0001 C CNN
	1    2950 3450
	0    1    1    0   
$EndComp
Wire Wire Line
	3650 3450 3100 3450
Wire Wire Line
	2800 3450 1950 3450
$Comp
L Device:R_US Rrgbblue
U 1 1 61483C8E
P 2650 3550
F 0 "Rrgbblue" V 2445 3550 50  0001 C CNN
F 1 "82" V 2600 3350 50  0000 C CNN
F 2 "" V 2690 3540 50  0001 C CNN
F 3 "~" H 2650 3550 50  0001 C CNN
	1    2650 3550
	0    1    1    0   
$EndComp
Wire Wire Line
	3650 3550 2800 3550
Wire Wire Line
	2500 3550 1900 3550
Wire Wire Line
	550  3250 550  3900
Wire Wire Line
	550  3900 650  3900
Connection ~ 550  3250
Wire Wire Line
	550  3900 550  4550
Wire Wire Line
	550  4550 650  4550
Connection ~ 550  3900
Wire Wire Line
	550  4550 550  5200
Wire Wire Line
	550  5200 650  5200
Connection ~ 550  4550
Wire Wire Line
	550  5200 550  5850
Wire Wire Line
	550  5850 650  5850
Connection ~ 550  5200
Wire Wire Line
	550  5850 550  6500
Wire Wire Line
	550  6500 650  6500
Connection ~ 550  5850
Wire Wire Line
	600  2900 600  3050
Wire Wire Line
	600  3050 650  3050
Wire Wire Line
	600  2900 1900 2900
Wire Wire Line
	600  3050 600  3700
Wire Wire Line
	600  3700 650  3700
Connection ~ 600  3050
Wire Wire Line
	600  3700 600  4350
Wire Wire Line
	600  4350 650  4350
Connection ~ 600  3700
Wire Wire Line
	600  4350 600  5000
Wire Wire Line
	600  5000 650  5000
Connection ~ 600  4350
Wire Wire Line
	600  5000 600  5650
Wire Wire Line
	600  5650 650  5650
Connection ~ 600  5000
Wire Wire Line
	600  5650 600  6300
Wire Wire Line
	600  6300 650  6300
Connection ~ 600  5650
Wire Wire Line
	1300 3050 1300 3900
Wire Wire Line
	1300 3900 1050 3900
Wire Wire Line
	1300 3050 3650 3050
Wire Wire Line
	1400 3150 1400 4550
Wire Wire Line
	1400 4550 1050 4550
Wire Wire Line
	1400 3150 3650 3150
Wire Wire Line
	1500 3250 1500 5200
Wire Wire Line
	1500 5200 1050 5200
Wire Wire Line
	1500 3250 3650 3250
Wire Wire Line
	1550 3650 1550 5850
Wire Wire Line
	1550 5850 1050 5850
Wire Wire Line
	1550 3650 3650 3650
Wire Wire Line
	1600 3750 1600 6500
Wire Wire Line
	1600 6500 1050 6500
Wire Wire Line
	1600 3750 3650 3750
$Comp
L Switch:SW_Push SWreset
U 1 1 6155419E
P 5150 2250
F 0 "SWreset" H 5150 2443 50  0000 C CNN
F 1 "SW_Push" H 5150 2444 50  0001 C CNN
F 2 "" H 5150 2450 50  0001 C CNN
F 3 "~" H 5150 2450 50  0001 C CNN
	1    5150 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 2550 4950 2550
Wire Wire Line
	4950 2550 4950 2250
$Comp
L power:GNDREF #PWR?
U 1 1 6156245C
P 5350 2250
F 0 "#PWR?" H 5350 2000 50  0001 C CNN
F 1 "GNDREF" H 5355 2077 50  0001 C CNN
F 2 "" H 5350 2250 50  0001 C CNN
F 3 "" H 5350 2250 50  0001 C CNN
	1    5350 2250
	1    0    0    -1  
$EndComp
$EndSCHEMATC
