; division.asm - Программа на языке ассемблера NASM
; Выполняет деление двух чисел

SECTION .data
    dividend DB 20
    divisor DB 3
    quotient DB 0
    remainder DB 0

SECTION .text
    GLOBAL _start

_start:
    mov al, [dividend]  ; Загружаем делимое в AL
    xor ah, ah          ; Очищаем старший байт регистра AX
    div byte [divisor]  ; Делим AL на делитель
    mov [quotient], al  ; Сохраняем частное
    mov [remainder], ah ; Сохраняем остаток

    ; Завершаем программу
    mov eax, 1          ; Код выхода
    xor ebx, ebx        ; Код завершения
    int 80h
