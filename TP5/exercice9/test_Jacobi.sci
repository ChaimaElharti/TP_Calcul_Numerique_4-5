function [x,x1,err_comm, err_comm1] = test_Jacobi()
    // On essaie avec une matrice quelconque puis avec une matrice de Poisson. 
    
    A = [78 17 15 ;
         17 98 38 ;
         15 38 61 ]
    A1 = [2 -1 0;
          -1 2 -1
          0 -1 2]
    b = [51;96;32]
    x0 = zeros(3,1)
    k = 100
    [x] = Jacobi(A,b,x0,k)
    err_comm = norm((A*x-b)/x)
    [x1] = Jacobi(A1,b,x0,k)
    err_comm1 = norm((A1*x1-b)/x1)
endfunction
