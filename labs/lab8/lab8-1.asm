section .data
    msg db "Введите N: ", 0

section .bss
    N resb 4

section .text
    global _start

_start:
    mov eax, msg
    call sprint
    mov ecx, [N]
label:
    mov eax, ecx
    call iprintLF
    loop label
    call quit
