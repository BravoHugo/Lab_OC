section .text

global getBit

;int getBit (int value, int numBit) prototipo de la funcion;

getBit:
    push ebp
    mov ebp, esp
    mov eax, [ebp + 8]
    mov ecx, [ebp + 12]
    mov edx, 1
    shl edx, cl 
    and eax, edx
    cmp eax, 0
    je fin
    mov eax, 1
    fin:
        pop ebp
        ret