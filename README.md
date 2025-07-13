# 🐸 Frogger Game on ARM Microcontroller

This project is a complete implementation of the classic Frogger game developed in C using MikroC PRO for ARM. Designed to run in a resource-constrained embedded environment, it showcases a wide range of hardware features including real-time graphics, sound output, joystick control, and analog input.

## 🎮 Features

- Classic Frogger-style gameplay with multiple levels
- Real-time graphics and screen transitions
- Sound effects via speaker output
- Joystick input handling for player movement
- Dynamic difficulty adjustment via a Potentiometer — game speed increases or decreases based on analog voltage read through the microcontroller’s ADC (Analog-to-Digital Converter)

## 🛠️ Project Structure

The project is organized into the following folders:

- `src/`: Assembly source files for game logic and hardware interaction
- `include/`: Header files, if used
- `config/`: IDE and toolchain configuration files (e.g., `.bmk`, `.brk`)
- `tools/`: Additional tool-specific or flashing support files
- `docs/`: Optional documentation and notes

## 🧰 Requirements

- ARM Microcontroller
- [MikroC PRO for ARM](https://www.mikroe.com/mikroc-arm) or a compatible development toolchain
- Programmer/debugger (e.g., MikroProg, ST-Link)
- Joystick module for directional input
- Speaker or buzzer for audio output
- Potentiometer for ADC-based speed control
- Basic display (e.g., LED matrix or LCD screen)

## ⚙️ How to Build and Run

1. Open the project in MikroC PRO for ARM (or compatible IDE).
2. Set the correct device and clock configuration for your microcontroller.
3. Compile the project to generate a `.hex` or `.bin` file.
4. Use your programmer/debugger to flash the file to your microcontroller.
5. Connect the joystick, speaker, and variable resistor as described.
6. Power on and play!
