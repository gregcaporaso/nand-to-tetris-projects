// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// i = 0
@i
M = 0

(LOOP)
// if i == 8000
@i
D = M
@8000
D = A - D
@WORK
D;JGT

// i = 0, b/c i == 8000
@i
M = D

(WORK)
// key is pressed
@KBD
D = M
@FILL
D;JGT

// clear the screen b/c a key isn't pressed
(CLEAR)
@i
D = M
@SCREEN
A = D + A
M = 0

@i
M = M + 1

@LOOP
0;JMP

// fill the screen
(FILL)
@i
D = M
@SCREEN
A = D + A
M = -1

@i
M = M + 1

@LOOP
0;JMP