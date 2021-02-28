.model tiny
.486
.data
dat1 db 05h
act1 db ?
in1  db 5 dup(?)
res  db 6 dup('$')
stack db ?
top_stack db ?
lel db 0dh,0ah,'$'
.code
.startup
	lea dx,dat1
	mov ah,0ah
	int 21h
	mov cx,04h
	lea si,in1
	lea sp,top_stack
x1:     push [si]
	inc si
	loop x1
	lea dx,lel
	mov ah,09h
	int 21h
	mov cx,04h
x2:     pop ax
	mov dx,ax
	mov ah,02h
	int 21h
	loop x2
.exit 
end
	