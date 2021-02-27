.model tiny
.486
.data
loc1 dw 'abcdef'
count db 7
arrayd dd 4 DUP (0) 
res db 'y'
.code 
.startup
	lea si,loc1+6
	lea di,loc1
x1: mov al,[si]
	cmp al,[di]
	jne x2
	inc di
	dec si
	mov bx,si
	cmp bx,di
	jge x1 
	jmp x3
x2: mov al,'n'
	mov res,al
x3: nop
.exit
end