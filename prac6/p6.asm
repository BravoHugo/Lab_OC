%include "pc_iox.inc"
extern pBin_n
extern pBin_b
extern pBin_w
extern pBin_dw

section .text:
    global _start

_start:
    mov eax, 0x22446688
    ror eax, 4
    call pBin_dw
    call lj
    mov cx, 0x3f48      ;rotar para obtener 0xfa40
    ;mov ax, cx
    ;call pBin_w
    ;call lj
    rol cx, 2           ;no se puede obtener 0xfa40 rotando 0x3f48
    mov ax, cx
    ;and eax, 0x0000ffff      
    ;call pBin_dw         
    call pBin_w         ;seria lo cercano a 0xfa40 pero es 0xfd20
    call lj
    mov esi, 0x20d685f3
    mov eax, esi
    call pBin_dw
    call lj
    xor esi, 0x40042021
    mov eax, esi
    call pBin_dw
    call lj
    push esi
    mov ch, 0xa7
    mov al, ch
    call pBin_b
    call lj
    or ch, 0x48
    mov al, ch
    call pBin_b
    call lj
    mov bp, 0x67da
    mov ax, bp
    call pBin_w
    call lj
    and bp, 0xbbad
    mov ax, bp
    call pBin_w
    call lj
    rol bp, 3
    mov ax, bp
    call pBin_w
    call lj
    ror ebx, 5
    mov eax, ebx
    call pBin_dw
    call lj
    rol cx, 3
    mov ax, cx
    call pBin_w
    call lj
    pop esi
    mov edx, esi
    rol edx, 3
    rol esi, 1
    add esi, edx
    mov eax, esi
    call pBin_dw
    call lj

    mov eax, 1      ;sys_exit
    xor ebx, ebx
    int 0x80


lj:
    mov al, 10
    call putchar
    ret