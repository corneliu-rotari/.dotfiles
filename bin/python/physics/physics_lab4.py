#!/usr/bin/env python3
# Author: Rotari Corneliu
import numpy as np
import matplotlib.pylab as plt
from math import sqrt

def lam(A, B, div):
    lambd = (A * div + B)

    toRet = []
    for i in lambd:
        # toRet.append(1/sqrt(i))
        print(1/sqrt(i))

    print()
    return toRet

def main():
    # Arrays for x and y axis
    div_original = np.array([115.72, 116.13, 116.50, 116.84, 117.42, 117.52, 118.6, 119.5, 119.55])
    lam_original = np.array([607.3, 589.0, 577.0, 546.1, 496.0, 491.6, 435.8, 407.8, 404.7])

    div_x = np.array([116.08, 116.36, 116.77, 117.28, 117.88, 117.42, 117.92])
    div_y = np.array([116.02, 117.25, 117.83, 118, 118.5])
    div_z = np.array([115.65, 115.86, 116.35, 117.32, 117.55, 117.83, 118.3])
    
    reg = 1/(lam_original**2)
    A, B = np.polyfit(div_original, reg, 1)

    lam_x = lam(A, B, div_x)
    lam_y = lam(A, B, div_y)
    lam_z = lam(A, B, div_z)


    print(A)
    print(B)

    print("lambda_x : ", lam_x)
    print("lambda_y : ", lam_y)
    print("lambda_z : ", lam_z)
    
    plt.plot(div_original, reg, 'ro')
    plt.plot(div_original, A*div_original + B,'b')
    plt.title("Regresia")
    plt.xlabel("x [div]")
    plt.ylabel("y [1/(lambda^2)]")

    plt.show()

if __name__ == '__main__' :
    main()