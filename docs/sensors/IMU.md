---
sidebar_position: 3
---

# IMU


Generate `package` signal indicating the motion information of the unit.

Wireless feature is supported when `off-board`.

## Output

The output's type is `packge`, containing three valid data.
- `velocity`, with type of `vector3`, is a 3D vector pointing velocity of the sensor.
- `acceleration`, with type of `vector3`, is a 3D vector pointing the acceleration of the sensor.
- `angular velocity`, with type of `vector3`, the axis setting is the same as [POSE SENSOR](https://chen-yulin.github.io/Besiege-Modern-Docs/docs/sensors/POSESENSOR)
- - the x value is the rotating velocity along x-axis
- - the y value is the rotating velocity along y-axis
- - the z value is the rotating velocity along z-axis

:::note
The order of these three data in output package is fixed
:::
