# chip8-on-blackboard

The main aim of this project is to re-create the CHIP-8 console on the Real Digital Blackboard FPGA Board. This involves writing cores relating to decoding the numpad, creating a processor that can read program instructions from memory and process them. 

This will mainly be based off this [technical reference](http://devernay.free.fr/hacks/chip8/C8TECH10.HTM) 
# Features


- Decoder for the 4x4 matrix number pad
- Custom VGA Controller for the Controller to enlargen the 64x32 image to 640x320
- Make a CPU for the instruction set, using Harvard Architecture to allow for pipelining 
- Use the onboard ARM chip to load ROMs at runtime from an attached microSD card 

# Stage 1

The first stage will be involve creating the external components to interface with the main console. At this stage, it is mainly about building these components so they meet a more general specification that can be easily observed at this point and then later on, tailoring them further to meet the CHIP-8's needs.

## To-Do List

Main Goals of Substage:
    [x] Decoding the 4x4 Matrix Keypad so it appears on the Seven Segment display.
    [ ] Establishing a display that changes based on the inputs of the buttons on the board
    [ ] `

The second stage is 
