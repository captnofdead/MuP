.model tiny
.486
.data
fl1    db    'p6.txt',0
lol    dw    ?
ggwp    dw    ?
xd1    db    ?
flm    db    5 dup(?)
    db    '$'
.code
.startup
    mov    ah,08h
    int    21h
    mov    xd1,al
    mov    al,0ah
    sub    xd1,30h
    mul    xd1
    mov    lol,ax

    lea    dx,fl1
    mov    al,2h
    mov    ah,3dh
    int    21h

    mov    ggwp,ax
    mov    bx,ggwp
    mov    al,0h
    mov    ah,42h
    mov    cx,0h
    mov    dx,lol
    int    21h

    mov    cx,5h
    lea    dx,flm
    mov    ah,3fh
    int    21h

    lea    dx,flm
    mov    ah,09h
    int    21h

    mov    ah,3eh
    int    21h
.exit
end