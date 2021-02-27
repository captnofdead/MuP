.model tiny
.486
.data
ARRAY db 45h,89h,27h,0F2h,3Eh
COUNT db 5
RESULT db 5 DUP ('N')
.code
.startup
	lea si,ARRAY
	mov cl,COUNT
	lea di,RESULT
x1: mov al,[si]
	mov bl,al
	and bl,0Fh
	mov cl,04h
	shr al,cl
	mov bh,al
	add bl,bh
	jc x2
	mov ah,'C'
	mov [di],ah
x2: inc si
	inc di
	dec cl
	jnz x1
.exit
end