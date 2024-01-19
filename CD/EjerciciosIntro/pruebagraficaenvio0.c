#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>
#include <time.h>

#define TAG_RESULTADO 1

int main(int argc, char *argv[])
{
    int size, rank, distancia, resultado;

    MPI_Init(&argc, &argv);
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    // inicializamos la semilla aleatoria
    time_t t;
    srand(time(&t) + rank);

    // crea un arreglo para cada nodo
    int grafica[size];

    // inicializa las distancias entre todos los nodos como 0
    for (int i = 0; i < size; i++)
    {
        grafica[i] = 0;
    }

    for (int i = 1; i < size; i++)
    {
        // los nodos envían su distancia al nodo 0
        if (rank == 0)
        {
            // el nodo 0 recibe la distancia de todos los otros nodos
            MPI_Recv(&resultado, 1, MPI_INT, i, TAG_RESULTADO, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
            grafica[i] = resultado;
        }
        else
        {
            if (rank == i)
            {
                // los nodos envían su distancia al nodo 0
                distancia = rand() % 100 + 1;
                MPI_Send(&distancia, 1, MPI_INT, 0, TAG_RESULTADO, MPI_COMM_WORLD);
            }
        }
    }

    // imprimir el arreglo (solo el nodo 0 imprimirá)
    if (rank == 0)
    {
        for (int i = 0; i < size; i++)
        {
            printf("%i, ", grafica[i]);
        }
        printf("\n");
    }

    MPI_Finalize();
    return 0;
}
