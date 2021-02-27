.model tiny
.486
.data
    alph db 'a','e','i','h','g','h','s','t','r','o','a','e','i','h','g','h','s','t','r','o'
    vcnt db ?
    vow db 'a','e','i','o','u'
.code
.startup
    lea si,alph
    mov cx,20
    mov al,0
    x0: mov dx,5
        lea di,vow
        mov bx,[si]

    x1: cmp [di],bx
        jnz x2
        inc al
        jmp x3
    x2: dec dx
        inc di
        jnz x1
    x3: inc si
        dec cx
        jnz x0
    mov vcnt,al

.exit
end