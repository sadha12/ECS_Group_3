;
; Programming Assignment - ECS - Autumn 2022-23
;
; Functionality of the code:
; The program reads from 4 pins of PORTC (4 LSB pins),Based on the 4 bit value read from PORTC, 
; certain ASCII values (‘Zero’, ‘One, ‘Two',……,’Fifteen’ corresponding to 0000, 0001, 0010,….1111) 
; are placed in RAM locations starting at $180. The programs uses a stack whose stack pointer 
; has been initialized at memory location $180.

; Created: 29-10-2022 18:48:04
; Author : Group 3
;



.INCLUDE "M32DEF.INC"
.ORG 0

.EQU REQADD =$180;	    ;Defining required start location

LDI R16, HIGH(REQADD)   ;load SPH
OUT SPH, R16;		    ;Initializing High bit of SP

LDI R16, LOW(REQADD)    ;load SPL
OUT SPL, R16;			;Initializing High bit of SP

START:
						;Simulating presence of user by giving inputs to PINS of PORTC
LDI R16,$0F;			;Setting last 4 pins of PORTC to output
OUT DDRC,R16;			

LDI	R16,$0E;			;Giving 14 as input
OUT	PORTC,R16;			

LDI R16,$F0;			;Setting last 4pins of PORTC to input to read the values from switches
OUT DDRC,R16;

IN R16,PINC;			;Store the values of PINC to R16 register

CPI	R16,0				;Comparing the value of R16 with each number 0,1,....15			
BREQ L0					;Branch to the corresponding case to store ASCII values at RAM location
BRNE NXT1
L0: JMP CASE0

NXT1:CPI R16,1
BREQ L1
BRNE NXT2
L1: JMP CASE1

NXT2:CPI	R16,2
BREQ L2
BRNE NXT3
L2: JMP CASE2

NXT3:CPI	R16,3
BREQ L3
BRNE NXT4
L3: JMP CASE0

NXT4:CPI	R16,4
BREQ L4					;BREQ branching was out of range, 
BRNE NXT5
L4: JMP CASE4			;so JMP was used to branch to the corresponding case

NXT5:CPI	R16,5
BREQ L5
BRNE NXT6 
L5: JMP CASE5

NXT6:CPI	R16,6
BREQ L6
BRNE NXT7
L6: JMP CASE6

NXT7:CPI	R16,7
BREQ L7
BRNE NXT8
L7: JMP CASE7

NXT8:CPI	R16,8
BREQ L8
BRNE NXT9
L8: JMP CASE8

NXT9:CPI	R16,9
BREQ L9
BRNE NXT10
L9: JMP CASE9

NXT10:CPI	R16,10
BREQ L10
BRNE NXT11
L10: JMP CASE10

NXT11:CPI	R16,11
BREQ L11
BRNE NXT12
L11: JMP CASE11

NXT12:CPI	R16,12
BREQ L12
BRNE NXT13
L12: JMP CASE12

NXT13:CPI	R16,13
BREQ L13
BRNE NXT14
L13: JMP CASE13

NXT14:CPI	R16,14
BREQ L14 
BRNE NXT15
L14: JMP CASE14

NXT15:CPI	R16,15
BREQ L15 
L15: JMP CASE15

CASE0:	LDI	R18,'Z'		;Storing ASCII of first character of 'Zero', 'Z' to R18 register
		ORI	R18,'e'		;Using 'OR' to get ASCII of entire word
		ORI	R18,'r'
		ORI	R18,'o'
		JMP	STORE		;JUMP to store the acquired ASCII to the stack

;Similarly for other cases....
CASE1:	LDI	R18,'O'
		ORI	R18,'n'
		ORI	R18,'e'

CASE2:	LDI	R18,'T'
		ORI	R18,'w'
		ORI	R18,'o'
		JMP	STORE

CASE3:	LDI	R18,'T'
		ORI	R18,'h'
		ORI	R18,'r'
		ORI	R18,'e'
		ORI	R18,'e'
		JMP	STORE

CASE4:	LDI	R18,'F'
		ORI	R18,'o'
		ORI	R18,'u'
		ORI	R18,'r'
		JMP	STORE

CASE5:	LDI	R18,'F'
		ORI	R18,'i'
		ORI	R18,'v'
		ORI	R18,'e'
		JMP	STORE

CASE6:	LDI	R18,'S'
		ORI	R18,'i'
		ORI	R18,'x'
		JMP	STORE

CASE7:	LDI	R18,'S'
		ORI	R18,'e'
		ORI	R18,'v'
		ORI	R18,'e'
		ORI	R18,'n'
		JMP	STORE

CASE8:	LDI	R18,'E'
		ORI	R18,'i'
		ORI	R18,'g'
		ORI	R18,'h'
		ORI	R18,'t'
		JMP	STORE

CASE9:	LDI	R18,'N'
		ORI	R18,'i'
		ORI	R18,'n'
		ORI	R18,'e'
		JMP	STORE

CASE10:	LDI	R18,'T'
		ORI	R18,'e'
		ORI	R18,'n'
		JMP	STORE

CASE11:	LDI	R18,'E'
		ORI	R18,'l'
		ORI	R18,'e'
		ORI	R18,'v'
		ORI	R18,'e'
		ORI	R18,'n'
		JMP	STORE

CASE12:	LDI	R18,'T'
		ORI	R18,'w'
		ORI	R18,'e'
		ORI	R18,'l'
		ORI	R18,'v'
		ORI	R18,'e'
		JMP	STORE

CASE13:	LDI	R18,'T'
		ORI	R18,'h'
		ORI	R18,'i'
		ORI	R18,'r'
		ORI	R18,'t'
		ORI	R18,'e'
		ORI	R18,'e'
		ORI	R18,'n'
		JMP	STORE

CASE14:	LDI	R18,'F'
		ORI	R18,'o'
		ORI	R18,'u'
		ORI	R18,'r'
		ORI	R18,'t'
		ORI	R18,'e'
		ORI	R18,'e'
		ORI	R18,'n'
		JMP	STORE

CASE15:	LDI	R18,'F'
		ORI	R18,'i'
		ORI	R18,'f'
		ORI	R18,'t'
		ORI	R18,'e'
		ORI	R18,'e'
		ORI	R18,'n'

STORE:	PUSH R18;		;Pushing corresponding ASCII value to the stack

JMP	START;				;JUMP to start to get the next set of input