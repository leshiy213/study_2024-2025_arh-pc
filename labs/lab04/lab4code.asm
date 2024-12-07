; lab4.asm - Программа на языке ассемблера NASM
; Выводит строку с именем и фамилией на стандартный вывод

SECTION .data
    hello: DB 'Кузнецов Антон Дмитриевич', 10
    helloLen: EQU $-hello

SECTION .text
    GLOBAL _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, hello
    mov edx, helloLen
    int 80h

    mov eax, 1
    mov ebx, 0
    int 80h
