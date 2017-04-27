; Print alphabets from a function, call 5 times
; Compile with: nasm -f elf task3c.asm
; Link with (64 bit systems require elf_i386 option): ld -m elf_i386 task3c.o -o task3c
; Run with: ./task3c

SECTION	.data
msg    db   "ABCDEFGHIJKLMNOPQRSTUVWXYZ", 0xA, 0xD
len    equ  $-msg2

SECTION	.text
global	_start

_start:
    mov     edx, len
    mov     ecx, msg
	call 	printmsg
	call 	printmsg
	call 	printmsg
	call 	printmsg
	call 	printmsg
	call 	quit

quit:
	mov 	ebx, 0
	mov 	eax, 1
	int 	80h
	ret

printmsg:
    mov     ebx, STDOUT
    mov     eax, SYS_WRITE
    int     0x80
    ret