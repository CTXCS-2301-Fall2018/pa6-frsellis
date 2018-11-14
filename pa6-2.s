		@---------------------
		@	Programming Assignment 6, Problem 2
		@	Your required header information goes here
		@   FRANK ELLIS, 11/14/18, PA6-2, DIVIDES NUMBERS.
		@--------------------
		@	You are to write a function that performs integer division
		@	Your function must be called div.  It takes two values, a and b passed as parameters,
		@	and should return a/b.  Code is given for you that tests
		@	your program.  Upon successful completion the following values should print
		@	0
		@	1
		@	11
		@	4
		@	5
	.extern printf
        .global main
        .func main
main:		@	DO NOT TOUCH!
		PUSH	{LR}
		MOV	R0, #5
		MOV	R1, #9
		BL	div
		MOV	R1, R0
		LDR	R0, =out
		BL 	printf
		MOV	R0, #9
		MOV	R1, #5
		BL	div
		MOV	R1, R0
		LDR	R0, =out
		BL 	printf
		MOV	R0, #80
		MOV	R1, #7
		BL	div
		MOV	R1, R0
		LDR	R0, =out
		BL 	printf
		MOV	R0, #19
		MOV	R1, #4
		BL	div
		MOV	R1, R0
		LDR	R0, =out
		BL 	printf
		MOV	R0, #60
		MOV	R1, #12
		BL	div
		MOV	R1, R0
		LDR	R0, =out
		BL 	printf
		POP	{PC}

		@---------------------
		@	div function.  Your code goes here!

		@---------------------
div:		PUSH	{LR}	@ Leave this here
        @ Your code here
    MOV R4, R1              @put divisor in r4
    CMP R4, R0, LSL #1      @doubles until 2x r4 > divisor
    div1:
        MOVLS R4, R4, LSL #1
        CMP R4, R0, LSR #1
        BLS div1
        MOV R3, #0          @initialize the quotient

    div2:
        CMP R0, R4          @SUB R4?
        SUBCS R0, R0, R4    @IF YES, THEN
        ADC R3, R3, R3      @DOUBLE QUOTIENT ADD NEW BIT
        MOV R4, R4, LSR #1  @HALF R4
        CMP R4, R1          @LOOP UNTIL DONE
        BHS div2

		MOV R0, R3

		POP	{PC} 	@ return statement
.data
out:	.asciz "%d\n"	@ String for printf
