%include "pc_iox.inc"

section .text
    global _start

_start:
    mov ebx, 0x5C4B2A60 
    add ebx, [matr]        ;sumar valor en matr mas ebx
    mov eax, ebx
    call pHex_dw
    call lj
    mov ax, bx
    push bx                ;copiar bx en pila
    call pHex_w
    call lj
    mov al, 8
    mul bl                 ;multiplicar bl por al (8)
    mov word[N], ax
    call pHex_w
    call lj
    inc word[N]
    mov ax, [N]            ;mover el valor de N al registro ax
    call pHex_w
    call lj
    mov ax, bx              ;poner el valor de bx en ax para la division
    mov bl, 0xFF            ;byte 0xFF en bl para dividir bl
    div bl
    call pHex_w
    call lj
    mov al, ah            ;mover el residuo en ah hacia al
    mov ah, 0               ;poner el valor anterior de ah (residuo) en 0
    add word[N], ax        ;sumar los registros de igual size con el valor del residuo
    mov ax, [N]                
    call pHex_w
    call lj
    dec word[N]
    mov ax, [N]
    call pHex_w
    call lj
    lahf                    ;cargar las banderas en ah para mostrarlas
    call pHex_b
    call lj
    pop bx
    mov ax, bx
    call pHex_w
    call lj

    mov eax, 1      ;sys_exit
    xor ebx, ebx
    int 0x80

section .data
    matr dd 0x2208678
    N dw 0

lj:
    mov al, 10
    call putchar
    ret
