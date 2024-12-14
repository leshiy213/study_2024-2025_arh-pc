%include 'in_out.asm'

section .data
    filename db 'name.txt', 0h ; Имя файла
    prompt db 'Как Вас зовут? ', 0h ; Вопрос
    greeting db 'Меня зовут ', 0h

section .bss
    name resb 255 ; Переменная для имени

section .text
    global _start

_start:
    ; Вопрос
    mov eax, prompt
    call sprint

    ; Считать имя
    mov ecx, name
    mov edx, 255
    call sread

    ; Создание файла
    mov ecx, 0777o ; Права доступа
    mov ebx, filename
    mov eax, 8 ; sys_creat
    int 80h

    ; Запись приветствия
    mov edx, greeting
    mov ecx, 255
    mov ebx, eax ; Дескриптор файла
    mov eax, 4 ; sys_write
    int 80h

    ; Запись имени
    mov edx, name
    mov ecx, 255
    mov ebx, eax ; Дескриптор файла
    mov eax, 4 ; sys_write
    int 80h

    ; Закрытие файла
    mov ebx, eax
    mov eax, 6 ; sys_close
    int 80h

    call quit
