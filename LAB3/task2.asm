.model tiny
.486
.data
str1	 db	'Enter The Username $'           ; all strings must terminate with ‘$’ ASCII value (24h)
str3	 db     0dh,0ah,'Enter The Password $' 
disnl	 db     0DH,0AH,'$'
username db 	'dhairy0827'
password db 	'XfCClMkr'
max1     db     0bh                    ; 32 is max no. of chars that a user can type in (max possible – 255)
act1     db     ?                          ; actual count of keys that user types will be stored here after int has
inp1     db     0ch dup('$')          ; Reserve 32 locations for input string
	 db	'$'
max2     db     09h     
act2     db     ?
inp2     db     0ah dup('$')
str5	 db	0dh,0ah,'Hello $' 
dis3     db     '*'    
.code
.startup
		lea      dx, str1
		mov      ah, 09h
		int      21h
		lea      dx,disnl
		mov      ah,09h
		int      21h
		lea      DX,max1
		mov      AH, 0Ah
                INT      21h
		mov 	 cl,10
		lea	 si,inp1
		lea 	 di,username
x1:		mov 	 al,[si]
		cmp 	 al,[di]
		jne 	 x5
x2: 		inc 	 si
		inc 	 di
		dec 	 cl
		jnz  	 x1
		;Enter Password display
		lea      dx, str3
              	mov      ah, 09h
              	int      21h
		lea      dx,disnl
              	mov      ah,09h
              	int      21h
		;input password
		lea     di,inp2
        	mov     cx,08
x7:     	mov     ah,08h
        	int     21h
        	stosb
        	mov     dl,dis3
        	mov     ah,02h
        	int     21h
        	loop    x7
		mov 	cl,8
		lea 	si,inp2
		lea 	di,password
x3:		mov 	al,[si]
		cmp 	al,[di]
		jne 	x5
x4: 		inc 	si
		inc 	di
		dec 	cl
		jnz 	x3
		lea	dx,str5
		mov	ah,09h
		int	21h
		lea     dx,inp1
		mov     ah,09h
		int     21h		
x5:			  
.exit
end