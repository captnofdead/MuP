.model tiny
.486
.data
array1 dd 88888888h,99999999h,77777777h,69696969h,42069420h,42042069h,69420420h,42069694h,21212121h,42424242h
.code 
.startup
	lea si,array1+20
	lea di,array1+40
	mov cl,05h
b1:	mov eax,[si]
	mov [di],eax
	inc si
	inc di
	add si,02h
	add di,02h
	inc si
	inc di
	dec cl
	jnz b1
	lea si,array1
	lea di,array1+20
	mov cl,05h
b2: 	mov eax,[si]
	mov [di],eax
	inc si
	inc di
	add si,02h
	add di,02h
	inc si
	inc di
	dec cl
	jnz b2
.exit
end
	