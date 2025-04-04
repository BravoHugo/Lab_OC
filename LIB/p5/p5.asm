%include "pc_iox.inc"

section .text
    global _start

_start:
    mov ebx, 0x5C4B2A60
    add ebx, [matr]
    mov eax, ebx
    call pHex_dw
    call lj
    xor eax, eax
    mov ax, bx
    push bx
    call pHex_w
    call lj
    mov al, 8
    mul bl
    mov word[N], ax
    call pHex_w
    call lj
    inc word[N]
    mov ax, [N]
    call pHex_w
    call lj
    mov ax, bx
    mov bl, 0xFF
    div bl
    call pHex_w
    call lj
    mov al, ah
    mov ah, 0
    add word[N], ax
    mov ax, [N]
    call pHex_w
    call lj
    dec word[N]
    mov ax, [N]
    call pHex_w
    call lj
    lahf
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
