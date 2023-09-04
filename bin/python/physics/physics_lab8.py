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

def calc1():
    r = 3
    # U = np.array([120, 140, 160, 180, 200, 220, 240, 260, 280, 300])
    U = np.array([120, 140, 160, 180, 200, 220])
    niu = 4 *3.14159 * 10 ** -7
    n = 154
    # I = np.array([1.16, 1.25, 1.35, 1.43, 1.51, 1.56, 1.64, 1.70, 1.75, 1.8])
    # I = np.array([1.46, 1.58, 1.7, 1.8, 1.89,1.98, 2.05, 2.12, 2.19, 2.26])
    # I = np.array([1.99, 2.17, 2.31, 2.44, 2.55, 2.65, 2.75, 2.85, 2.92, 3.01])
    I = np.array([3.15, 3.40, 3.54, 3.71, 3.85, 4.07])
    e_m = (125 * (0.2**2) * (U + 40)) / (32 * (niu ** 2) * (n **2) * (r**2) * (I**2))
    em = e_m / 10 ** 7
    to_ex(em)


def main():
    em_tot = np.array([1.984374, 1.922525, 1.831395, 1.795437, 1.756616, 1.782969, 1.73736, 1.732379,1.743787, 1.751272, 1.957284, 1.880174, 1.804562, 1.770587, 1.751972, 1.729349, 1.73736, 1.740561,1.739808, 1.735808, 1.87297, 1.772026,1.737493, 1.713011, 1.710992, 1.716322, 1.716365, 1.712177, 1.739808, 1.739655, 0.747508, 0.721825, 0.739845, 0.740955, 0.750597, 0.727615])
    medie = np.mean(em_tot)

    k = em_tot.size
    em_2 = (em_tot - medie) ** 2
    sigma = np.sqrt(np.mean(em_2) / (k-1))

    err = sigma / medie
    print(err)
if __name__ == '__main__' :
    main()
