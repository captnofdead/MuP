.model tiny 
.486
.data 
dat1 db 69h,0ffh,0eeh,0ddh,0cch,0bbh,0aah,99h,88h,77h,66h,55h,44h,33h,22h,11h
dat2 db 11h,22h,33h,44h,55h,66h,77h,88h,99h,0aah,0bbh,0cch,0ddh,0eeh,0ffh,69h
.code
.startup
    lea di,dat1
    lea si,dat2
    mov cl,4h
    mov bl,0h
x1: mov eax,[si]
    adc [di],eax
    add si,4h
    add di,4h
    dec cl
    jnz x1
    jnc x2
    inc bl
x2: mov [di],bl
.exit
end