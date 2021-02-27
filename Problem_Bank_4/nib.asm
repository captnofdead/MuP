.model tiny
.486
.data
    dat1 db 45h,89h,27h,0f2h,3eh,20 dup(01)
    car1 db 25 dup('N')
.code
.startup
    lea si, dat1
    lea di,car1
    mov ch,25
    x1: mov al,[si]
        mov ah,[si] 
        and al,0Fh
        add al,0F0h
        and ah,0F0h
        mov cl,4
        shr ah,cl
        add al,ah
        jnc x2
        mov bl,'C'
        mov [di],bl
        clc
        x2:
            inc si
            inc di
            dec ch
            jnz x1

.exit
end