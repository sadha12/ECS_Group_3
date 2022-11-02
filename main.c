/*
 * Programming Assignment - ECS - Autumn 2022-23
 ; C Code
 ; Functionality of the code:
 ; The program reads from 4 pins of PORTC (4 LSB pins),Based on the 4 bit value read from PORTC,
 ; certain ASCII values (‘Zero’, ‘One, ‘Two',……,’Fifteen’ corresponding to 0000, 0001, 0010,….1111)
 ; are placed in RAM locations starting at $180. The programs uses a stack whose stack pointer
 ; has been initialized at memory location $180.
 *
 * Created: 02-11-2022 21:07:03
 * Author : Group 3
 */ 

#include <avr/io.h>


int main(void)
{
    /* Replace with your application code */
    unsigned char *p=0x180;					//Defining pointer at location $180 to store variable
	unsigned char temp;				
	while(1)
	{
	DDRC= 0xFF;								//Setting PORTC to output to emulate  user input
	PORTC= 0X01;							//Sending values to PORTC
	DDRC= 0X00;								//Setting PINC as input
	
	temp = PINC;							//Getting values from PINC
	
	switch(temp)							//Performing switch case
	{
	case(0):		
	{
	*p='Z'|'e'|'r'|'o';						//Storing ASCII value of corresponding
	p=p+1;									//Incrementing Pointer to store the next output at next memory location
	break;									//Break to get next input
	}
	
	//similarly checking for other cases
	case(1):
	{
	*p='O'|'n'|'e';
	p=p+1;
	break;
	}
	
	case(2):
	{
	*p='T'|'w'|'o';
	p=p+1;
	break;
	}
	
	case(3):
	{
	*p='T'|'h'|'r'|'e'|'e';
	p=p+1;
	break;
	}
	
	case(4):
	{
	*p='F'|'o'|'u'|'r';
	p=p+1;
	break;
	}
	
	case(5):
	{
	*p='F'|'i'|'v'|'e';
	p=p+1;
	break;
	}
	
	case(6):
	{
	*p='S'|'i'|'x';
	p=p+1;
	break;
	}
	
	case(7):
	{
	*p='S'|'e'|'v'|'e'|'n';
	p=p+1;
	break;
	}
	
	case(8):
	{
	*p='E'|'i'|'g'|'h'|'t';
	p=p+1;
	break;
	}
	
	case(9):
	{
	*p='N'|'i'|'n'|'e';
	p=p+1;
	break;
	}
	
	case(10):
	{
	*p='T'|'e'|'n';
	p=p+1;
	break;
	}
	
	case(11):
	{
	*p='E'|'l'|'e'|'v'|'e'|'n';
	p=p+1;
	break;
	}
	
	case(12):
	{
	*p='T'|'w'|'e'|'l'|'v'|'e';
	p=p+1;
	break;
	}
	
	case(13):
	{
	*p='T'|'h'|'i'|'r'|'t'|'e'|'e'|'n';
	p=p+1;
	break;
	}
	
	case(14):
	{
	*p='F'|'o'|'u'|'r'|'t'|'e'|'e'|'n';
	p=p+1;
	break;
	}
	
	case(15):
	{
	*p='F'|'i'|'f'|'t'|'e'|'e'|'n';
	p=p+1;
	break;
	}
	}
	}
}

