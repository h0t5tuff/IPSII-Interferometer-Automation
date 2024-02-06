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
F 1 "10" H 5668 2955 50  0000 L CNN
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
Wire Wire Line
	4650 3750 4900 3750
Wire Wire Line
	5600 2500 5600 2650
Wire Wire Line
	5600 3150 5600 3350
Wire Wire Line
	4900 3750 4900 2650
Wire Wire Line
	4900 2650 5600 2650
Connection ~ 5600 2650
Wire Wire Line
	5600 2650 5600 2850
Wire Wire Line
	5300 3650 5300 3350
Wire Wire Line
	5300 3350 5600 3350
Wire Wire Line
	4650 3650 5300 3650
Connection ~ 5600 3350
Wire Wire Line
	5600 3350 5600 3550
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
Text GLabel 2450 3350 0    50   Input ~ 0
DVI_pins_1-8
Text GLabel 2550 3450 0    50   Input ~ 0
DVI_pins_17-24
Text GLabel 2350 3550 0    50   Input ~ 0
DVI_pin_16
Text GLabel 2350 2950 0    50   Input ~ 0
DVI_pin_C1
Text GLabel 2350 2850 0    50   Input ~ 0
DVI_pin_C2
Text GLabel 2350 3150 0    50   Input ~ 0
DVI_pin_C3
Text GLabel 2350 3050 0    50   Input ~ 0
DVI_pin_C4
Text GLabel 2350 3250 0    50   Input ~ 0
DVI_pin_C5
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
Wire Wire Line
	2350 2950 3650 2950
Wire Wire Line
	2350 3050 3650 3050
Wire Wire Line
	2350 3150 3650 3150
Wire Wire Line
	2450 3350 2600 3350
Wire Wire Line
	2600 3350 2600 3250
Wire Wire Line
	2600 3250 2350 3250
$Comp
L power:GNDREF #PWR0105
U 1 1 610C9D5F
P 2750 3250
F 0 "#PWR0105" H 2750 3000 50  0001 C CNN
F 1 "GNDREF" H 2755 3077 50  0001 C CNN
F 2 "" H 2750 3250 50  0001 C CNN
F 3 "" H 2750 3250 50  0001 C CNN
	1    2750 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 3250 2750 3250
Connection ~ 2600 3250
$Comp
L power:+24V #PWR0106
U 1 1 610CB6F5
P 3000 3400
F 0 "#PWR0106" H 3000 3250 50  0001 C CNN
F 1 "+24V" H 3015 3573 50  0000 C CNN
F 2 "" H 3000 3400 50  0001 C CNN
F 3 "" H 3000 3400 50  0001 C CNN
	1    3000 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 3450 3000 3450
Wire Wire Line
	3000 3450 3000 3400
Wire Wire Line
	2350 3550 2600 3550
Wire Wire Line
	2600 3550 2600 3650
Wire Wire Line
	2600 3650 3650 3650
Text GLabel 2450 4350 0    50   Input ~ 0
DVI_pins_1-8
Text GLabel 2550 4450 0    50   Input ~ 0
DVI_pins_17-24
Text GLabel 2350 4550 0    50   Input ~ 0
DVI_pin_16
Text GLabel 2350 3950 0    50   Input ~ 0
DVI_pin_C1
Text GLabel 2350 3850 0    50   Input ~ 0
DVI_pin_C2
Text GLabel 2350 4150 0    50   Input ~ 0
DVI_pin_C3
Text GLabel 2350 4050 0    50   Input ~ 0
DVI_pin_C4
Text GLabel 2350 4250 0    50   Input ~ 0
DVI_pin_C5
Wire Wire Line
	2350 3850 3250 3850
Wire Wire Line
	2350 3950 3350 3950
Wire Wire Line
	2350 4050 3450 4050
Wire Wire Line
	2350 4150 3550 4150
Wire Wire Line
	2450 4350 2600 4350
Wire Wire Line
	2600 4350 2600 4250
Wire Wire Line
	2600 4250 2350 4250
$Comp
L power:GNDREF #PWR0107
U 1 1 610CF8CA
P 2750 4250
F 0 "#PWR0107" H 2750 4000 50  0001 C CNN
F 1 "GNDREF" H 2755 4077 50  0001 C CNN
F 2 "" H 2750 4250 50  0001 C CNN
F 3 "" H 2750 4250 50  0001 C CNN
	1    2750 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 4250 2750 4250
