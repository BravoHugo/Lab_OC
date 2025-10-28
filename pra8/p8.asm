%include "../LIB/pc_iox.inc"

section .text
    global _start

section .data
    msg db 'menor a 5',0xa,0
    msg_letra db 'es letra',0xa,0
    msg_num db 'es numero',0xa,0

_start: 
    call getche         ; inciso a 0>=x<=9
    cmp al, '0'
    jb _start
    cmp al, '5'
    jnb next
    call lj
    mov edx, msg
    call puts 
 next:   
    cmp al, '9'
    ja _start
inciso_b:
    call getche
    cmp al, '0'
    jb inciso_b
    cmp al, '9'
    jnbe letras
    call lj
    mov edx, msg_num
    call puts
    letras:
        cmp al, 'A'
        jb letras
        cmp al, 'Z'
    jnbe inciso_c
    call lj
    mov edx, msg_letra
    call puts
    
inciso_c:
    mov cx, 3
    mov ah, 1
ciclo:
    mov al, '*'
    call putchar
    inc ah
    cmp ah, 
    loop ciclo   
    

mov eax, 1
int 0x80


lj:
    push eax
    mov al, 10
    call putchar
    pop eax
    ret