%include "../LIB/pc_iox.inc"

section .bss
    vector1 resb 10
    vector2 resb 10
    temp resw 1

section .data
    N equ 5

section .text
    global _start

_start:
    mov ecx, N
    mov ebx, vector1
    call capturarVector
    call desplegarVector
    mov ebx, vector2
    call capturarVector
    call desplegarVector
    mov ebx, vector1
    mov edx, vector2
    call productoEscalar
    call sumaVectores
    call desplegarVector

    mov eax, 1
    int 0x80

lf:
    push eax
    mov al, 10
    call putchar
    pop eax
    ret

capturarVector:
    push ecx
    push esi
    cmp al, 0
    jb capturarVector
    cmp al, 9
    ja capturarVector
    mov esi, 0
capturarElementos:
    call getch
    sub al, '0'
    mov byte[ebx+esi], al
    call lf
    inc esi
    loop capturarElementos
finCaptura:
    pop esi
    pop ecx
    ret

;ESI en 0 para servir de indice con base en EBX apuntando al vector
desplegarVector:
    push ecx
    push esi 
    cmp ecx, 0
    je finVector
    cmp ecx, 10
    ja finVector
    mov esi, 0
cicloDesplegar:
    mov al, [ebx+esi]
    call pHex_b
    call lf
    inc esi
    loop cicloDesplegar
finVector:
    pop esi
    pop ecx
    ret

sumaVectores:
    push esi
    push ecx
    mov esi, 0
cicloSuma:    
    mov al, [edx+esi]
    add byte[ebx+esi], al
    inc esi
    loop cicloSuma
    pop ecx
    pop esi
    ret

productoEscalar:
    push ecx
    push esi
    mov esi, 0
    mov word [temp], 0
cicloMul:
    mov al, [ebx+esi]
    mul byte[edx+esi]
    add word [temp], ax
    inc esi
    loop cicloMul
    mov ax, [temp]
    call pHex_w
    call lf
    pop esi
    pop ecx
    ret