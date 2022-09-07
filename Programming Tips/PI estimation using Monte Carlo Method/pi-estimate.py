#!/usr/bin/env python

import random
random.seed(1234)
from math import pi
import matplotlib.pyplot as plt

piEstimate, p = [], 200
n = 10**7

totalinCircle = 0
for i in range(1, n+1):
    x = random.random()
    y = random.random()
    if x**2 + y**2 <= 1:
        totalinCircle += 1
    pi = (totalinCircle * 4 / i)
    if i%100==0:
        print(f"\r[i:{i:7}] Pi number approximately equals to {pi:<20}", end='')

    if i<=p: piEstimate.append(pi)

# Plot the first 200 pi estimates
plt.figure()
plt.scatter(range(1, p+1), piEstimate)
max_x = plt.xlim()[1]
plt.hlines(pi, 0, max_x, color='black')
plt.xlim(0, p)
plt.title("$\pi$ estimatation")
plt.xlabel("Number of dots")
plt.ylabel("$\pi$")
plt.show()