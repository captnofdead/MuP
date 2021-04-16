.model tiny
.486
.data
curr db ?
strow db 00
stcol db 00
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

.code
.startup
    ; get display mode
    mov ah,0fh
    int 10h
    ; save current mode
    mov curr,al
    ; set required mode
    mov ah, 00h
    mov al, 03h
    int 10h

x1: cursor strow,stcol
    write 20h,40,4fh
    inc strow
    cmp strow,12
    jne x1

    mov strow,00
    mov stcol,40
x2: cursor strow,stcol
    write 20h,40,1fh
    inc strow
    cmp strow,12
    jne x2

    mov strow,12
    mov stcol,00
x3: cursor strow,stcol
    write 20h,40,1fh
    inc strow
    cmp strow,24
    jne x3

    mov strow,12
    mov stcol,40
x4: cursor strow,stcol
    write 20h,40,4fh
    inc strow
    cmp strow,24
    jne x4

    mov strow,12
    mov stcol,40
x5: cursor strow,stcol
    mov ah,07h
    int 21h
    cmp al,'*'
    je ex
    write al,1,7ch
    inc stcol
    cmp stcol,80
    jl x5
    inc strow
    mov stcol,40
    cmp strow,24
    jl x5
    mov strow,12
    mov stcol,40
    jmp x5
ex: 
    mov al,curr
    mov ah,00h
    int 10h
.exit
end