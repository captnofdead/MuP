.model tiny
.486
.data
ARRAY1	db 69h,0ah,74h,77h,0ah,88h,88h,0ah,0ah,0ah
reax	db 'E'	
.code
.startup
	mov cl,09h
	lea bx, ARRAY1 
b1:	mov al,[bx]
	cmp al,0Ah
	jne b2
	mov al,reax
	mov [bx],al
b2:	inc bx
	dec cl
	jnz b1
.exit
end
	