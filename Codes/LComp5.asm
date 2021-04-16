.model tiny
.486
.data
ck1     db "copycon"
col     db 'r','b','B','g','w'
arr     db 04h,00h,01h,02h,07h
max1    db 16
act1    db ?
inp1    db 17 Dup('$')
file1   db 8 Dup(0)
handle  dw ?
dat1    db 20h
disnl   db  0DH,0AH,'$'
displ   db "Invalid Command$"
fdat db ?
curr db ?
strow db 0
stcol db 0

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

cursor macro row, col
mov ah,02h
mov dh,row ; row in hex
mov dl,col ; col in hex
mov bh,00h ; page no 0
int 10h
endm

.code
.startup
lea dx,max1
mov ah,0AH
int 21h
;checking input success
; lea dx,disnl
; mov ah,09
; int 21h
; lea dx,inp1
; mov ah,09h
; int 21h
lea si,inp1
lea di,ck1
mov cx,07
x1: mov al,[si]
    mov bl,[di]
    cmp al,bl
    jne endOfP
    inc si
    inc di
    loop x1
;input logic checking 
; lea dx,disnl
; mov ah,09
; int 21h
; lea dx,inp1
; mov ah,09h
; int 21h
lea di,inp1
mov cx,07
lea si,file1
xloop :  mov al,[di+8]
         mov [si],al
         inc si
         inc di
         loop xloop
lea dx,disnl
mov ah,09h
int 21h
mov ah,3ch
lea dx,file1
mov cl,20h ; only archive file
int 21h
mov ah,3Dh
mov al,02h
lea dx,file1
int 21h
mov handle,ax

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
mov al,'>'
write al,1,10000010b
inc stcol
x7: cursor strow,stcol
        mov		ah,07h
        int		21h
        cmp     al,'@'
        jne     contd3		   		 
ex:     mov		ah,00
	    mov		al,curr
	    int		10h
        jmp     e
contd3:
        mov fdat,al
        write fdat,1,00000010b
        inc stcol
        cmp stcol,80
        jl contd
        inc strow
        mov stcol,00
        cmp strow,24
        jl contd
        mov strow,00
contd:
        writef handle,1,fdat
        jmp x7 
endOfP:
lea dx,disnl
mov ah,09h
int 21h
lea dx,displ
mov ah,09h
int 21h
jmp ends1
e:  mov ah,3eh
    mov bx,handle
    int 21h
ends1:
.exit
end