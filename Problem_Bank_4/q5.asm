.model tiny
.486
.data
    array db 1,3,4,6,7,2
    count db 6
    min db ?
    minaddr dw ?
.code
.startup
    lea si, array
    lea bx,count
    mov cx,[bx]
    mov al, 0FFh
    mov bx, si
    x1: cmp [si],al
        jae x2
        mov al,[si]
        mov bx,si
    x2: inc si
        dec cx
        jnz x1
    mov min,al
    mov minaddr,bx



.exit
end