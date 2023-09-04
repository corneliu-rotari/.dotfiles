#!/usr/bin/env python3
# Author: Rotari Corneliu
import numpy as np
import matplotlib.pylab as plt

def frecventa():
    c = 3 * 100000
    frecv = []
    lam = [578, 546, 436, 405, 366]
    for i in lam:
        frecv.append(c/i * 1000000000000)
    return frecv

def tensiunea_de_stopare_medie():
    tens_arr = [[0.7807	,0.7819	,0.7882	,0.7451,	0.7712,	0.7632,	0.783	,0.7694	,0.7865	,0.7813],
                [0.8977,	0.8957	,0.9028	,0.8965	,0.9	,0.9105	,1.118	,1.202	,0.9488	,0.9285],
                [1.316	,1.292	,1.291	,1.329	,1.298	,1.316	,1.284	,1.293	,1.312	,1.317],
                [1.364	,1.374	,1.363	,1.353	,1.346	,1.364	,1.366	,1.325	,1.352	,1.331],
                [1.364	,1.378	,1.413	,1.4	,1.37	,1.392	,1.437	,1.449	,1.455	,1.458]]

    for i in range(5):

        if (i < 4):
            for j in range(10):
                tens_arr[i][j] -= 0.0566 
        else :
            for j in range(10):
                tens_arr[i][j] -= 0.0446

    U_0_mediu = []
    for i in tens_arr:
        suma = 0
        for j in i:
            suma+=j
        suma/=10
        U_0_mediu.append(suma)
    return U_0_mediu

# Calculates the slope and the interceptor for the linear regresion
def coeff(x, y) :
    x_mean = np.mean(x)
    y_mean = np.mean(y)
    n = np.size(x)


    Sxy = np.sum(x * y) - n * x_mean * y_mean
    Sxx = np.sum(x * x) - n * x_mean * x_mean

    slope = (Sxy / Sxx)
    b_0 = y_mean - slope * x_mean
    print("Panta: ", slope)
    print("Intersectia cu axa Oy :", b_0)
    return b_0, slope

# Linear regression plot 
def plot(b, xdata, ydata, color):
    slope = b[1]
    interceptor = b[0]

    line = np.linspace(0,850000000000000);
    y_pred = interceptor + slope  * line
    plt.plot(line, y_pred, color=color)

    plt.plot(xdata,ydata, 'o', color=color)


def main():
    # Arrays for x and y axis
    x = np.array(frecventa())
    y = np.array(tensiunea_de_stopare_medie())
    
    linear_coef_D1 = coeff(x,y)

    plot(linear_coef_D1, x, y, "red")

    plt.title("Tensiunea in functie de frecventa")
    plt.xlabel("v [Hz]")
    plt.ylabel("U_0 [V]")
    plt.xlim([0,850000000000000])
    plt.ylim([0,1.5])
    plt.legend(["U_0(v) = (" + str(linear_coef_D1[1])[:6] + ") * v + (" + str(linear_coef_D1[0])[:6]+")", "U_0 values"])

    plt.show()

if __name__ == '__main__' :
    main()
