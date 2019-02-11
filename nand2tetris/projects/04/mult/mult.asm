// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
//i=0 -->Counter
@i
M=0

//sum=0
@sum
M=0

//m=R0
@R0
D=M
//if R0==0 -->sum=0, stop
@STOP
D;JEQ
@m
M=D
//n=R1
@R1
D=M
//if R1==0 -->sum=0, stop
@STOP
D;JEQ
@n
M=D

(LOOP)
@i
D=M
@n
D=D-M
@STOP
D;JGE //if i>=n goto STOP
//Sum up
@sum
D=M
@m
D=D+M
@sum
M=D
@i
M=M+1
@LOOP
0;JMP
//STOP
(STOP)
@sum
D=M
@R2
M=D //R2=R0*R1

(END)
@END
0;JMP

