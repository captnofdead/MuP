.model tiny
.data
file1 db "lab4test.txt",0
gg dw ?
dat1 db "Dhairy Agrawal 2018B4A70827G" ,0dh,0ah,"Dhairy Agrawal 2018B4A70827G"
.code
.startup
		
		mov ah,3ch
		lea dx,file1
		mov cl,20h
		int 21h
		
		mov ah,3dh
		lea dx,file1
		mov al,02h
		int 21h
		
		mov gg,ax
		mov ah,40h
		mov bx,gg
		lea dx,dat1
		mov cx,58
		int 21h
		
		mov bx,gg
		mov ah,3eh
		int 21h
		
.exit
end
