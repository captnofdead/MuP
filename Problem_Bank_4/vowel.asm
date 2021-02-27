.model tiny
.486
.data
ARRAY1 db "avi wadhwa trtptu oe"
vowela db "aeiou"
COUNT db 20
COUNT2 db 5
res db 0
.code
.startup
	lea si,ARRAY1
	lea di,vowela
	mov cl,COUNT
	mov ch,COUNT2
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