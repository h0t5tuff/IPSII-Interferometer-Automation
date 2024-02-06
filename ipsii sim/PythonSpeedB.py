# -*- coding: utf-8 -*-
"""
Created on Tue Aug 17 13:11:25 2021

@author: 10912180
"""

import numpy as np
import matplotlib.pyplot as plt

N = 256

x = np.arange(0,N,1)

ux, uy = np.meshgrid(x,x)

img = ux*0 + 1
img[ux < N//4] = 0
img[ux > 3*N//4] = 0
img[uy < N//4] = 0
img[uy > 3*N//4] = 0


plt.imshow(img)
plt.show()


patternA = ux*0 + 1
patternA[np.sin(ux*0.2) < 0] = 0
patternA[np.sin(uy*0.2) < 0] = 0

patternB = ux*0 
patternB[np.sin(ux*0.2) < 0] = 1
patternB[np.sin(uy*0.2) < 0] = 1

patternC = ux*0 
patternC[np.sin(ux*0.2+uy*0.2) < 0] = 1



plt.imshow(patternA)
plt.show()

plt.imshow(patternB)
plt.show()

plt.imshow(patternC)
plt.show()

F = []

for pattern in [patternA,patternB,patternC]:
    F.append(np.fft.fft2(pattern*img))
    
freqs = np.fft.fftfreq(N,0.1)
maxfreqs = np.max(freqs)
df = freqs[1]

ufreqsx, ufreqsy = np.meshgrid(freqs,freqs)
    
for i in range(3):
    plt.imshow(np.abs(F[i])**0.1)
    plt.show()
    
    
    
Ffull = []
for i in range(3):
    A = F[i].copy()
    A[abs(ufreqsx)>1.0] = 0
    A[abs(ufreqsy)>1.0] = 0
    Ffull.append(A)
    plt.imshow(np.abs(A)**0.1)
    plt.show()
    
Fpartial = []
for i in range(3):
    A = F[i].copy()
    A[(ufreqsx/df).astype(np.int) % 2 == 1] = 0    
    A[(ufreqsy/df).astype(np.int) % 2 == 1] = 0    
    plt.imshow(np.abs(A)**0.1)
    plt.show()
    
    