.model tiny
.486
.data
usera db 0Ah
userk db ?
userd db 0ch dup(?)
newl  db 0dh,0ah,'$'
dat   db 'encrypt'
offst db ?
curr  db ?
strow db 00h
stcol db 00h
fname db 'encrypt.txt',0
handle dw ?
fdat db ?

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
    lea dx,usera
    mov ah,0Ah
    int 21h
    cmp userk,07h
    jl ex2
    cld
    lea di,userd
    lea si,dat
    mov cx,07h
chk:lodsb
    cmp [di],al
    jne ex2
    inc di
    loop chk

    ; getting offset
    inc di
    mov cl,[di]
    sub cl,30h
    mov offst,cl

    ; get display mode
    mov ah,0fh
    int 10h
    ; save current mode
    mov curr,al
    ; set required mode
    mov ah, 00h
    mov al, 03h
    int 10h
    mov ah,3dh
    mov al,02h
    lea dx,fname ;file opened
    int 21h
    mov handle,ax

    cursor strow,stcol
    write 20h,25*80,01011010b ;background color set
x1: cursor strow,stcol
    mov ah,07h
    int 21h
    cmp al,'+'
    jz mo
    cmp al,20h
    jne contd2
    mov al,2bh
    jmp contd3
contd2:
    add al,offst
contd3:
    mov fdat,al
    write fdat,1,01011010b
    inc stcol
    cmp stcol,80
    jl contd
    inc strow
    mov stcol,00
    cmp strow,25
    jl contd
    mov strow,00h
contd:
    writef handle,1,fdat
    jmp x1
ex: mov ah,3eh
    mov bx,handle
    int 21h
mo: mov ah,00h
    mov al,curr
    int 10h
ex2:
.exit
end
