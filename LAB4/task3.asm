.model tiny
.data
gg db "lab4test.txt",0
var1 dw ?
dat1 db 69 dup ('$')
count dw 69
.code
.startup
		
		mov ah,3dh
		lea dx,gg
		mov al,02h
		int 21h
			
		mov var1,ax
		mov bx,var1
		
		mov ah,42h
		mov al,0h
		mov cx,0000
		mov dx,0000
		int 21h
		
		mov ah,3fh
		lea dx,dat1
		mov cx,count
		int 21h
		
		mov ah,09h
		lea dx,dat1		
		int 21h
		
		mov ah,3eh
		int 21h
		
.exit
end
