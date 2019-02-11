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

@R0
M=1 //R0=1
@8192
D=A
@n
M=D //all screen
@i
M=0 //i=0
(INFINITELOOP)
@R0
D=M
@END
D;JEQ
@KBD
D=M
@NOKEYPRESSED
D;JEQ
//Blacken all screen
@SCREEN
D=A
@address
M=D //address = 16384
(LOOPBLACKSCREEN)
@i
D=M
@n
D=D-M
@ENDBLACKSCREEN
D;JGE
@address
A=M
M=-1
@i
M=M+1
@address
M=M+1
@LOOPBLACKSCREEN
(ENDBLACKSCREEN)
//Consider do something here - reset i
@i
M=0 //i=0

(NOKEYPRESSED)
//whiten all screen
@SCREEN
D=A
@address
M=D //address = 16384
(LOOPWHITESCREEN)
@i
D=M	
@n
D=D-M
@ENDWHITESCREEN
D;JGE
@address
A=M
M=0
@i
M=M+1
@address
M=M+1
@LOOPWHITESCREEN
(ENDWHITESCREEN)
////Consider do something here - reset i
@i
M=0 //i=0

@INFINITELOOP
0;JMP

(END)
@END
0;JMP
