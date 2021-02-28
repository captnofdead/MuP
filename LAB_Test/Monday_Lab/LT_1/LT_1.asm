.model tiny
.486
.data
exm1 db 'A','B','B','D','E','F','Z','Y','X','W','A','B','B','D','E','F','Z','Y','X','W'
dha27 db 0
name1 db 'D'
.code
.startup
	mov dl,'A'
	sub name1,dl
	mov al,'Z'
	sub al,name1
	mov cl,20
	mov ch,0
	lea si,exm1
b1:    cmp al,[si]
	jnz b2
	inc ch
b2:	inc si
	dec cl
	jnz b1
	mov [dha27],ch
.exit 
end
	