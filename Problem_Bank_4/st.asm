.model tiny
.486
.data
.code
.startup
    mov eax,11112222h
    mov ecx,55556666h
    mov edx,77778888h
    mov ebx,33334444h
    mov esp,00003000h
    mov ebp,00009999h
    mov esi,0000aaaah
    mov edi,0000bbbbh
    push ebp
    pushad
    popa
    pop ecx
    pop cx
.exit
end
