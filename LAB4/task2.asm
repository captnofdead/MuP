.model tiny
.data
fil db "lab4test.txt",0
gg dw ?
dat1 db 0dh,0ah,"AH3 207"
.code
.startup
		
		mov ah,3dh
		lea dx,fil
		mov al,02h
		int 21h
			
		mov gg,ax
		mov bx,gg
		
		mov ah,42h
		mov bx,gg
		mov al,02h
		mov cx,0000
		mov dx,0000
		int 21h
		
		
		mov ah,40h
		mov bx,gg
		lea dx,dat1
		mov cx,9
		int 21h
				
		mov bx,gg
		mov ah,3eh
		int 21h
		
.exit
end
