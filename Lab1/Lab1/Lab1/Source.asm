.686
.model flat,stdcall

.stack 100h

.data 

X dw 15
Y dw 79
Z dw 81
M dw ?

.code ;написать код, где M = ((X+Y)/4) или (Z-Y-X)
ExitProcess PROTO STDCALL :DWORD
Start: 

MOV AX, X ;добавление в регистр
ADD AX, Y ;добавление значеия Y к значению в регистре AX
MOV BX, Z

SUB BX, Y ;вычитание значения Y из значения в регистре BX(Z)
SUB BX, X

ADD AX, BX ;добавление значения в регистрах

SAR AX, 2 ;добавление сдвига для деления на 4

MOV M, AX ;сохраняем переменную в регистре

exit:
Invoke ExitProcess, M;
End Start