.model tiny
.486
.data
ck1     db "stepd"
ck2     db "stepu"
col     db 'm','b','w'
arr     db 05h,06h,07h
max1    db 6
act1    db ?
inp1    db 7 Dup('$')
file1   db "steps.txt",0
handle  dw ?
dat1    db 20h
disnl   db  0DH,0AH,'$'
displ   db "Invalid Command$"
fdat db ?
curr db ?
strow db 0
stcol db 0
mxrow db 0
mnrow db 0
mxcol db 80
mncol db 0
color db ? 
attri db 0h

write macro char,count,attri
mov ah,09h
mov al,char
mov cx,count
mov bh,00h
mov bl,attri
int 10h
endm
writef macro handle,count,data
mov bx,handle
mov cx,count
lea dx,data
mov ah,40h
int 21h
endm

cursor macro row, col
mov ah,02h
mov dh,row ; row in hex
mov dl,col ; col in hex
mov bh,00h ; page no 0
int 10h
endm

.code
.startup
lea dx,max1
mov ah,0AH
int 21h
;checking input success
; lea dx,disnl
; mov ah,09
; int 21h
; lea dx,inp1
; mov ah,09h
; int 21h
lea si,inp1
lea di,ck1
mov cx,07
x1: mov al,[si]
    mov bl,[di]
    cmp al,bl
    jne secodCheck
    inc si
    inc di
    loop x1
    mov al,00
    mov mnrow,al
    mov al,04
    mov mxrow,al
    jmp mainLogic
secodCheck:
lea si,inp1
lea di,ck2
x2: mov al,[si]
    mov bl,[di]
    cmp al,bl
    jne endOfP
    inc si
    inc di
    loop x2
    mov al,24
    mov mnrow,al
    mov al,16
    mov mxrow,al
;input logic checking 
; lea dx,disnl
; mov ah,09
; int 21h
; lea dx,inp1
; mov ah,09h
; int 21h
mainLogic:
    mov ah,3Dh
    mov al,02h
    lea dx,file1
    int 21h
    mov handle,ax
    mov bx,ax
    mov		ah,42h
    mov		al,00
    mov		cx,00
    mov		dx,9
    int		21h ;file pointer moved
    mov ah,3fh
    mov cx,01
    lea dx,color
    int 21h
    lea di,arr
    lea si,col
    mov al,color

colorCheck:cmp al,[si]
           je  cktc
           inc si
           inc di
           jmp colorCheck
    
cktc: mov al,[di]
      mov bl,attri
      rol al,04h
      add al,bl
      mov attri,al
    
checkL: cmp mnrow,24
        jne start0
mov strow,24
mov stcol,00
mov ah,0fh
    int 10h
    mov curr,al
    mov ah, 00h
    mov al, 03h
    int 10h
contd4:
        cursor strow,stcol
        write dat1,10,attri
        dec strow
        add stcol,10
        mov al,strow
        cmp al,16
        jne contd4
        jmp x7
start0: 
    mov ah,0fh
    int 10h
    mov curr,al
    mov ah, 00h
    mov al, 03h
    int 10h
contd3:
        cursor strow,stcol
        write dat1,10,attri
        inc strow
        add stcol,10
        mov al,strow
        cmp al,8
        jne contd3
x7:     cursor 0,0
        mov		ah,07h
        int		21h
        cmp     al,'*'
        
        jne     x7	   		 
ex:     mov		ah,00
	    mov		al,curr
	    int		10h
        jmp     endOfP
        
endOfP:
.exit
end