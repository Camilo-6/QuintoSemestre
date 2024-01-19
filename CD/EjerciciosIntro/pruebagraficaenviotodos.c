#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>
#include <time.h>

#define TAG_RESULTADO 1

int main(int argc, char *argv[])
{
    // Create a simulation of a graph, where each node is a process and each edge is the communication between two processes
    // The weight of each edge is the distance between two nodes, which is a random number between 1 and 100
    // The weight of an edge will be stored in the array of the node that is the destination of the edge

    int size, rank, distancia, resultado;

    MPI_Init(&argc, &argv);
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    // Initialize the random number generator with a different seed for each process
    time_t t;
    srand(time(&t) + rank);

    // Create an array for each node
    int grafica[size];

    // Initialize the distances between all nodes as 0
    for (int i = 0; i < size; i++)
    {
        grafica[i] = 0;
    }

    // Iterate over all nodes
    for (int k = 0; k < size; k++)
    {
        // Each node sends its distance to every other node
        for (int i = 0; i < size; i++)
        {
            if (rank != i)
            {
                // Nodes send their distance to other nodes (excluding themselves)
                distancia = rand() % 100 + 1;
                MPI_Send(&distancia, 1, MPI_INT, i, TAG_RESULTADO, MPI_COMM_WORLD);
            }
        }

        // Each node receives distances from other nodes
        for (int i = 0; i < size; i++)
        {
            if (rank != i)
            {
                MPI_Recv(&resultado, 1, MPI_INT, i, TAG_RESULTADO, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
                grafica[i] = resultado;
            }
        }
    }

    // Each node prints its array
    for (int i = 0; i < size; i++)
    {
        if (rank == i)
        {
            printf("Nodo %i: ", rank);
            for (int j = 0; j < size; j++)
            {
                printf("%i, ", grafica[j]);
            }
            printf("\n");
        }
    }

    MPI_Finalize();
    return 0;
}
