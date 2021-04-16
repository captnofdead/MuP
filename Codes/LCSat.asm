.model tiny
.data
    row db 0
    col db 0
    enr db 0
    enc db 0
    max  db  6
    act  db  ?
    inp  db  7 dup('$')
    str1 db  'stepu','$'
    str2 db  'stepd','$'
    file1 db 'steps.txt',0
    color db ?
    orgn db ?
    handle dw ?
    temp db ?
    cw db 01110111b
    cb db 00010001b
    cm db 01010101b
    att db ?
    cnt db 8
    cnt1 db 0
.code
.startup
    mov ah,3dh    ;; opening a file
    mov al,2
    lea dx,file1
    int 21h
    mov handle,ax


    mov ah,42h   ;; moving pointer in file
    mov al,0
    mov bx,handle
    mov cx,00
    mov dx,09
    int 21h

    mov ah,3fh   ;; reading char from file
    mov bx,handle
    mov cx,1
    lea dx,temp
    int 21h

    mov bl,temp   ;; comparing char with color
    cmp bl,'m'
    jnz x4
    mov bh,cm
    mov att,bh
    jmp x6

x4:
    mov bl,temp
    cmp bl,'b'
    jnz x5
    mov bh,cb
    mov att,bh
    jmp x6

x5:
    mov bl,temp
    cmp bl,'w'
    jnz x3
    mov bh,cw
    mov att,bh

x6:
    lea dx,max
    mov ah,0Ah
    int 21h

    mov ah,0fh     ;; copying the current mode
    int 10h
    mov orgn,al

    lea si,inp
    lea di,str1
    mov cx,5
    cld
    repe CMPSB
    jz  x1

    lea si,inp
    lea di,str2
    mov cx,5
    cld
    repe CMPSB
    jnz  x3

    mov ah,0     ; changing to display mode
    mov al,3h
    int 10h 
    ;; print stepd

    
x7:     
        mov ah,02h
        mov dh,row
        mov dl,col
        mov bh,0
        int 10h

        mov ah,09h
        mov al,' '
        mov bh,0
        mov bl,att
        mov cx,10
        int 10h

        add col,10
        inc row
        inc cnt1
        mov cl,cnt1
        cmp cl,cnt
        jnz  x7

        jmp x10

x1:
    mov ah,0
    mov al,3h
    int 10h 
;; print stepu
        mov ah,24
        mov row,ah
x8:    
        mov ah,02h
        mov dh,row
        mov dl,col
        mov bh,0
        int 10h

        mov ah,09h
        mov al,' '
        mov bh,0
        mov bl,att
        mov cx,10
        int 10h

        add col,10
        dec row
        inc cnt1
        mov cl,cnt1
        cmp cl,cnt
        jnz  x8

        jmp x10

x10:    mov     ah,07h        ;; blocking condition
        int     21h
	    cmp     al,'*'
        jnz     x10

    mov     al,orgn   restoring mode
    mov     ah,0
    int     10h

    mov ah,3eh    ;; closing a file
    mov bx,handle
    int 21h

x3:
.exit
end