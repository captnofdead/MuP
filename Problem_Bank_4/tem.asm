.model  tiny
.data
dis1    db      "Enter String 1", 0Dh,0Ah,'$'
dis2    db      0Dh,0Ah,"Enter String 2", 0Dh,0Ah,'$'
userC   db      10
userA	db		?
user 	db 		11 Dup('$')
userC2   db      10
userA2	db		?
user2 	db 		11 Dup('$')
disnl   db       0DH,0AH,'$'
fixedString db  "aviwadhwa"
dis3    db '*'
.code
.startup
		;User message 1
		lea dx,dis1
		mov ah,09h
		int 21h
		;input String 1
		lea dx,userC
		mov ah,0ah
		int 21h
		;load Strings into memory
		lea di,fixedString
		lea si,user
		mov cx,9
		;Compare Strings
repe 	cmpsb
		jnz xn
		;User messsage 2
		lea dx,dis2
		mov ah,09h
		int 21h
		;Take string input character by character
lea     di,user2
        mov     cx,06
x7:     mov     ah,01h
        int     21h
        stosb
        loop    x7
		lea dx,	disnl
		mov ah,	09h
		int 21h
		lea dx,	user2
		mov ah,	09h
		int 21h
xn:
.exit
end 