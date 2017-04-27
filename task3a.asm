; Print alphabets in one row
; Compile with: nasm -f elf task3a.asm
; Link with (64 bit systems require elf_i386 option): ld -m elf_i386 task3a.o -o task3a
; Run with: ./task3a

SECTION	.data
msg    db   "ABCDEFGHIJKLMNOPQRSTUVWXYZ", 0xA, 0xD
len    equ  $-msg2

SECTION	.text
global	_start

_start:
	mov     edx, len
    mov     ecx, msg
    mov     ebx, STDOUT
    mov     eax, SYS_WRITE
    int     0x80

	mov 	ebx, 0
	mov 	eax, 1
	int 	80h
	ret