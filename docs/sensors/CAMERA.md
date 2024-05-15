---
sidebar_position: 5
---

# CAMERA SENSOR

Get visual image signal.

## Property

There are three sliders:
- `Horizontal resolution`: the width of the output image's signal
- `Vertical resolution`: the height of the output image's signal
- `Default FOV`: the default FOV of the camera, i.e. no input signal

## Input

The input signal should be `float` type. This input is used for adjusting the FOV(field of view) of the camera.

## Output

The output's type is `image`, with the desired resolution.

:::warning
The far clip plane of the camera is 8000m, i.e. the camera can only see objects within 8000m.
:::
