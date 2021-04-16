.model tiny
.486
.data
divd1 dw 0012h,0011h,0200,0278,1234h,3455h,1231,2345h,2123h,2345h
dive1 db 0
count dw 10
stack dw 4 dup(?)
top_stack1 label word
repl1 macro ax  
    mov ax,0001h
    endm
.code 
.startup
    lea dx,offset divd1
    mov cx,count
    call errd 
    mov dive1,bl
.exit
errd proc near
     push si
x1:  mov si,dx
     mov ax,[si]
     cmp ax,1900h
     jle e1
     repl1 ax 
     inc bl
     mov [si],ax
e1:  add dx,2
     loop x1
     pop si
     ret
errd endp
end
