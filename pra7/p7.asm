%include "../LIB/pc_iox.inc"
extern pBin_n
extern pBin_b
extern pBin_w
extern pBin_dw

section .text:
    global _start

_start:
    mov eax, 0x22446688     ; inciso a
    call pHex_dw
    call lj
    mov cl, 4
    ror eax, cl
    call pHex_dw
    call lj

    mov cx, 0x3F48      ; inciso b
    mov ax, cx
    call pHex_w
    call lj
    rol cx, 2       ; 0011-1111-0100-1000(0x3F48)   1111-1010-0100-0000(0XFA40)
    mov ax, cx
    call pHex_w
    call lj

    mov esi, 0x20D685F3    ; inciso c
    mov eax, esi
    call pHex_dw
    call lj
    call pBin_dw
    call lj
    xor esi, 0x40042021 ;(0100-0000-0000-0100-0010-0000-0010-0001)
    call pBin_dw
    call lj

    mov eax, 1
    int 0x80

lj:
    mov al, 10
    call putchar
    ret
