/******************************************/
/* tp2_poisson1D_direct.c                 */
/* This file contains the main function   */
/* to solve the Poisson 1D problem        */
/******************************************/
#include "lib_poisson1D.h"
int main(int argc,char *argv[])
/* ** argc: Number of arguments */
/* ** argv: Values of arguments */
{
  int ierr;
  int jj;
  int nbpoints, la;
  int ku, kl, kv, lab;
  int *ipiv;
  int info;
  int NRHS;
  double T0, T1;
  double *RHS, *EX_SOL, *X;
  double *AB;
  double *Y;
  double *Y1;
  int test;

  double temp, relres;

  NRHS=1;
  nbpoints=102;
  la=nbpoints-2;
  T0=-5.0;
  T1=5.0;

  printf("--------- Poisson 1D ---------\n\n");
  RHS=(double *) malloc(sizeof(double)*la); // Right Hand Sides
  EX_SOL=(double *) malloc(sizeof(double)*la);
  X=(double *) malloc(sizeof(double)*la);
  Y = (double *) malloc(sizeof(double)*la);
  Y1 = (double *) malloc(sizeof(double)*la);

  set_grid_points_1D(X, &la);
  set_dense_RHS_DBC_1D(RHS,&la,&T0,&T1);
  set_analytical_solution_DBC_1D(EX_SOL, X, &la, &T0, &T1);
  
  write_vec(RHS, &la, "RHS.dat");
  write_vec(EX_SOL, &la, "EX_SOL.dat");
  write_vec(X, &la, "X_grid.dat");
  write_vec(Y, &la, "Y_grid.dat");
  for (int i=0;i<la;i++){Y1[0] = 1, Y1[i] = 0.0;}
  kv=1;
  ku=1;
  kl=1;
  lab=kv+kl+ku+1;

  AB = (double *) malloc(sizeof(double)*lab*la);

  info=0;

  /* working array for pivot used by LU Factorization */
  ipiv = (int *) calloc(la, sizeof(int));

  int row = 0; //

  if (row == 1){ // LAPACK_ROW_MAJOR
    set_GB_operator_rowMajor_poisson1D(AB, &lab, &la,&kv);
    write_GB_operator_rowMajor_poisson1D(AB, &lab, &la, "AB_row.dat");
    
    /*TEST de la fonction BLAS dgbmv : - On multiplie notre matrice 
    par la matrice Identité et on vérifie qu'elle n'est pas modifiée
     - On multiplie une matrice de Toeplitz par la matrice identité
     - On calcule l'erreur avec GAXPY err:=b-A*x */
    
    //info = LAPACKE_dgbsv(LAPACK_ROW_MAJOR,la, kl, ku, NRHS, AB, la, ipiv, RHS, NRHS);
    info = LAPACKE_dgbmv(LAPACK_ROW_MAJOR, 'N', la, lab, kl, ku, 1, AB, la, X, 1, 0, Y, 1);
  } 
  else { // LAPACK_COL_MAJOR
    set_GB_operator_colMajor_poisson1D(AB, &lab, &la, &kv);
    write_GB_operator_colMajor_poisson1D(AB, &lab, &la, "AB_col.dat");

    //info = LAPACKE_dgbsv(LAPACK_COL_MAJOR,la, kl, ku, NRHS, AB, lab, ipiv, RHS, la);
      info = LAPACKE_dgbmv(LAPACK_COL_MAJOR, 'N', la, lab, kl, ku, 1, AB, la, X, 1,1, Y, 1);
      test = LAPACKE_dgbmv(LAPACK_COL_MAJOR, 'N', la, lab, kl, ku, 1, AB, la, X, 1,0, Y1, 0);
  }
  
  printf("\n INFO DGBMV = %d\n",info);
  printf("\n test DGBMV = %d\n",test); //L'appel s'est correctement deroule
  write_xy(RHS, X, &la, "SOL.dat");

  /* Relative residual */
  temp = cblas_ddot(la, RHS, 1, RHS,1);
  temp = sqrt(temp);
  cblas_daxpy(la, -1.0, RHS, 1, EX_SOL, 1);
  relres = cblas_ddot(la, EX_SOL, 1, EX_SOL,1);
  relres = sqrt(relres);
  relres = relres / temp;
  
  printf("\nThe relative residual error is relres = %e\n",relres);

  free(RHS);
  free(EX_SOL);
  free(X);
  free(AB);
  free(ipiv);

  printf("\n\n--------- End -----------\n");
}


