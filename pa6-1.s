		@---------------------
		@	Programming Assignment 6, Problem 1
		@	Your required header information goes here
		@ Frank Ellis. pa6. 11/10/18.
		@---------------------
		@ In those you will use the provided function pow to comput
		@ a^b - 3a
		@ You must set up the arguments to pow and call it using BL
		@ The result should be in R4 after the program completes
	.extern printf
	.global	main
	.func main
main:	PUSH {LR}
	@	Your code goes here
    LDR R0, =a
    LDR R0, [R0]        @Takes the number saved in a and places it in r0
    LDR R1, =b
    LDR R1, [R1]        @Takes the number saved in b and places it in r1
    BL pow              @Runs the power function
    MOV R2, #3          @Places 3 in r2
    LDR R4, =a
    LDR R4, [R4]        @loads the value in a into r4
    MUL R3, R2, R4      @3*a
    SUB R4, R0, R3      @a^b-3*a

	@ Code to print your answer.  DO NOT CHANGE!
	LDR	R0, =out
	MOV	R1, R4
	BL 	printf
	POP	{PC}

	@---------------------
	@  pow function.  DO NOT CHANGE!
	@---------------------
pow:	PUSH		{LR}
	PUSH		{R4-R6}
	MOV		R4, R1
	MOV		R5, #1
loop:	CMP		R4, #0
	BEQ		exit
	MUL		R5, R0, R5
	SUB		R4, R4, #1
	BAL		loop
exit:	MOV		R0, R5
	POP		{R4-R6}
	POP		{PC}

.data
a:	.word	3
b:	.word	4
out:	.asciz "Answer: %d\n"
