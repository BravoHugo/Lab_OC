%include "pc_iox.inc"

section .text
    global _start

_start:
    mov ebx, 0x5C4B2A60
    mov ebx, matr
    mov eax, ebx
    call pHex_dw
    mov al, 10
    mov ax, bx
    push bx
    call pHex_w
    mov al, 10
    mov al, 8
    mul bl
    mov [N], ax
    call pHex_w
    mov al, 10
    inc word[N]

section .data
    matr dd 0x02208678
    N dw 0