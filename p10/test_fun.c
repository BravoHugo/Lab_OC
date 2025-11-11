#include <stdio.h>

extern int sumar(int num1, int num2);
extern int strlen(char *str); 

int main()
{
  int x = 5;
  int y = 7;
  int suma;
  char *palabra = "Hola";

  suma = sumar(x, y);
  printf("%d\n", suma);

  printf("%d\n", strlen(palabra));

  return 0;
}