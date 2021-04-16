.model tiny
.486
.data
ck1     db "dis"
col     db 'r','b','B','g','w'
arr     db 04h,00h,01h,02h,07h
max1    db 11
act1    db ?
inp1    db 12 Dup('$')
file1   db "in.txt",0
handle  dw ?
dat1    db 20h
disnl   db  0DH,0AH,'$'
fdat db ?
curr db ?
strow db 0
stcol db 0
cursor macro row, col
mov ah,02h
mov dh,row ; row in hex
mov dl,col ; col in hex
mov bh,00h ; page no 0
int 10h
endm
write macro char,count,attri
mov ah,09h
mov al,char
mov cx,count
mov bh,00h
mov bl,attri
int 10h
endm
writef macro handle,count,data
mov bx,handle
mov cx,count
lea dx,data
mov ah,40h
int 21h
endm
.code
.startup
mov ah,0fh
int 10h
mov curr,al
mov ah, 00h
mov al, 03h
int 10h
mov     ah,02H               
mov     dl,0
mov     dh,0
mov     bh,0                  
int     10H
x1: mov  al,dat1
mov     ah,09h
mov     bh,0
mov     cx,40
mov     bl,01000010b
int     10h
inc     strow
cursor  strow,0
cmp     strow,12
je        epp
jmp x1
epp:
mov strow,00
mov stcol,40
cursor strow,stcol
x2: mov  al,dat1
mov     ah,09h
mov     bh,0
mov     cx,40
mov     bl,00010010b
int     10h
inc     strow
cursor  strow,40
mov     al,strow
cmp     strow,12
je        epp1
jmp x2
epp1:
mov strow,12
mov stcol,00
cursor strow,stcol
x3: mov  al,dat1
mov     ah,09h
mov     bh,0
mov     cx,40
mov     bl,00010010b
int     10h
inc     strow
cursor  strow,00
mov     al,strow
cmp     strow,24
je        epp2
jmp x3
epp2:
mov strow,12
mov stcol,40
cursor strow,stcol
x4: mov  al,dat1
mov     ah,09h
mov     bh,0
mov     cx,40
mov     bl,01000010b
int     10h
inc     strow
cursor  strow,40
mov     al,strow
cmp     strow,24
je        text
jmp x4
text: 
cursor 12,40
lea dx,file1 ;file opened
mov ah,3dh
mov al,02
int 21h
mov handle,ax
mov strow,12
mov stcol,40
x7:     cursor strow,stcol
        mov		ah,07h
        int		21h
        cmp     al,'*'
        jne     contd3		   		 
ex:     mov		ah,00
	    mov		al,curr
	    int		10h
        jmp     e
contd3:
        mov fdat,al
        write fdat,1,01001110b
        inc stcol
        cmp stcol,80
        jl contd
        inc strow
        mov stcol,40
        cmp strow,24
        jl contd
        mov strow,12
contd:

        writef handle,1,fdat
        jmp x7 
e:  mov ah,3eh
    mov bx,handle
    int 21h  
ep:

.exit
end