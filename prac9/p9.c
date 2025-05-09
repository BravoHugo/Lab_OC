#include <stdio.h>

extern int getBit(int, int);
extern int suma (int num1, int num2);
extern int strlen(char *str);
extern char *strchr(char *str, int c);

int dato = 4;
int num_bit = 2;
int num1 = 3;
int num2 = 4;
char *str = "Perrito bonito";
int c = 'o';

int main() {
        printf("En bit %d del dato: %08x es %d\n", num_bit, dato, getBit(dato, num_bit));
        printf("La suma de %d+%d = %d\n", num1, num2, suma(num1, num2));
        printf("La longitud de su cadena es: %d\n", strlen(str));
        printf("La direccion de %d es %s\n", c, strchr(str,c));

        return 0;
}