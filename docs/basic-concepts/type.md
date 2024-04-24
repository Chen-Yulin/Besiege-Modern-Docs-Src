---
sidebar_position: 4
---
# Data Type

The table for the data type in this mod.

| Type | Applicable | Detail |
| ------------- | -------------- | -------------- |
| `null`| signal | Indicating that no signal is generated |
| `bool`| signal & port | boolen `true` or `false` |
| `float` | signal & port | number(single-precision), like `114.514`, `-191.0`|
| `vector2` | signal & port | 2D vector, \{x(`float`), y(`float`)\} |
| `vector3` | signal & port | 3D vector, \{x(`float`), y(`float`), z(`float`)\} |
| `quaternion` | signal & port | representing rotation of object, \{w(`float`), i(`float`), j(`float`), k(`float`)\} |
| `package` | signal & port | a set of four signal, \{signal1(`any`), signal2(`any`), signal3(`any`), signal4(`any`)\} |
| `any`| port | Indicating that all type of signal can be contained |
