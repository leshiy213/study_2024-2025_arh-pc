; addition.asm - Программа на языке ассемблера NASM
; Выполняет сложение двух чисел

SECTION .data
    num1 DB 5
    num2 DB 10
    result DB 0

SECTION .text
    GLOBAL _start

_start:
    mov al, [num1]      ; Загружаем первое число в AL
    add al, [num2]      ; Складываем с вторым числом
    mov [result], al    ; Сохраняем результат

    ; Завершаем программу
    mov eax, 1          ; Код выхода
    xor ebx, ebx        ; Код завершения
    int 80h
