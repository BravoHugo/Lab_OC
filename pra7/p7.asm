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
    shl cx, 3       ; 0011-1111-0100-1000(0x3F48) --> 1111-1010-0100-0000(0XFA40)
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
    mov eax, esi
    call pBin_dw
    call lj
    push esi        ;inciso d

    mov ch, 0xA7        ;inciso e
    mov al, ch
    call pHex_b
    call lj
    call pBin_b
    call lj
    or ch, 0x48     ;(0100-1000)
    mov al, ch
    call pBin_b
    call lj

    mov bp, 0x67DA      ;inciso f
    mov ax, bp
    call pHex_w
    call lj
    call pBin_w
    call lj
    and bp,0xBBAD         ;(1011-1011-1010-1101)
    mov ax, bp
    call pBin_w
    call lj

    mov ax, bp      ;inciso g
    call pHex_w
    call lj
    shr bp, 3       
    mov ax, bp
    call pHex_w
    call lj

    mov eax, ebx        ;inciso h
    call pHex_dw
    call lj
    shr ebx, 5
    mov eax, ebx
    call pHex_dw
    call lj

    mov ax, cx      ;inciso i
    call pHex_w
    call lj
    shl cx, 3
    mov ax, cx
    call pHex_w
    call lj

    pop esi     ;inciso j

    mov eax, esi        ;inciso k
    mov edx, esi
    call pHex_dw
    call lj
    shl esi, 3
    shl edx, 1
    adc esi, edx
    mov eax, esi
    call pHex_dw
    call lj

    mov eax, 1
    int 0x80

lj:
    push eax
    mov al, 10
    call putchar
    pop eax
    ret
