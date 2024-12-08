# Лабораторная работа №5  
## Основы работы с Midnight Commander.  
## Структура программы на языке ассемблера NASM.  
## Системные вызовы в ОС GNU Linux.

**Выполнил:** Кузнецов Антон Дмитриевич  
**Группа:** НПИбд-02-24  
**Архитектура ЭВМ**  
**Год:** 2024  

---

### **Цель работы**  
1. Изучение работы с файловым менеджером Midnight Commander.  
2. Создание программ на языке ассемблера NASM, использующих системные вызовы GNU/Linux.  
3. Освоение передачи данных через регистры с помощью инструкций `mov` и `int`.  

---

### **Описание задания**  
1. Написать программу, выводящую строку "Hello World!".  
2. Написать программу, которая запрашивает ввод строки, затем выводит её на экран.  
3. Использовать системные вызовы для работы с вводом и выводом.

---

### **Результаты выполнения**

#### **Задание 1: вавлпвьп**
**Код программы:**
```asm
SECTION .data
    prompt: DB 'Введите строку:', 10
    promptLen: EQU $-prompt

SECTION .bss
    buffer: RESB 80

SECTION .text
    GLOBAL _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, promptLen
    int 80h

    mov eax, 3
    mov ebx, 0
    mov ecx, buffer
    mov edx, 80
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    mov edx, 80
    int 80h

    mov eax, 1
    mov ebx, 0
    int 80h
```

#### **Задание 2: Вывод строки "Hello World!"**
**Код программы:**
```asm
SECTION .data
    msg: DB 'Hello world!', 10
    msgLen: EQU $-msg

SECTION .text
    GLOBAL _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, msgLen
    int 80h

    mov eax, 1
    mov ebx, 0
    int 80h
