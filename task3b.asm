SECTION	.data
msg1 	db 		'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 0Ah, 0h 		;string message plus linefeed(OAh)

SECTION	.text
global	_start

_start:
	call 	sprint 				; call function to calculate length of string
	call 	sprint 				; call function to calculate length of string
	call 	sprint 				; call function to calculate length of string
	call 	sprint 				; call function to calculate length of string
	call 	sprint 				; call function to calculate length of string

	call 	quit

quit:
	mov 	ebx, 0
	mov 	eax, 1
	int 	80h
	ret

; String length calculation START
sprint:
	mov 	eax, msg1
	push 	edx
	push 	ecx
	push 	ebx
	push 	eax
	call 	strlen

	mov 	edx, eax
	pop 	eax

	mov 	ecx, eax
	mov 	ebx, 1
	mov 	eax, 4
	int 	80h

	pop 	ebx
	pop 	ecx
	pop 	edx
	ret

strlen: 						; function declaration
	push 	ebx 				; push the value in EBX onto the stack to preserve it while we use it in thi function
	mov 	ebx, eax 			; move address in EAX to EBX, both point to same memory segment

nextchar:
	cmp 	byte [eax], 0 		; compare the byte pointed by EAX, zero denotes end of string delimiter
	jz 		finished 			; jump to finished label if comparison above is true
	inc 	eax 				; increment the address in EAX by one byte if ZERO flag has not been set
	jmp 	nextchar			; jump to nextchar label, loop

finished:
	sub 	eax, ebx			; subtract EBX address from EAX address obtained in nextchar label
	pop 	ebx
	ret
; String length calculation END