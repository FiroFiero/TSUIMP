.686
.model flat,stdcall

.stack 100h

.data 

X dw 15
Y dw 79
Z dw 81
M dw ?

.code ;�������� ���, ��� M = ((X+Y)/4) ��� (Z-Y-X)
ExitProcess PROTO STDCALL :DWORD
Start: 

MOV AX, X ;���������� � �������
ADD AX, Y ;���������� ������� Y � �������� � �������� AX
MOV BX, Z

SUB BX, Y ;��������� �������� Y �� �������� � �������� BX(Z)
SUB BX, X

ADD AX, BX ;���������� �������� � ���������

SAR AX, 2 ;���������� ������ ��� ������� �� 4

MOV M, AX ;��������� ���������� � ��������

exit:
Invoke ExitProcess, M;
End Start