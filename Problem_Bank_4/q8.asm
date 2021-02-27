.model tiny
.486
.data
ARRAY db 02h,03h,01h,05h,09h
COUNT db 5
.code
.startup
	lea si,ARRAY
	mov cl,COUNT
	mov ch,COUNT
	dec cl
	dec ch
x1: mov al,[si]
	cmp al,[si+1]
	JL  x2
	mov bl,[si+1]
	mov [si],bl
	mov [si+1],al
x2: inc si
	dec cl
	jnz x1
x3: lea si,ARRAY
	mov cl,COUNT
	dec cl 
	dec ch
	jnz x1
.exit
end