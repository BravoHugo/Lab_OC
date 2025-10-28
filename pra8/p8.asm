%include "pc_iox.inc"

section .text
    global _start

_start:
call getche         ; 0>=x<=9
call lj
sub eax, '9'
jb rango_arriba
sub eax, '0'
jz
rango_arriba:



lj:
    push eax
    mov al, 10
    call putchar
    pop eax
    ret