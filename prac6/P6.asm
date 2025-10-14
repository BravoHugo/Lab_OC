%include "pc_iox.inc"
extern pHex_dw

section .text
    global _start

_start:
mov ebx, 0x5C4B2A60
add ebx, 0x2208678
mov eax, ebx
call pHex_dw
call linejump
push bx
mov ax, bx
call pHex_w
call linejump
mov al, 8
mul bl
mov word[N], ax
call pHex_w
call linejump
inc word[N]
mov ax, [N]
call pHex_w
call linejump
pop bx


linejump:
mov al, 10
call putchar
ret

section .data
N dw 0