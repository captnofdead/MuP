.model tiny
.data
    file1 db 'mpi.txt',0
    handle dw ?
    max  db  8
    act  db  ?
    inp  db  9 dup('$')
    str1 db  'dis','$'
    cr   db  0100
    cw   db  0111
    cbl  db  0000
    cblu db  0001

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

    lea si,inp
    lea di,str1
    MOV cx,3
    cld
    REPE CMPSB
    jnz x1
    
    mov ah,0fh
    int 10h
    mov orgn,al

x1:
    mov ah,3eh
    mov bx,handle
    int 21h

.exit
end