Connection ~ 2600 4250
$Comp
L power:+24V #PWR0108
U 1 1 610CF8D2
P 3000 4400
F 0 "#PWR0108" H 3000 4250 50  0001 C CNN
F 1 "+24V" H 3015 4573 50  0000 C CNN
F 2 "" H 3000 4400 50  0001 C CNN
F 3 "" H 3000 4400 50  0001 C CNN
	1    3000 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 4450 3000 4450
Wire Wire Line
	3000 4450 3000 4400
Connection ~ 3000 3400
Wire Wire Line
	3000 3400 3000 3350
Connection ~ 3000 4400
Wire Wire Line
	3000 4400 3000 4350
Wire Wire Line
	3650 3250 3250 3250
Wire Wire Line
	3250 3250 3250 3850
Wire Wire Line
	3650 3350 3350 3350
Wire Wire Line
	3350 3950 3350 3350
Wire Wire Line
	3650 3450 3450 3450
Wire Wire Line
	3450 3450 3450 4050
Wire Wire Line
	3650 3550 3550 3550
Wire Wire Line
	3550 3550 3550 4150
Wire Wire Line
	3650 3750 3650 4550
Wire Wire Line
	2350 4550 3650 4550
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
$Comp
L Device:LED DgreenB1
U 1 1 610EF700
P 1350 5050
F 0 "DgreenB1" H 1343 5267 50  0001 C CNN
F 1 "GreenLED" H 1343 5175 50  0000 C CNN
F 2 "" H 1350 5050 50  0001 C CNN
F 3 "~" H 1350 5050 50  0001 C CNN
	1    1350 5050
	1    0    0    -1  
$EndComp
$Comp
L Device:LED DredB1
U 1 1 610EF706
P 1350 5350
F 0 "DredB1" H 1343 5567 50  0001 C CNN
F 1 "Red LED" H 1343 5475 50  0000 C CNN
F 2 "" H 1350 5350 50  0001 C CNN
F 3 "~" H 1350 5350 50  0001 C CNN
	1    1350 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 5050 1500 5050
Wire Wire Line
	1200 5050 850  5050
Wire Wire Line
	850  5050 850  5350
Wire Wire Line
	850  5350 1200 5350
$Comp
L power:GNDREF #PWR0110
U 1 1 610EF710
P 850 5350
F 0 "#PWR0110" H 850 5100 50  0001 C CNN
F 1 "GNDREF" H 855 5177 50  0001 C CNN
F 2 "" H 850 5350 50  0001 C CNN
F 3 "" H 850 5350 50  0001 C CNN
	1    850  5350
	1    0    0    -1  
$EndComp
Connection ~ 850  5350
$Comp
L Device:R_US RgreenB1
U 1 1 610EF717
P 1950 5050
F 0 "RgreenB1" V 1745 5050 50  0000 C CNN
F 1 "200" V 1836 5050 50  0000 C CNN
F 2 "" V 1990 5040 50  0001 C CNN
F 3 "~" H 1950 5050 50  0001 C CNN
	1    1950 5050
	0    1    1    0   
$EndComp
$Comp
L Device:R_US RredB1
U 1 1 610EF71D
P 1950 5350
F 0 "RredB1" V 1745 5350 50  0000 C CNN
F 1 "200" V 1836 5350 50  0000 C CNN
F 2 "" V 1990 5340 50  0001 C CNN
F 3 "~" H 1950 5350 50  0001 C CNN
	1    1950 5350
	0    1    1    0   
$EndComp
Wire Wire Line
	1500 5350 1800 5350
Wire Wire Line
	3500 5350 3600 5350
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
	2100 5050 3500 5050
Wire Wire Line
	3500 5050 3500 5350
Wire Wire Line
	3600 5450 3400 5450
Wire Wire Line
	3400 5450 3400 5350
Wire Wire Line
	2100 5350 3400 5350
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
Wire Wire Line
	5600 2650 6600 2650
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
	6350 3350 5600 3350
Wire Wire Line
	6600 2650 6600 6450
Wire Wire Line
	4600 6450 6600 6450
Wire Wire Line
	4600 6350 6350 6350
Wire Wire Line
	6350 3350 6350 6350
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
$EndSCHEMATC
