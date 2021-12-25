function [x1, err_comm] = test_Jacobi()
    // On observe qu'avec des valeurs aléatoires petites, 
    // on obtient des résultats infinis. 
    // Cela veut dire que la méthode diverge pour des valeurs inférieures à 1. 
    
    A = [78 156 1529 ;
         156 98 385 ;
         1529 385 61 ]
    b = [51;96;32]
    x0 = zeros(3,1)
    k = 100
    [x1] = Jacobi(A,b,x0,k)
    err_comm = norm(A*x1-b)
endfunction
