---
sidebar_position: 2
---

# STEERING HINGE

![hinge](./img/hinge.png)

Precise angular motion output.

## INPUT

No wireless mode and no `on-board` port is avaliable. Need to use INPUTPIN to receive input signal.

Place a INPUTPIN on the hinge and use WIRE to connect it will a OUTPUTPIN, signal type must be `float`.

![hinge connect](./img/hingeconnect.png)

## Function

When receive the `float` signal, the hinge will rotate to the desired angle (along the y-axis (green arrow)).

![rotate 1](./img/hingerotate.png)
![rotate 2](./img/hingerotate2.png)
![rotate 3](./img/hingerotate3.png)
