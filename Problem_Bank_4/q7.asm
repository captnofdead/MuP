.model tiny
.486
.data
ARRAY db 12h,21h,21h,21h,09h
COUNT db 5
CODE1 db 21h
RESULT db ?
.code
.startup
	lea si,ARRAY
	mov cl,COUNT
	mov al,CODE1
	mov bl,00
x1: cmp al,[si]
	jne x2
	inc bl
x2: inc si
	dec cl
	jnz x1 
	mov RESULT,bl
	
	
	

.exit
end