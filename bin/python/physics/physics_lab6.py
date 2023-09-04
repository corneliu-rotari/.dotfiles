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

def main():
    # Initial caluclations
    f = 159.0/600.0
    intestity = np.array([0, 0.05, 0.1, 0.15, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5, 0.55, 0.6, 0.65, 0.7, 0.75, 0.8, 0.85, 0.9, 0.95, 1, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7])
    voltage = np.array([5.47459, 13.51769, 21.56079, 34.45149, 47.34219, 64.448415, 81.55464, 102.1945, 122.83436, 146.36578, 169.8972, 195.763355, 221.62951, 249.370905, 277.1123, 306.360415, 335.60853, 366.0721, 396.53567, 427.985825, 459.43598, 532.94976, 589.79335, 656.74184, 724.61564, 793.27029, 862.58873, 932.47532])
    N = np.array([214, 239, 320, 404, 504, 721, 804, 956, 1024, 1152, 1223, 1226, 1262, 1322, 1258, 1207, 1142, 1129, 1127, 1119, 1019, 828, 659, 566, 448, 342, 259, 176])
    t = 60
    n_prim = N / t
    n = n_prim - f

    sigma = np.sqrt(n/t + f/600)
    to_ex(sigma)
    

    X1 = np.linspace(0,1000,100000)
    x = voltage
    y = n

    predict = CubicSpline(x, y, bc_type="natural")
    
    Y1 = np.array([predict(x1) for x1 in X1])

    Eh = 0
    for i in X1:
        if (predict(i) == Y1.max()):
            Eh = i
            break

    print(Eh)

    plt.plot(x,y,'bo:')
    plt.plot(X1,Y1,'r')
    
    plt.title("E h")
    plt.xlabel("E [keV]")
    plt.ylabel("n [imp/s]")
    plt.show()

if __name__ == '__main__' :
    main()
