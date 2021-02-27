; same location doubt
.model tiny
.486
.data
arrayw dd 12345678h
count db 4
arrayd dd 4 DUP (0) 
res db 0
.code 
.startup
	lea si,arrayw+3
	lea di,arrayd
	mov cl,COUNT
x1: mov al,[si]
	mov [di],al
	inc di
	dec si
	dec cl
	jnz x1
.exit
end