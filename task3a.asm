; Print alphabets in one row
; Compile with: nasm -f elf task3a.asm
; Link with (64 bit systems require elf_i386 option): ld -m elf_i386 task3a.o -o task3a
; Run with: ./task3a
SYS_EXIT        equ     1
SYS_READ        equ     3
SYS_WRITE       equ     4
STDIN           equ     0
STDOUT          equ     1

section .text
        global  _start
_start:
        call    atoz
        call    newline

        mov     eax, SYS_EXIT                   ; exit program gracefully, no segmentation fault
        int     0x80

atoz:                                           ; print A to Z programmatically
        mov     ecx, 26                         ; Number of alphabets
next:                                           ; loop start
        push    ecx                             ; save ecx to stack for later use
        mov     eax, SYS_WRITE                  ; write to stdout stuff
        mov     ebx, STDOUT                     ; write to stdout stuff
        mov     ecx, achar                      ; write to stdout stuff
        mov     edx, 1                          ; write to stdout stuff
        int     0x80
        pop     ecx                             ; recall first ecx value from stack
        mov     dx, [achar]                     ; move achar to 16-bit register to iterate over
        cmp     byte [achar], 0dh               ; check if reach the end
        inc     byte [achar]                    ; increase the pointer position
        loop    next                            ; loop till ecx is empty
        ret

newline:                                        ; to output new line, self explanatory
        mov     edx, newLineLen
        mov     ecx, newLineMsg
        mov     ebx, STDOUT
        mov     eax, SYS_WRITE
        int     0x80
        ret

section .data
        achar           db 'A'
        newLineMsg      db 0xA, 0xD
        newLineLen      equ $-newLineMsg