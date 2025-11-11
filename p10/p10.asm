;%include "../LIB/pc_iox.inc"

section .text
    global sumar
    global strlen

sumar:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]
    add eax, [ebp+12]
    pop ebp
    ret

strlen:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]
    push eax
ciclo:
    
    cmp al, 0
    jne ciclo
    pop ebp
    ret

getBit:
    push ebp
    mov ebp, esp
    pop ebp
    ret


    h
    o
    l
    a