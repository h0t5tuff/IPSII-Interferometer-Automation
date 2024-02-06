# -*- coding: utf-8 -*-
"""
Created on Mon Aug 16 12:17:28 2021

@author: 10912180
"""



R = 10000
Rb = 20000
Vmax = 1023

V = [0]

for i in range(6):
    RA = (5-i)*R
    RB = (((i+1)*R)**-1 + Rb**-1)**-1
    q = Vmax*(RB/(RA+RB))
    V.append(q)

#print(V)

Vbreak = []
for i in range(6):
    Vbreak.append(round((V[i]+V[i+1])/2))
    
#print(Vbreak)

Vbreak = []
for i in range(6):
    Vbreak.append(round((V[i+1])-15))
Vbreak.append(2000)
print("Button Break Points")
print(Vbreak)


V = [0,204.6,341.0,409.2]
Vbreak = []
for i in range(3):
    Vbreak.append(round((V[i+1])-15))
Vbreak.append(2000)
print("Encoder Break Points")
print(Vbreak)



# 0, 117-118, 202-203, 289-291, 407-408, 600-601, 1023