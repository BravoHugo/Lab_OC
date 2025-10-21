%include "../LIB/pc_iox.inc"
%include "../LIB/pbin.o"
extern pBin_n
extern pBin_b
extern pBin_w
extern pBin_dw
extern pHex_dw

section .text:
    global _start

start:
    mov eax, 0x22446688
    mov cl, 4
    ror eax, cl
    call pHex_dw
    call lj

    mov eax, 1
    int 0x80

lj:
    mov al, 10
    call putchar
    ret
