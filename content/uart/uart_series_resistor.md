title: UART series resistor
description: What is the purpose of series resistor in UART? Is it really needed?
date: 2019-01-07
tags: ["UART", "resistor", "current limiting"]
categories: ["UART"]
+++

In some circuit diagrams, you would have noticed a series resistor on TX and RX pins of UART. In this post,
we will discuss:

* Purpose of the series resistor
* Are they necessary?
* Typical values

# Purpose of the series resistor

## Current limiting

The main purpose of series resistor is to limit current flowing through it if there is a shorting. A shorting would not occur
in UART in a normal setup. However if more than one TX is connected to the same RX, the two TXs will try to fight eachother. If one TX writes
high and the other writes low, this will result in a short circuit.

Throwing in a resistor limits the current and protects the chips.

## ESD protection

Another reason to add a series resistor is to protect against ESD.

## Reducing EMC

If the UART lines are carrying a high frequency signal, this might lead to emission of electromagnetic signals. If there are other EMC sensitive circuit or devices nearby, this might affect them. Addition of a small series resistor will decrease the slew rate and hence reduce EMC emission.

# Are they necessary?

Strictly speaking current limiting resistors are not needed for the operation of UART, especially if there are only two UARTs devices connected to eachother and they are on the same board.

For systems where more than one TX is connected together, adding a current limiting series resistor is very advisable. This is also the case, if the TX pin is connected to header pin or conditions where ESD might be a problem.

# Typical values

For 3.3V, a 1KOhm resistor will suffice. It will result in a current of 3.3 mA.

# Slew rate

Do note that, addition of a series resistor will reduce the slew rate of the UART signal. This will become a problem only at high baudrates. A lower value resistor can picked to solve this issue.
