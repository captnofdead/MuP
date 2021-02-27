.model tiny
.486
.data
    array db 1,4,5,6,3,7,2
    count db 7
    secmax db ?
.code
.startup
    lea si, array
    mov cl,count
    x0: mov bl,[si]
        lea di,array
    x1:   mov ch,cl

        cmp [di],bl
        ja x2
        mov al,[di]
        mov [si],al
        mov [di],bl
        x2:
        inc di
        dec ch
        jnz x1

        inc si
        dec cl
        jnz x0

.exit
end