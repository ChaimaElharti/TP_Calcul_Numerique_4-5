#include <stdio.h>


typedef
struct MatriceCSR{
int n; // taille de la matrice
int nnz; // nombre d'elements non nuls (juste pour acces rapide car nnz = IA[n])
int* IA; // pointeur des debuts de lignes dans VA
int* JA; // indices de colonne
double* VA; // valeurs non nulles
}MatriceCSR;


//Construction de la matrice creuse a partir d'une matrice pleine
//On ne retient que les entrees A(i,j) telles que |A(i,j)| > epsi
MatriceCSR* MatriceCSR_cree(const gsl_matrix* A, double epsi);

//Liberation des ressources
MatriceCSR_libere(void * sm);

//Produit matrice vecteur : y = A * x
MatriceCSR_matvect(const MatriceCSR* A, const gsl_vector* x, gsl_vector* y);