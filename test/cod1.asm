%include "../LIB/pc_iox.inc"

section .data
    cadena db "cadena muestra", 0
    msg1 db "bit en 1",0
    msg0 db "bit en 0", 0
    msgpar db "es par", 0
    msgimpar db "es impar", 0

section .text
    global _start

_start:
    mov ebx, cadena
    call printStr
    call InvertirStr
    call printStr
    mov edx, 20
    call EsPar
    jc es_par
    mov ebx, msgimpar
    call printStr
    jmp next
es_par:
    mov ebx, msgpar
    call printStr
next:
    mov al, 10110000b
    mov cl, 7
    call TestBit
    jc bitEn1
    mov ebx, msg0
    call printStr
    jmp salir
bitEn1:
    mov ebx, msg1
    call printStr
salir:  
    mov eax, 1
    int 0x80

printStr:
    push esi
    push eax
    mov esi, 0
cicloPrt:
    mov al, [ebx+esi]
    cmp al, 0
    jz finPrt
    call putchar
    inc esi
    jmp cicloPrt
finPrt:
    mov al, 10
    call putchar
    pop eax
    pop esi
    ret

InvertirStr:
    push esi
    push eax
    push ecx
    mov ecx, 0
    mov esi, 0
cicloSto:
    mov al, [ebx+esi]
    cmp al, 0
    jz ajuste
    push eax
    inc esi
    inc ecx
    jmp cicloSto
ajuste:
    mov esi, 0
cicloInv:
    pop eax
    mov byte[ebx+esi], al
    inc esi
    loop cicloInv
finInv:
    pop ecx
    pop eax
    pop esi
    ret

TestBit:
    push eax
    cmp cl, 7
    ja finTest
    mov ah, al
    inc cl
    shr ah, cl
finTest:
    pop eax
    ret

EsPar:
    test edx, 0x0001
    jz par
    mov al, 0
    clc 
    jmp finEsPar
par:
    mov al, 1
    stc
finEsPar:
    ret