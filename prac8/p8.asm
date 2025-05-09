%include "pc_iox.inc"

section .text
    global _start

section .data
<<<<<<< HEAD
<<<<<<< HEAD
    vector1 times 10 db 0
    vector2 times 10 db 0
    N equ 10

_start:
    mov ebx, vector1         ;memoria
    mov edx, vector2
    call capturar_vector
    call imprimir_vector
    push ebx
    mov ebx, edx
    call capturar_vector
    call imprimir_vector
    pop ebx
    call suma_dos_vectores
    call imprimir_vector
    mov eax, 1               ;sys_exit
=======
    vector times 10 db 0
=======
    vector1 times 10 db 0
    vector2 times 10 db 0
    N equ 10
>>>>>>> 399cd93 (terminado)

_start:
    mov ebx, vector1         ;memoria
    mov edx, vector2
    call capturar_vector
    call imprimir_vector
<<<<<<< HEAD
    mov eax, 1      ;sys_exit
>>>>>>> 44332a6 (fix1)
=======
    push ebx
    mov ebx, edx
    call capturar_vector
    call imprimir_vector
    pop ebx
    call suma_dos_vectores
    call imprimir_vector
    mov eax, 1               ;sys_exit
>>>>>>> 399cd93 (terminado)
    xor ebx, ebx
    int 0x80

lj:
    push eax
    mov al, 10
    call putchar
    pop eax
    ret

capturar_vector:
<<<<<<< HEAD
<<<<<<< HEAD
    mov ecx, N
    mov esi, 0
    capturar_ciclo:
=======
    ciclo:
>>>>>>> 44332a6 (fix1)
=======
    mov ecx, N
    mov esi, 0
    capturar_ciclo:
>>>>>>> 399cd93 (terminado)
        call getch
        sub al, '0'
        cmp al, 0
        jl capturar_ciclo       ;rango por abajo
        cmp al, 9
        jg capturar_ciclo        ;rango por arriba
        call putchar
        call lj
        mov [ebx+esi], al
        inc esi
        loop capturar_ciclo
        ret

imprimir_vector:
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 399cd93 (terminado)
    mov ecx, N
    mov esi, 0
    imprimir_ciclo:
        mov al, [ebx + esi]     ;moverse en el arreglo
        add al, '0'             ;convertir a ASCII
        call pHex_b
        call lj
        inc esi
        loop imprimir_ciclo
        ret
<<<<<<< HEAD

suma_dos_vectores:
    mov ecx, N
    mov esi, 0
    suma_ciclo:
        mov al, [ebx + esi]         ;moverse en el arreglo
        add al, [edx + esi]
        mov byte[ebx + esi], al
        inc esi
        loop suma_ciclo
        ret
=======
    mov ecx, 10       ; contador
    mov esi, 0        ; índice

imprimir_ciclo:
    mov al, [ebx + esi]  ; cargar valor del vector
    add al, '0'          ; convertir a carácter ASCII
    call putchar
    call lj              ; salto de línea
    inc esi
    loop imprimir_ciclo
    ret
>>>>>>> 44332a6 (fix1)
=======

suma_dos_vectores:
    mov ecx, N
    mov esi, 0
    suma_ciclo:
        mov al, [ebx + esi]         ;moverse en el arreglo
        add al, [edx + esi]
        mov byte[ebx + esi], al
        inc esi
        loop suma_ciclo
        ret
>>>>>>> 399cd93 (terminado)
