.model tiny
.486
.data
; bc bahut mehnat hai
arrayw dw 01h,02h,0FFF5h,0FFF4h
count db 4
arrayd dd 4 DUP (0) 
res db 0
.code 
.startup
	lea si,arrayw
	lea di,arrayd
	mov cl,count
x1: mov bx,[si]
	mov ax,[si]	
	ror bx,1
	jc x5
	jmp x3
x3: CWD 
	mov [di],ax
	add di,02h
	mov [di],dx
	add di,02h
	jmp x4
x5:	mov [di],ax
	add di,04h
	jmp x4
x4:	add si,02h
	dec cl
	jnz x1	
.exit
end