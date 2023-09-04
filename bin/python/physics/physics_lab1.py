#!/usr/bin/env python3
# Author: Rotari Corneliu
from math import sqrt
import numpy as np
import matplotlib.pylab as plt


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

# Linear regression plot 
def plot(b, xdata, ydata, color):
    slope = b[1]
    interceptor = b[0]

    line = np.linspace(-1,1);
    y_pred = interceptor + slope  * line
    plt.plot(line, y_pred, color=color)

    plt.plot(xdata,ydata, 'o', color=color)


# Determin the constant for the crystalline structure
def constantaRetea(slope, number, refference) :
    e = 1.602 * pow(10, -19);
    m = 9.109 * pow(10, -31);
    h = 6.625 * pow(10, -34);
    L = 0.135
    d = (2 * h * L) / (slope * sqrt(2 * e * m))
    d = d / pow(10, -10)
    print("d",number,":", d, "* 10^(-10) (m)\n")
    print("Eroarea relativa:", abs(1 - d/refference), "\n")


def main():
    # Arrays for x and y axis
    x = np.array([0.0182, 0.0169, 0.0158, 0.0149, 0.0141])
    y_D1 = np.array([0.029, 0.027, 0.024, 0.023 , 0.023])
    y_D2 = np.array([0.05, 0.047, 0.044, 0.042, 0.038])
    
    linear_coef_D1 = coeff(x,y_D1)
    linear_coef_D2 = coeff(x,y_D2)

    print("Panta_D1: ", linear_coef_D1[1], "(m/v^(-1/2))\n")
    constantaRetea(linear_coef_D1[1],1, 2.13)

    print("\nPanta_D2: ", linear_coef_D2[1], "(m/v^(-1/2))\n")
    constantaRetea(linear_coef_D2[1],2, 1.23)


    plot(linear_coef_D1, x, y_D1, "red")
    plot(linear_coef_D2, x, y_D2, "blue")

    plt.title("Determinarea constantei de rețea a grafitului")
    plt.xlabel("\u215F\u221AU [\u215F\u221AV]")
    plt.ylabel("D [m]")
    plt.xlim([0.0135,0.019])
    plt.ylim([0.02,0.055])
    plt.legend(["D1 = (" + str(linear_coef_D1[1])[0:6] + ") * x - " + str(abs(linear_coef_D1[0]))[:7], "D1 values", 
                "D2 = (" + str(linear_coef_D2[1])[0:6] + ") * x - " + str(abs(linear_coef_D2[0]))[:7], "D2 values"])

    plt.show()

if __name__ == '__main__' :
    main()
