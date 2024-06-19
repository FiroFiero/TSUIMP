.686
.model flat,stdcall

.stack 100h

.data

X dd 5429
Y dd 7844
Z dd 0AD43h
Q dd 5622
L dd 0
M dd 0
R dd 0


.code ;����: X=5429 Y=7844 Z=AD43 Q=5622

ExitProcess PROTO STDCALL :DWORD
Start:

mov eax, [X] ; ��������� �������� X � ������� eax
inc eax ; ��������� �������� �� 1
mov [X], eax ; ��������� ����� �������� ������� � ������

mov ebx, [Y] ; ��������� �������� Y � ������� ebx
inc ebx ; ��������� �������� �� 1
mov [Y], ebx ; ��������� ����� �������� ������� � ������

mov ecx, [Z] ; ��������� �������� Z � ������� ecx
inc ecx ; ��������� �������� �� 1
mov [Z], ecx ; ��������� ����� �������� ������� � ������

mov edx, [Q] ; ��������� �������� Q � ������� edx
inc edx ; ��������� �������� �� 1
mov [Q], edx ; ��������� ����� �������� ������� � ������

mov eax, [X] ; ��������� ����������� �������� X � ������� eax
add eax, [Y] ; ������� ��� � ����������� ��������� Y
add eax, [Z] ; ������� � ����������� ��������� Z
add eax, [Q] ; ������� ����� � ����������� ��������� Q
mov [L], eax ; ��������� ��������� � ���������� L

mov eax, 0
mov ebx, 0
mov edx, 0
mov ecx, 0

; Compute M = (L & ~X) - (L & ~Y)
mov eax, [L]
not dword ptr [X]
and eax, [X] ; eax = (L & ~X)
mov edx, [L]
not dword ptr [Y]
and edx, [Y] ; edx = (L & ~Y)
sub eax, edx ; eax = (L & ~X) - (L & ~Y)
mov [M], eax

; Compute M = (L & ~X) - (L & ~Y)
mov eax, [L]
not eax
and eax, [X]
mov edx, [L]
not edx
and edx, [Y]
sub eax, edx
mov [M], eax

; Compute M = (L & ~X) - (L & ~Y)
mov eax, [L]
not eax
and eax, [X]
mov edx, [L]
not edx
and edx, [Y]
sub eax, edx
mov [M], eax

; Check condition M >= 921B
cmp eax, 921Bh
jl less_than_921B

; If M >= 921B, compute R = (M / 2) - 12B9
shr eax, 1
sub eax, 12B9h
mov [R], eax
jmp check_even_odd

less_than_921B:
; If M < 921B, compute R = (M - Q') / 2
mov eax, [M]
sub eax, [Q]
shr eax, 1
mov [R], eax


mov eax, 0
mov ebx, 0
mov edx, 0
mov ecx, 0



check_even_odd:
; Check if R is even
test eax, 1
jnz odd ; If odd, jump to odd
jmp evan ; If even, jump to even

odd:
; If R is odd, jump to R - 1
sub eax, 1
jmp exit

evan:
; If R is even, perform (R or 009F)
mov edx, 009Fh
or eax, edx
jmp exit

exit:
invoke ExitProcess, eax

end Start


