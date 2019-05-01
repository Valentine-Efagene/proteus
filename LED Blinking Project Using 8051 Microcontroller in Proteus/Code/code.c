#include<reg51.h>

// LED Pin
sbit LED = P1^0;		   // Pin P1.0 is named as LED

//Function declarations
void cct_init(void);
void delay(int a);


int main(void)
{
   cct_init();   	       // Make all ports zero
 
   while(1)
   {
	   LED = 0;	           // Pin P1.0 Low
       delay(30000);	   // Half sec delay
       LED = 1;			   // Pin P1.0 High
       delay(30000);	   // Half sec delay
   }
}

void cct_init(void)
{
P0 = 0x00;   
P1 = 0x00;   
P2 = 0x00;   
P3 = 0x00;  
}

void delay(int a)
{
   int i;
   for(i=0;i<a;i++);   //null statement
}

