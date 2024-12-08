; expression.asm - Программа на языке ассемблера NASM
; Вычисляет выражение f(x) = 2x + 3 для x = 4

SECTION .data
    x DB 4
    result DB 0

SECTION .text
    GLOBAL _start

_start:
    mov al, [x]         ; Загружаем значение x в AL
    add al, al          ; Умножаем x на 2
    add al, 3           ; Прибавляем 3
    mov [result], al    ; Сохраняем результат

    ; Завершаем программу
    mov eax, 1          ; Код выхода
    xor ebx, ebx        ; Код завершения
    int 80h
