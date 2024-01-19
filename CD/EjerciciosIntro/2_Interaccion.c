#include <stdio.h>

/*
 *Ejemplo de interaccion en tiempo de ejecucion
 */

/*
 *Las firmas de las funciones se colocaron aqui para que esas funciones puedan ser
 *llamadas mas abajo, ya que de otro modo no se puede llamar una funcion desde un
 *punto en el codigo antes de su definicion.
 *Se acostumbra poner las firmas en un archivo separado de encabezados, el cual por
 *lo general tiene extension .h (Header)
 */
void encuentraMin(int *val, int *pos);
void encuentraMax(int *val, int *pos);

/*
 *Al declarar la lista fuera del main, esta tiene alcance en todo el programa. Es por
 *eso que puedo utilizarla directamente en las funciones encuentraMin y encuentraMax
 */
int lista[] = {1, 2, 3, 45, 67, 89, -3, -1, 50};

int main()
{
	printf("selecciona una opcion: \n 1.Encontrar el minimo\n 2.Encontrar el maximo\n 3.salir\n");

	int opcion = 0;
	int val = lista[0];
	int pos = 0; // no inicializar las variables puede provocar comportamiento no deseado del programa

	// scanf puede usarse para leer entrada del usuario, de forma similar a printf
	scanf("%i", &opcion);

	switch (opcion)
	{
	case 1:
	{
		encuentraMin(&val, &pos);
		printf("el minimo es %i y se encuentra en la posicion %i", val, pos);
		break;
	}
	case 2:
	{
		encuentraMax(&val, &pos);
		printf("el maximo es %i y se encuentra en la posicion %i", val, pos);
		break;
	}
	case 3:
		break;
	default:
	{
		printf("opcion no reconocida");
		break;
	}
	}
}

/*
 *encuentra el minimo de la lista, y guarda su valor y su indice.
 *notese que no regresa un valor (tiene tipo de retorno void), en lugar de eso
 *recibe apuntadores a las variables que se van a modificar en la funcion.
 *esto permite "regresar" mas de un valor como resultado
 */
void encuentraMin(int *val, int *pos)
{
	int indice = 0;
	while (lista[indice] != '\0')
	{
		if (lista[indice] < (*val))
		{
			(*val) = lista[indice];
			(*pos) = indice;
		}
		indice++;
	}
}

/*
 *encuentra el maximo de la lista, y guarda su valor y su indice.
 */
void encuentraMax(int *val, int *pos)
{
	int indice = 0;
	while (lista[indice] != '\0')
	{
		if (lista[indice] > (*val))
		{
			(*val) = lista[indice];
			(*pos) = indice;
		}
		indice++;
	}
}