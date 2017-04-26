SYS_EXIT        equ     1
SYS_READ        equ     3
SYS_WRITE       equ     4
STDIN           equ     0
STDOUT          equ     1

section .data
        msg1    db      "Enter number of times to print message ", 0xA, 0xD
        len1    equ $-msg1
        msg2    db      "ABCDEFGHIJKLMNOPQRSTUVWXYZ", 0xA, 0xD
        len2    equ $-msg2

section .text
        global _start
_start:
        mov     edx, len1
        mov     ecx, msg1
        mov     ebx, STDOUT
        mov     eax, SYS_WRITE
        int     0x80

        mov     eax, SYS_READ
        mov     ebx, STDIN
        mov     ecx, num
        mov     edx, 1
        int     0x80

        mov     eax, [num]
        sub     eax, '0'        ; convert to decimal

someloop:
        push    eax
        mov     edx, len2
        mov     ecx, msg2
        mov     ebx, STDOUT
        mov     eax, SYS_WRITE
        int     0x80
        pop     eax
        dec     eax
        cmp     eax, 00
        jne     someloop

        mov     eax, SYS_EXIT
        int     0x80

section .bss
num     resb 2