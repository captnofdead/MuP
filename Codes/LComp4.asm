.model tiny
.486
.data
    str1 db 'Enter name of file in next line',0Dh,0Ah,'$'
    val db ?
    max db 11
    act db ?
    str2 db 11 dup('$') 
    file1 db 9 dup('$'),0
    file2 db 'ab13.txt',0
    cnt db 0
    str3 db 21 dup('$')
    handle dw ?
    cnt1 db 0
    orgn db ?
    row db 0
    temp db ?
    nl db 0dh,0ah,'$'
.code 
.startup
    lea dx,str1
    mov ah,09h
    int 21h

    lea dx,max
    mov ah,0ah
    int 21h

    lea dx,nl
    mov ah,09h
    int 21h

    mov si,offset str2
    mov di,offset file1
    mov cx,9

x1: lea di,str2
    lea si,file1
    cmp cnt,9

    jae x2
    mov cl,cnt
    mov ch,00
    add di,cx
    add si,cx
    mov dl,[di]
    
    mov [si],dl
    inc cnt
    jmp x1


x2: mov ah,0fh
    int 10h
    mov orgn,al

    mov ah,0
    mov al,3h
    int 10h 

    mov ah,3dh
    mov al,2
    lea dx,file1
    int 21h
    mov handle,ax

    mov ah,3fh
    mov bx,handle
    mov cx,20
    lea dx,str3
    int 21h
    
    lea di,str3
    dec di
x3: inc di
    mov ah,02h
    mov dh,row
    mov dl,0
    mov bh,0
    int 10h

    inc row

    mov ah,09h
    mov al,[di]
    mov bh,0
    mov bl,00000010b
    mov cx,1
    int 10h
    inc cnt1
    cmp cnt1,20
    jae x4
    jmp x3

x4:
    mov ah,3eh
    mov bx,handle
    int 21h

    	mov     ah,07h
x10:     int     21h
		cmp     al,'%'
        jnz     x10

    mov     al,orgn
    mov     ah,0
    int     10h



.exit
end
