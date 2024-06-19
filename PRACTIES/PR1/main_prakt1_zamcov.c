#include <8051.h>      
void main()        
{ 
int i; 
char xdata *ptr;     
char test, nabor; 
nabor = 0x0FF;      
ptr = (char xdata *) 0x1200; 
for(i=0; i<1024;i++)    
{
*ptr=nabor;         
test=*ptr;         
if(test!=nabor) 
{ 
break;          
} 
ptr++; 
} 
} 

