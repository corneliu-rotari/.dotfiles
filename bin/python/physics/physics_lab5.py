#!/usr/bin/env python3
# Author: Rotari Corneliu
import numpy as np
import matplotlib.pylab as plt
from scipy.interpolate import CubicSpline


def coeff(x, y) :
    x_mean = np.mean(x)
    y_mean = np.mean(y)
    n = np.size(x)


    Sxy = np.sum(x * y) - n * x_mean * y_mean
    Sxx = np.sum(x * x) - n * x_mean * x_mean

    slope = (Sxy / Sxx)
    b_0 = y_mean - slope * x_mean
    return b_0, slope

def main():
    # Arrays for x and y axis
    # r = np.array([6.2 , 7.2, 8.2, 9.2, 10.2, 11.2, 12.2, 13.2, 14.2, 15.2, 16.2, 17.2, 18.2, 19.2])
    # N_imp = np.array([23969, 20418, 17699, 15487, 13414, 11913, 10718, 9672, 8490, 7819, 6889, 6295, 5694, 5079, 1268])
    # t= ([60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60,600])
    
    # Ex 6
    r = np.array([100, 10000000000])
    D = 3.1415
    N_imp = np.array([5000, 1500])
    t = np.array([300, 600])

    # Ex 7
    r = np.array([100, 200])
    D = 3.1415
    N_imp = np.array([13000, 4000])
    t = np.array([1200, 1200])
    
    omega_four_pi = D**2/(16 * (r**2))

    n_vir = N_imp/t
    n_doi_vir = n_vir / (1 - 10**(-6) * n_vir)
    n = n_doi_vir - 1

    # sigma_N = (N_imp**(1/2))
    # sigma_n_vir = sigma_N/t
    # sigma_doi_vir = sigma_n_vir / (1 - 10**(-6) * n_vir)**2
    # sigma_n = (sigma_doi_vir ** 2 + sigma_n_vir ** 2)**(1/2)
    b,m = coeff(omega_four_pi, n)

    lam = m/ (0.2 * 2)

    print(omega_four_pi)
    # print(sigma_N)
    print(n_vir)
    print(n_doi_vir)
    # print(sigma_n_vir)
    # print(sigma_doi_vir)
    print(n)
    # print(sigma_n)
    print(m)

    print(lam)

    # plt.plot(omega_four_pi, n, 'ro')
    # plt.plot(omega_four_pi, m*omega_four_pi + b,'b')
    # plt.title("Regresia liniara")
    # plt.xlabel("omega / 4 * pi")
    # plt.ylabel("n")

    # plt.show()

if __name__ == '__main__' :
    main()