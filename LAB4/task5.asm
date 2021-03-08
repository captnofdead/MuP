.model tiny
.486
.data
gg db "l4t5.txt",0
var1 dw ?
max db 49
act db ?
dat1 db 49 dup(?)
.code
.startup
		
		mov ah,3ch
		lea dx,gg
		mov cl,20h
		int 21h
		
		mov ah,3dh
		lea dx,gg
		mov al,02h
		int 21h
		
		mov var1,ax
		mov bx,var1

		mov ah,0ah
		lea dx,max
		int 21h
		
		mov bx,var1
		movzx cx,act
		lea dx,dat1
		mov ah,40h
		int 21h
		
		mov ah,3eh
		int 21h
		
.exit
end