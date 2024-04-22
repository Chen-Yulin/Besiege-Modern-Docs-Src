---
sidebar_position: 3
---
# Timing

Timing is a very critical part of this mod that nedds special attention.

There are generally two kinds of unit in this mod, `Immediate Unit` & `Trigger Unit`.
- Immediate Unit: the unit is updated (regenerate output) immediately when the input signals are updated. The speed of deduction of a series of immediate units is zero theoretically in game world.
- Trigger Unit: the unit is updated in each physical frame (100hz). Most of them are sensors, mainly responsible to trigger the update of other immediate unit.

Those two concepts maybe abstract. Let me explain it through some exapmles.

**Example 1:**
Let consider the following simple logic circuit, there are three trigger unit and two immediate unit.
At the beginning, no signal is passing among these units.
```mermaid
block-beta
columns 5
    CONST1("CONST1 [float 1.0]") space ALU("ALU [float +]") space space
    CONST2("CONST2 [float 2.0]") space CONST3("CONST3 [float 3.0]") space IF("IF [float ==]")
style CONST1 fill:#aa3,stroke:#333,stroke-width:4px
style CONST2 fill:#aa3,stroke:#333,stroke-width:4px
style CONST3 fill:#aa3,stroke:#333,stroke-width:4px
style ALU fill:#55e,stroke:#333,stroke-width:4px
style IF fill:#55e,stroke:#333,stroke-width:4px


CONST1--"null"-->ALU
CONST2--"null"-->ALU
CONST3--"null"-->IF
ALU--"null"-->IF
```

On the first frame, three trigger units (`CONST`) generate float signal at output ports one by one.
:::note
The order of generating outputs can be totally random. Here we use the order of CONST1->CONST3->CONST2
:::
Begin with CONST1:
```mermaid
block-beta
columns 5
    CONST1("CONST1 [float 1.0]") space ALU("ALU [float +]") space space
    CONST2("CONST2 [float 2.0]") space CONST3("CONST3 [float 3.0]") space IF("IF [float ==]")
style CONST1 fill:#aa3,stroke:#333,stroke-width:4px
style CONST2 fill:#aa3,stroke:#333,stroke-width:4px
style CONST3 fill:#aa3,stroke:#333,stroke-width:4px
style ALU fill:#55e,stroke:#333,stroke-width:4px
style IF fill:#55e,stroke:#333,stroke-width:4px


CONST1--"float 1.0"-->ALU
CONST2--"null"-->ALU
CONST3--"null"-->IF
ALU--"null"-->IF
```
Because of the update in the first input port, ALU's update function is called. However, the second input of ALU is `null`, so ALU generate `null` at output port. Nothing is changed and IF is not affected.

Then comes CONST3's turn:
```mermaid
block-beta
columns 5
    CONST1("CONST1 [float 1.0]") space ALU("ALU [float +]") space space
    CONST2("CONST2 [float 2.0]") space CONST3("CONST3 [float 3.0]") space IF("IF [float ==]")
style CONST1 fill:#aa3,stroke:#333,stroke-width:4px
style CONST2 fill:#aa3,stroke:#333,stroke-width:4px
style CONST3 fill:#aa3,stroke:#333,stroke-width:4px
style ALU fill:#55e,stroke:#333,stroke-width:4px
style IF fill:#55e,stroke:#333,stroke-width:4px


CONST1--"float 1.0"-->ALU
CONST2--"null"-->ALU
CONST3--"float 3.0"-->IF
ALU--"null"-->IF
```
Because the first input of IF is `null`, IF generate `null` at output port. Nothing is changed.

Finally comes CONST2's turn:
```mermaid
block-beta
columns 5
    CONST1("CONST1 [float 1.0]") space ALU("ALU [float +]") space space
    CONST2("CONST2 [float 2.0]") space CONST3("CONST3 [float 3.0]") space IF("IF [float ==]")
style CONST1 fill:#aa3,stroke:#333,stroke-width:4px
style CONST2 fill:#aa3,stroke:#333,stroke-width:4px
style CONST3 fill:#aa3,stroke:#333,stroke-width:4px
style ALU fill:#55e,stroke:#333,stroke-width:4px
style IF fill:#55e,stroke:#333,stroke-width:4px


CONST1--"float 1.0"-->ALU
CONST2--"float 2.0"-->ALU
CONST3--"float 3.0"-->IF
ALU--"null"-->IF
```
Because of the update in the second input port, ALU's update function is called. ALU generate `float 3.0` at output port.
```mermaid
block-beta
columns 5
    CONST1("CONST1 [float 1.0]") space ALU("ALU [float +]") space space
    CONST2("CONST2 [float 2.0]") space CONST3("CONST3 [float 3.0]") space IF("IF [float ==]")
style CONST1 fill:#aa3,stroke:#333,stroke-width:4px
style CONST2 fill:#aa3,stroke:#333,stroke-width:4px
style CONST3 fill:#aa3,stroke:#333,stroke-width:4px
style ALU fill:#55e,stroke:#333,stroke-width:4px
style IF fill:#55e,stroke:#333,stroke-width:4px


CONST1--"float 1.0"-->ALU
CONST2--"float 2.0"-->ALU
CONST3--"float 3.0"-->IF
ALU--"float 3.0"-->IF
```
Because of the update in the first input port, IF's update function is called. IF generate `true` at output port.

:::note
As soon as all the trigger units have updated the output, the circuit is bound to generate all the related outputs.
:::
