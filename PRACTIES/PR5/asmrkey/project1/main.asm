$MOD51	; This includes 8051 definitions for the Metalink assembler

; Please insert your code here.

org 0000h
		ljmp main

org 0030h

main:	mov A, #38h
		acall cmd
		acall dly
		mov A, #0Eh
		acall cmd
		acall dly
		mov P3, #0FFh

again:	acall dly
		acall chkr1
		acall dly
		acall chkr2
		acall dly
		acall chkr3
		acall dly
		acall chkr4
		sjmp again

cmd:	mov P2, A
		clr P0.1
		clr	P0.2
		setb P0.0
		clr P0.0
		ret

dsp:	mov P2, A
		setb P0.1
		clr P0.2
		setb P0.0
		clr P0.0
		ret

dly:	mov R2, #10
bck:	djnz R2, bck
		ret

chkr1:	clr P3.0
		acall dly
		jb P1.0, nxt
		mov A, #'7'
		acall dsp


nxt:	jb P1.1, nxt1
		mov A, #'8'
		acall dsp
nxt1:	jb P1.2, nxt2
		mov A, #'9'
		acall dsp
nxt2:	setb P3.0
		ret

chkr2:	clr P3.1
		acall dly
		jb P1.0, nxt3
		mov A, #'4'
		acall dsp
nxt3:	jb P1.1, nxt4
		mov A, #'5'
		acall dsp
nxt4:	jb P1.2, nxt5
		mov A, #'6'
		acall dsp
nxt5:	setb P3.1
		ret

chkr3:	clr P3.2
		acall dly
		jb P1.0, nxt6
		mov A, #'1'
		acall dsp
nxt6:	jb P1.1, nxt7
		mov A, #'2'
		acall dsp
nxt7:	jb P1.2, nxt8
		mov A, #'3'
		acall dsp
nxt8:	setb P3.2
		ret
chkr4:	clr P3.3
		acall dly
		jb P1.1, nxt9
		mov A, #'0'
		acall dsp
nxt9:	setb P3.3
		ret

END