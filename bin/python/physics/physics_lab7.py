#!/usr/bin/env python3.10
# Author: Rotari Corneliu
import math
import numpy as np
import matplotlib.pylab as plt
import seaborn as sns
import pandas as pd
from scipy.interpolate import CubicSpline
from scipy.signal import argrelextrema

def to_ex(array):
    df = pd.DataFrame(array)
    filepath = 'my_excel_file.xlsx'
    df.to_excel(filepath, index=False)
    print(array)

# Calculates the slope and the interceptor for the linear regresion
def coeff(x, y) :
    x_mean = np.mean(x)
    y_mean = np.mean(y)
    n = np.size(x)


    Sxy = np.sum(x * y) - n * x_mean * y_mean
    Sxx = np.sum(x * x) - n * x_mean * x_mean

    slope = (Sxy / Sxx)
    b_0 = y_mean - slope * x_mean
    return b_0, slope

def plot(b, xdata, ydata, color):
    slope = b[1]
    interceptor = b[0]

    line = np.linspace(0,25,100)
    y_pred = interceptor + slope  * line
    plt.plot(line, y_pred, color=color)

    plt.plot(xdata,ydata, 'o', color=color)

def main():
    f = 567.0/297.0
    
    #A_prim = np.array([567, 2370, 1823, 1393, 1023, 904, 612, 2370, 2307, 2327, 2173, 1924, 1768])
    A_prim = np.array([297, 1927, 1429, 1077, 840, 617, 523, 1927, 1850, 1644, 1490, 1529, 1305])
    A = A_prim - f
    ln_A = np.log(A)
    to_ex(ln_A)

    Pb = np.array([7.562728, 7.263393, 6.980161, 6.731127, 6.42177, 6.255925])
    Al = np.array([7.562728, 7.521908, 7.403726, 7.305249, 7.33112, 7.172494])
    x_div = np.array([0, 5, 10, 15, 20, 25])

    x = x_div
    y = Pb
    linear_coef = coeff(x, y)
    
    plot(linear_coef, x, y, "red")
    # plt.plot(X1,Y1,'r')
    plt.legend(["m = " + str(abs(linear_coef[1]))])
    
    plt.title("Pb")
    plt.xlabel("x [div]")
    plt.ylabel("ln A")
    plt.show()

if __name__ == '__main__' :
    main()
