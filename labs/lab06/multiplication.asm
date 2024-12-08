; multiplication.asm - Программа на языке ассемблера NASM
; Выполняет умножение двух чисел

SECTION .data
    num1 DB 3
    num2 DB 4
    result DW 0

SECTION .text
    GLOBAL _start

_start:
    mov al, [num1]      ; Загружаем первое число в AL
    mul byte [num2]     ; Умножаем AL на второе число
    mov [result], ax    ; Сохраняем результат

    ; Завершаем программу
    mov eax, 1          ; Код выхода
    xor ebx, ebx        ; Код завершения
    int 80h
