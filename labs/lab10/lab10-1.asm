%include 'in_out.asm'

section .data
    filename db 'readme.txt', 0h ; Имя файла
    msg db 'Введите строку для записи в файл: ', 0h ; Сообщение

section .bss
    contents resb 255 ; Переменная для строки

section .text
    global _start

_start:
    ; Печать сообщения
    mov eax, msg
    call sprint

    ; Считать строку
    mov ecx, contents
    mov edx, 255
    call sread

    ; Создание файла
    mov ecx, 0777o ; Права доступа
    mov ebx, filename
    mov eax, 8 ; sys_creat
    int 80h

    ; Запись в файл
    mov edx, contents
    mov ecx, 255
    mov ebx, eax ; Дескриптор файла
    mov eax, 4 ; sys_write
    int 80h

    ; Закрытие файла
    mov ebx, eax
    mov eax, 6 ; sys_close
    int 80h

    call quit
