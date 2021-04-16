.model tiny
.486
.data
usera db 08h
userk db ?
userd db 0bh dup(?)
newl  db 0dh,0ah,'$'
dat   db 'dis'
bck   db ?
frg   db ?
attb  db 'r','b','B','g','w'
attb2 db 04h,00h,01h,02h,07h
attr  db 00h
curr  db ?
fname db 'mpi.txt',0
handle dw ?
fdat db 12 dup('$')
strow db 11
stcol db 35

cursor macro row, col
mov ah,02h
mov dh,row ; row in hex
mov dl,col ; col in hex
mov bh,00h ; page no 0
int 10h
endm
.code
.startup
    lea dx,usera
    mov ah,0ah
    int 21h
    cmp userk,07h
    jl ex
    cld
    lea di,userd
    lea si,dat
    mov cx,03h
chk:lodsb
    cmp [di],al
    jne ex
    inc di
    loop chk

    inc di
    mov al,[di]
    mov frg,al
    add di,02
    mov al,[di]
    mov bck,al
    ;getting attribute byte
    lea di,attb
    lea si,attb2
    mov al,bck
x1: cmp [di],al
    je x11
    inc di
    inc si
    jmp x1
x11:mov ax,[si]
    rol al,04h
    add attr,al
    lea di,attb
    lea si,attb2
    mov al,frg
x2: cmp [di],al
    je x21
    inc di
    inc si
    jmp x2
x21:mov ax,[si]
    add attr,al


    
    mov ah,3dh
    mov al,02h
    lea dx,fname
    int 21h
    mov handle,ax ;file opened
    mov bx,ax
    mov		ah,42h
    mov		al,02
    mov		cx,0ffffh
    mov		dx,-10
    int		21h ;file pointer moved
    mov ah,3fh
    mov cx,10
    lea dx,fdat
    int 21h
    mov ah,3eh
    int 21h
    ; get display mode
    mov ah,0fh
    int 10h
    ; save current mode
    mov curr,al
    ; set required mode
    mov ah, 00h
    mov al, 03h
    int 10h

    mov di,0ah
    lea si,fdat
x3: cursor strow,stcol
    mov ah,09h
    mov al,[si]
    mov cx,1
    mov bh,00h
    mov bl,attr
    int 10h
    inc stcol
    inc si
    dec di
    jnz x3

x33:mov ah,07h
    int 21h
    cmp al,'~'
    jne x33
    mov ah,00h
    mov al,curr
    int 10h
ex:
.exit
end