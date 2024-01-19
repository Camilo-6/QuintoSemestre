#include <stdio.h> //importa la biblioteca stdio (STanDard Input/Output)

/*
 *Ejemplo de uso de argumentos adicionales desde linea de comandos
 */

/*
 *La funcion main recibe automaticamente dos parametros:
 *argc (ARGument Count) indica cuantos argumentos se utilizaron en la linea de comandos
 *     (incluye el nombre del programa, por lo que siempre argc>=1)
 *argv (ARGument Values) guarda los argumentos en si
 *      argv[0] contiene el nombre del programa (por defecto "a.out")
 */
int main(int argc, char **argv)
{
	/*
	 *printf ("f" es de "Formated") permite utilizar '%x' para imprimir variables con el formato x
	 *los tipos de formatos que existen se pueden consultar en la documentacion de stdio:
	 *     http://www.cplusplus.com/reference/cstdio/printf/
	 *en este caso usamos %i para imprimir un entero y %s para imprimir un string.
	 *\n es el caracter de salto de linea.
	 */
	printf("se recibieron %i argumentos, el primero es: %s\n", argc, argv[0]);
}