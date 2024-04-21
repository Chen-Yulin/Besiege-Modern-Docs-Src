---
sidebar_position: 1
---
# Unit

Unit is the logic block that have pins, thus can be recoginzed by the circuit board.

Usually, it has solid dark base.

![unit](./img/unit.png)


## Off-board / On-board Mode

Some of the units have off-board mode, i.e. they can be placed anywhere to complete their task.

When configured as off-board, the unit will hide their physical pins and receive/send wireless signal.

![on-board](./img/on-board.png)
![off-board](./img/off-board.png)

Take off-board mode of `Pose Sensor` as example, when configured as off-board, there will be a mapper called `Send Channel`, specifying the channel through which the wireless signal is transmitted (will be discussed later in the `Wireless` chapter).

## Behaviour

### Logic units

When the signal from input/control pins changed, they will update the signals at output pins immediately (the update can happen multiple times per frame, **dangerous**, wasn't it)

### Sensors

For each physical frame (every 0.01s), read the sensor configuration signals from input pins and generate outputs.

:::tip[Notation]
For many sensors, the ouput signal's type is `package`, containing multiple data. For example, IMU will ouput the package signal containing velocity (vector3), acceleration (vector3), angular velocity (vector3) and a place holder(null). You need to use `UNPACKER` to extract the information you want.
:::

### Executors

For each physical frame (every 0.01s), read the signals from input pins and perform the action, such as press a key, move to a certain angle, display something.

:::tip[Notation]
Similar with sensors, some of the executors receive `package` type input signal.
:::
