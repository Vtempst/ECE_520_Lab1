# ECE_520_Lab1

## Overview

The lab consist of two parts:

1. Designing a module that blinks an LED on the Zybo Z7 development board that has a reset button and enable switch.
2. Designing a module that controls the on-board RGB LED using switches to select between red, green, and blue.

Both parts includes a test bench that showcases a simulation/waveforms. The constraint file is provided as well that map out the I/O to the board.


## Design Summary

The blinking LED module toggles the LED every 0.5 seconds, which results in the LED to blink once every second. The blinking led module has a reset and enable input. 

The RGB module involves instantiating the blinking led module. In addition, the constraints of the RGB module is that only one switch should be active at a time and if multiple switches are enabled at the same time, then the RGB LED is off. 

## Verification

Aside from hardware testing, a test bench was used to verify the design for both blinking led and rgb.

The waveform bellow is the simulation for blinking led. It shows the test cases: reset behavior, disabled output, and LED toggling.

![Blinking LED waveform](lab1_waveforms\blinking_led_waveform.png)

Similarly, the waveform bellow showcases every possible testcase. It reveals that the corresponding rgb output bit is active high when the corresponding switch is active high. It also exhibits that the rgb output is active low when two switches are active high. The waveform also reveals that the rgb output is active low when the reset switch is active high or when the enable switch is active low.

![Blinking LED waveform](lab1_waveforms\rgb_waveform.png)

## Known Issues or Limitations:

The waveform shows that the RGB bits are blinking but in short period of time.

## References

N/A