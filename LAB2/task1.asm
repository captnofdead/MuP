.model tiny
.486
.data 
arr dd 69420694h,0abcdef12h,69696969h,42042069h,42069420h,69420420h
res dd 0
.code 
.startup
    	lea bx,arr
    	mov eax,[bx]
    	mov cl,5h
x1: 	inc bx
    	add bx,2h
    	inc bx
    	cmp eax,[bx]
    	jae x2
    	mov eax,[bx]
x2: 	dec cl
    	jnz x1
    	mov res, eax
.exit
end
    
