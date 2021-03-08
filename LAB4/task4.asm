.model tiny
.486
.data
file db 'LAB4TEST.txt', 0
gg 	dw ?
en 	dw ?
count	dw 0
data1 	db ?
.code 
.startup
	
	lea dx,file
	mov al,2h
	mov ah,3dh
	int 21h
	mov gg,ax
	mov bx,gg
	mov al,2h
	mov cx,0h
	mov dx,0h
	mov ah,42h
	int 21h
	mov en,ax
	mov al,0h
	mov cx,0h
	mov dx,0h
	mov ah,42h
	int 21h
	mov cx,1
	lea dx,data1
x1:	mov ah,3fh
	int 21h
	inc dx
	add count,ax
	mov ax,count
	cmp ax,en
	jnz x1
	mov si,dx
	mov al,'$'
	mov [si],al
	lea dx,data1
	mov ah,09h
	int 21h
	mov ah,3eh
	int 21h
.exit
end