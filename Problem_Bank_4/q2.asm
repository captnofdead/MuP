.model tiny
.486
.data
    loc1 db 12,13,1,4,5,6,12,3,1,3
    loc2 db 10 dup(?)
.code
.startup
    lea si,loc1
    lea di,loc2
    mov cx,10
    x1: push [si]
        inc si
        loop x1
    mov cx,10
    x2: pop [di]
        inc di
        loop x2
.exit
end