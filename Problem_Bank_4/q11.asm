.model tiny
.486
.data
ARRAY1 dd 12345678h
RES db ?
res db 0
.code
.startup
	lea si,ARRAY1
	lea di,RES
	mov bl,00
x1: mov al,[si]
	cmp al,[di]
	jne x2
	INC bl
x2:	inc di
	dec ch
	jnz x1
x3: inc si
	mov ch,COUNT2
	lea di,vowela
	dec cl
	jnz x1
	mov res,bl
.exit
end