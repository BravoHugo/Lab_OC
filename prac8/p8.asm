%include "pc_iox.inc"

section .text
    global _start

section .data:
    vector db 9

_start:
    mov ecx, 10      ;contador
    mov ebx, vector     ;memoria
    call capturar_vector
    mov eax, 1      ;sys_exit
    xor ebx, ebx
    int 0x80

lj:
    push eax
    mov al, 10
    call putchar
    pop eax
    ret

capturar_vector:
    cmp ecx, 10
    jg fin_ciclo
    ciclo:
        call getch
        sub al, '0'
        cmp al, 0
        jl ciclo        ;rango por abajo
        cmp al, 9
        jg ciclo       ;rango por arriba
        call pHex_b
        call lj
        mov esi, 0
        mov [ebx+esi], al
        inc esi
        loop ciclo
        ;dec byte[ecx]
        ;cmp ecx, 0
        ;jz fin_ciclo
        ;jmp ciclo
    fin_ciclo:
        ret

;imprimir_vector: