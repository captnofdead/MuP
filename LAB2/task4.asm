.model tiny
.486
.data
ARRAY1	dw 3333h,0abcdh,0bcdah,0ffffh,6969h
COUNT	dw 05h
NEG1	db 0 
.code
.startup
	mov cl, NEG1
	lea bx, ARRAY1
	mov si,COUNT	
	mov ax,00h
b1:	cmp [bx],ax
	jge b2
	inc cl
b2:	inc bx
	inc bx
	dec si
	jnz b1
	mov NEG1,cl
.exit
end
	