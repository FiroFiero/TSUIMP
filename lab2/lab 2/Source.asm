.686 
.model flat,stdcall 
 
.stack 100h 
 
.data 
 
.code ;Дано: X=5429 Y=7844 Z=AD43 Q=5622

ExitProcess PROTO STDCALL :DWORD 
Start: 

MOV AX, 5429
MOV BX, 7844
MOV CX, AD43h
MOV DX, 5622

ADD AX, 1
ADD BX, 1
ADD CX, 1
ADD DX, 1

ADD AX, BX
ADD AX, CX
ADD AX, DX

HLT

exit: 
Invoke ExitProcess,1 
End Start 