.model tiny
.486
.data
alph1 db "abca"
cnt1 db 
res db 
.code 
.startup
	lea si,loc1
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