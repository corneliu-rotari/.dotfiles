Notes for python function
---

- Local extremes for data
```
scipy.signal.argrelextrema(data, np.greater_equal / np.less_equal, order = 15)
```


- Intrepolate discreate points 
```
scipy.interpolate.CubicSpline(x, y, bc_type="natural")
```
- Create interval between 2 points
```
numpy.linspace(start, stop, number_of_points_in_between)
```