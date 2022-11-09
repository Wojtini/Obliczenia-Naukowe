import matplotlib.pyplot as plt
import numpy as np
import math


# 100 linearly spaced numbers
x = np.linspace(0 , 40, 10000)

def f(x):
    return math.e**x * math.log(1 + pow(math.e, -x))
    
# setting the axes at the centre
fig = plt.figure()
ax = fig.add_subplot(1, 1, 1)
ax.spines['left'].set_position('center')
ax.spines['bottom'].set_position('zero')
ax.spines['right'].set_color('none')
ax.spines['top'].set_color('none')
ax.xaxis.set_ticks_position('bottom')
ax.yaxis.set_ticks_position('left')

# plot the function
print(x)
y = []
for xval in x:
    y.append(f(xval))
plt.plot(x, y, 'r')

# show the plot
plt.show()