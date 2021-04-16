.model tiny
.data
    file1 db 'encrypt.txt',0
    handle dw ?
    max  db  10
    act  db  ?
    inp  db  11 dup('$')
    str1  db  'encrypt','$'
    row db 0
    col db 0
    enc db 80
    orgn  db ?
    temp  db ?
    temp1 db ?
    temp2 db '$'
    num   db ?
.code 
.startup
    mov ah,3ch
    lea dx,file1
    mov cl,20h
    int 21h
    mov handle,ax
    

    Lea dx,max
    mov ah,0Ah
    int 21h

    LEA si,inp
    add si,8
    mov al,[si]
    and al,0fh
    mov num,al
    
    lea si,num
    lea di,r
    mov cx,1
    cld
    repe CMPSB
    
    
    LEA si,inp
    LEA di,str1
    MOV cx,7
    cld
    REPE CMPSB
    JNZ x3

    mov ah,0fh
    int 10h
    mov orgn,al

    mov al,12h
    mov ah,00
    int 10h

    mov dx,00
x2: mov cx,0
x1: mov al,0101b
    mov ah,0ch
    int 10h
    inc cx
    cmp cx,640
    jnz x1
    inc dx
    cmp dx,480
    jnz x2

;blocking function of '+'
x7:     mov     ah,07h
        int     21h
        mov temp,al
        mov temp1,al
        cmp     al,'+'
        jz     x8
        
        cmp     al,' '
        jnz    x9
        mov al,43
        mov temp,al
        jmp x10    

x9:     mov al,temp
        add al,num
        mov ah,00
        mov bl,123
        div bl
        cmp al,0
        jz  x11
        mov al,97
        add al,ah
        mov temp,al
        jmp x10

x11:    mov al,temp
        add al,num
        mov temp,al
        jmp x10        
        ;mov al,122    ; add num then take remainder with 123 if quotient 0 then temp + num else 97 + remainder
        ;sub al,temp
        ;add al,97
        ;mov temp,al
        
x10:    mov ah,02h
        mov dh,row
        mov dl,col
        mov bh,0
        int 10h

        mov ah,40h
        mov bx,handle
        mov cx,1
        lea dx,temp1
        int 21h
        
        mov ah,42h
        mov al,2
        mov bx,handle
        mov cx,0
        mov dx,1
        int 21h
        
  
        mov ah,09h
        mov al,temp
        mov bh,0
        mov bl,11011111b
        mov cx,1
        int 10h
        
        mov cl,col
        inc cl
        mov col,cl
        cmp cl,enc
        jnz x7
        mov cl,row
        inc cl
        mov row,cl
        mov cl,0
        mov col,cl
        jmp x7
        
    
x8:     mov     al,orgn
        mov     ah,0
        int     10h

x3:     
        mov ah,40h
        mov bx,handle
        mov cx,1
        lea dx,temp2
        int 21h
        
        mov ah,42h
        mov al,2
        mov bx,handle
        mov cx,0
        mov dx,1
        int 21h

        mov ah,3eh
        mov bx,handle
        int 21h


.exit
end