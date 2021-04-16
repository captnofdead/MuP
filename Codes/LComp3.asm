.model tiny
.486
.data
    strCol db 0
    row    db 0
    col    db 0
    enc db 9
    file1 db 10 dup(?),0
    file2 db 'abc.txt',0
    str1  db 32 dup('$')
    sSize db ?
    val  db ?
    tot  db 41
    act db 0
    orgn db ?
    cnt db 10
    handle dw ?

.code
.startup
    mov     ah,0fh
    int     10h
    mov     orgn,al

    mov ah,0
    mov al,3h
    int 10h

x1: mov ah,02h
    mov dh,row
    mov dl,col
    mov bh,0
    int 10h

    mov ah,07h
    int 21h
    mov val,al
    
    mov cl,act
    inc cl
    mov act,cl

    cmp cl,10
    ja x3
    lea di,file1
    dec cl
    mov ch,00
    add di,cx
    mov bl,val
    mov [di],bl
    jmp x2

x3: lea di,str1
    mov cl,act
    sub cl,11
    mov ch,00   
    add di,cx
    mov bl,val
    mov [di],bl
    mov sSize,cl
    inc sSize

x2: mov cl,act
    cmp cl,41
    jz x4

    mov al,val
    cmp al,0Dh
    jz x4

    mov ah,09h
    mov al,val
    mov bh,0
    mov bl,00000101b
    mov cx,1
    int 10h

    mov cl,col
    inc col
    cmp cl,enc
    jnz x1

    inc row
    inc enc
    inc strcol
    mov cl,strcol
    mov col,cl
    jmp x1
    

x4: mov ah,3ch
    lea dx,file1
    mov cl,20h
    int 21h
    mov handle,ax

    mov ah,40h
    mov bx,handle
    mov cl,sSize
    mov ch,00
    lea dx,str1
    int 21h

    mov ah,3eh
    mov bx,handle
    int 21h

    mov     al,orgn
    mov     ah,0
    int     10h

.exit
end