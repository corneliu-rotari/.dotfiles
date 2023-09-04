#!/usr/bin/env python3.10
# Author: Rotari Corneliu
import math
import numpy as np
import matplotlib.pylab as plt
import seaborn as sns
import pandas as pd
from scipy.interpolate import CubicSpline
from scipy.signal import argrelextrema

def calculations():
    #Xmnt
    print("Xmnt")
    lam = 499.81 / 1000000
    D = 1630
    pi = math.pi
    eps = [4.493, 7.725, 10.904]
    a = [0.12, 0.24, 0.48]
    Xmnt =[]
    for i in a:
        for j in eps:
            # print("a = ", i, " eps = ", j)
            # print((lam*D*j)/(pi * i))
            Xmnt.append((lam*D*j)/(pi * i))
    print(Xmnt)    
    Xmne = [8.882	,15.313,	21.655,	4.635,	8.175,	11.81,	3.29	,5.724	,8.814]
    kxm = []
    for i in range(9):
        kxm.append(Xmne[i]/Xmnt[i])
    print(kxm)

        


def lambda_length():
    # Lambda calculation 
    # abaterea patratica
    arr = [1.334,	0.529,	0.0317,	7.44,	2.321	,1.488	,11.27,	2.918	,1.918]
    medie = 0
    for i in arr:
        medie += i
    medie /= len(arr)
    print("Medie: ", medie)
    sum = 0
    for i in range(3):
        sum += (medie - arr[i]) * (medie - arr[i]);
    result = sum / 2;
    print("Abaterea: ",math.sqrt(result));

def main():
    # Arrays for x and y axis for Fanta C
    # print("Fanta C")
    # X1 = np.linspace(-10,9,1000)
    # x = np.array([-10,-9,-8,-7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7,8 ,9 ,10])
    # y = np.array([2.73, 6.22, 6.42, 11.03, 16.53, 29.25, 161.4, 213.4, 149.3, 21.7, 12.3, 12, 5.26, 6.89, 2]) #1
    # y = np.array([2,6.17,5.45,10.26,23.12,28.72,141.5,212.5,163.1,17.5,14.4,13.1,5.23,6.85,1.87]) #2
    # y = np.array([1.27,3.4,2.3,1.92,6.12,6.47,9.25,23.79,30.2,144.2,212.9,146.4,17.87,11.97,13.91,4.14,6.87,1.94,2.75, 3.46,1.58]) #3

    # Arrays for x and y axis for Fanta B
    # print("Fanta B")
    # X1 = np.linspace(-13,14,1000)
    # x = np.array([-12, -11, -10, -9, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12])
    # y = np.array([0.78, 1.7, 1.76, 1.19, 3.39, 3.78, 1.6, 4.81, 10.29, 6.15, 20.2, 69.1, 103.4, 107.5, 81.3, 32.9, 7.51, 16.35, 12.01, 2.48, 2.33, 4.64, 2.1, 1.16, 2.36])

    # Arrays for x and y axis for Fanta A
    print("Fanta A")
    X1 = np.linspace(-29,29,1000)
    x = np.array([-28, -27, -26, -25, -24, -23, -22, -21, -20, -19, -18, -17, -16, -15, -14, -13, -12, -11, -10, -9, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28])
    y = np.array([0.71, 0.71, 0.62, 0.52, 0.57, 0.75, 0.93, 0.95, 0.78, 0.60, 0.68, 1.1, 1.49, 1.66, 1.29, 0.8, 0.64, 1.47, 2.98 ,3.93, 3.52, 2.13, 2.01, 5.05, 13.95, 33.8, 46.3, 57.2, 60.4, 55.5, 47.2, 34.6,18, 7.7, 2.32, 2.03,3.17, 3.73,3.05, 1.86, 0.89, 0.67, 1.04, 1.38, 1.40, 1.14, 0.8, 0.64, 0.67, 0.85, 0.9, 0.86, 0.74, 0.65, 0.63, 0.68, 0.72])

    predict = CubicSpline(x, y, bc_type="natural")
    
    Y1 = np.array([predict(x) for x in X1])

    local_maxima = argrelextrema(Y1, np.greater, order = 15)

    for i in local_maxima:
        print("x: ", X1[i])
        print("U: ", Y1[i])
    

    plt.plot(x,y,'bo:')
    plt.plot(X1,Y1,'r')
    
    
    plt.title("Poziţiile maximelor de intensitate")
    plt.xlabel("X [mm]")
    plt.ylabel("U [mV]")
    plt.show()

if __name__ == '__main__' :
    # main()
    lambda_length()
    # calculations()

