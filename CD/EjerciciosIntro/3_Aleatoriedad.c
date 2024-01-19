#include <stdio.h>	//contiene printf()
#include <stdlib.h> //contiene rand() y srand()
#include <time.h>	//contiene time() y time_t

/*
 *Ejemplo de uso de números aleatorios
 */

/*
 *Funcion que inicializa la semilla aleatoria
 *Utiliza el "calendar time" del sistema, que es un concepto
 *dependiente de la implementación de la biblioteca.
 */
void inicializa()
{
	time_t t;
	srand(time(&t));
}

/*
 *Genera y muestra en pantalla un número entero pseudoaleatorio,
 *utilizando tres métodos distintos: 1. el resultado "crudo" de rand(),
 *2. utilizando el módulo, 3. tomando la parte proporcional
 */
int main()
{
	inicializa(); // si se comenta esta línea, el resultado no es aleatorio
				  // porque siempre usa la semilla por defecto
	int num1 = rand();
	int num2 = rand() % 50;
	double num3 = ((double)rand()) / ((double)RAND_MAX);
	int num4 = (int)(50.0f * num3);

	printf("numero1,  entre 0 y RAND_MAX (%i):\n\t%i\n\nnumero2, entre 0 y 50 (metodo simple):\n\t%i\n\nnumero3, entre 0 y 50 (metodo elaborado):\n\t%i (entre 0 y 1: %f)\n", RAND_MAX, num1, num2, num4, num3);
}