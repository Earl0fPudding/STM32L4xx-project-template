# STM32L4xx project template
A project template for developing and flashing code to the STM32L4xx microcontroller. The ´main.c´ file contains a program that simply turns PB0 on and off, so you can hook up an LED or speaker to test if it's flashing correctly.

## Usage
Compile the code using:
´´´
make
´´´
and flash the code using:
´´´
make burn
´´´

## Disclaimer
This code has been tested on the STM32L451 microcontroller. Apparently the libraries used in this project are compatible with all STM32L4xx microcontrollers. However, I recommend you to get the STM32CubeMX software and get the latest libraries for your microcontroller yourself to be on the safe side.

## Requirements
  - make
  - arm-none-eabi-gcc
  - arm-none-eabi-newlib
  - st-link

## Special thanks
I want to thank Matej Blagšič for the Makefile. I altered it so that it works with my STM32L4xx setup.

## License
This code doesn't have any license. Do whatever you want with it but don't blame me if your microcontroller or peripherals get fried or something.
