; Print alphabets from a function, call 5 times
; Compile with: nasm -f elf task3c.asm
; Link with (64 bit systems require elf_i386 option): ld -m elf_i386 task3c.o -o task3c
; Run with: ./task3c
SYS_EXIT        equ     1
SYS_READ        equ     3
SYS_WRITE       equ     4
STDIN           equ     0
STDOUT          equ     1

section .text
        global  _start
_start:
        mov     edx, len1                       ; standard print to screen stuff
        mov     ecx, msg1
        mov     ebx, STDOUT
        mov     eax, SYS_WRITE
        int     0x80

        mov     eax, SYS_READ                   ; standard stdin read stuff
        mov     ebx, STDIN
        mov     ecx, num
        mov     edx, 1
        int     0x80

        mov     eax, [num]                      ; mov user input to eax
        sub     eax, '0'                        ; convert to decimal

someloop:                                       ; loop to call message print routine multiple times
        dec     eax
        call    atoz                            ; call A-Z print routine
        call    newline                         ; call to print newline for better aesthetics
        mov     byte [achar], 65                ; reload A to achar
        cmp     eax, 00                         ; check if loop is done
        jne     someloop                        ; if loop not done, continue

        mov     eax, SYS_EXIT                   ; exit program gracefully, no segmentation fault
        int     0x80

atoz:                                           ; print A to Z programmatically
        push    eax                             ; save eax to stack
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
        pop     eax                             ; recall original eax value
        ret

newline:                                        ; to output new line, self explanatory
        push    eax
        mov     edx, newLineLen
        mov     ecx, newLineMsg
        mov     ebx, STDOUT
        mov     eax, SYS_WRITE
        int     0x80
        pop     eax
        ret

section .data
        achar           db 'A'
        newLineMsg      db 0xA, 0xD
        newLineLen      equ $-newLineMsg
        msg1    db      "Enter number of times to print message (1-9 only)", 0xA, 0xD
        len1    equ $-msg1

section .bss
num     resb 2
