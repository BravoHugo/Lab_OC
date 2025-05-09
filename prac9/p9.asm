section .text

global getBit
global suma
global strlen
global strchr

;int getBit (int value, int numBit) prototipo de la funcion;
;int suma (int num1, int num2)
;int strlen(char *str)
;char *strchr(char *str, int c)

suma:
    push ebp
    mov ebp,esp
    mov eax, [ebp + 8]
    mov edx, [ebp + 12]
    add eax, edx
    pop ebp
    ret

strlen:
    push ebp
    mov ebp, esp
    mov eax, [ebp + 8]
    mov ecx, 0
    strlen_ciclo:
        cmp byte [eax], 0
        je fin_strlen
        inc eax
        inc ecx
        jmp strlen_ciclo

    fin_strlen:
        mov eax, ecx
        pop ebp
        ret

strchr:
    push ebp
    mov ebp, esp
    mov eax, [ebp + 8]
    mov edx, [ebp + 12]
    ciclo_strchr:
        cmp byte[eax], 0
        je fin_strchr
        cmp edx, [eax]
        inc eax
    fin_strchr:
        pop ebp
        ret 


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