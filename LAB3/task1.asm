.model tiny
.486
.data
max1	db 15h
act1	db ?
inp1	db 16h dup('$')
disnl	db 0dh,0ah,'$'
.code
.startup
	lea dx,max1
	mov ah,0ah
	int 21h
	lea dx,disnl
	mov ah,09h
	int 21h
	lea dx,inp1
	mov ah,09h
	int 21h
.exit
end