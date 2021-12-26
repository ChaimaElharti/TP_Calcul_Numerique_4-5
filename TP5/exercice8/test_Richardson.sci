function [x, err_comm] = test_Richardson()
    //On entre une matrice de Poisson
    A = [2 -1 0;
         -1 2 -1;
          0 -1 2]
    b = [5;6;2]
    x0 = zeros(3,1)
    k = 1000
    [x] = Richardson(A,b,x0,k)
    err_comm = norm((A*x-b)/x)

endfunction
