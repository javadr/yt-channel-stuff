#!/usr/bin/env python
# inspired by https://matplotlib.org/stable/gallery/animation/rain.html

import numpy as np
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation, FFMpegWriter

# Fixing random state for reproducibility
np.random.seed(1234)

# Create new Figure and an Axes which fills it.
fig = plt.figure(figsize=(7, 7))
ax = fig.add_axes([0, 0, 1, 1], frameon=True)
ax.set_xlim(0, 1), ax.set_ylim(0, 1)

# Create rain data
n_drops = 10000
rain_drops = np.zeros(n_drops, dtype=[('position', float, (2,)),])

# Initialize the raindrops in random positions and with random growth rates.
rain_drops['position'] = np.random.uniform(0, 1, (n_drops, 2))

# Construct the scatter which we will update during animation
# as the raindrops develop.
X, Y  = rain_drops['position'][:, 0], rain_drops['position'][:, 1]
colors = ['black' if x else 'blue' for x in (1-X**2)**.5<=Y ]
scat = ax.scatter(X, Y, s=10, lw=0.5, facecolors=colors)
line = ax.plot(np.linspace(0,1,1000), (1-np.linspace(0,1,1000)**2)**.5, color='red')
title = ax.text(0.5,0.2, "", bbox={'facecolor':'white', 'alpha':1, 'pad':5},
                transform=ax.transAxes, ha="center")


def update(frame_number):
    pi = 4*np.sum([1 for x in (Y[:frame_number]<=(1-X[:frame_number]**2)**.5) if x])/frame_number
    # Update the scatter positions and title.
    data = np.hstack((X[:frame_number,np.newaxis], Y[:frame_number, np.newaxis]))
    scat.set_offsets(data)
    title.set_text(f"estimated $\pi$ equales to {pi:.6f} with {frame_number} dots.")
    return scat,title

# Construct the animation, using the update function as the animation director.
animation = FuncAnimation(fig, update, interval=10, blit=True, frames=n_drops)

#FFwriter = FFMpegWriter(fps=60)
#animation.save('animation.mp4', writer=FFwriter)

plt.show()

