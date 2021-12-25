A = [1,2,0;0,5,6;0,0,9]
x = [3;4;5]

function [y] = csr_matvect(A, x)
nnz = 0 // Nombre d'éléments non nuls
n = size(A,"r") // Taille de la matrice
JA = zeros(nnz)
AA = zeros(nnz)

for i=1:n
    for j = 1:n
        if A(i,j)==0 then
            nnz = nnz
        else 
            nnz = nnz + 1;
            AA(i) = A(i,j);
            JA(i) = i; // Indices de colonne des éléments
            IA(i) = j; // Pointeur sur les lignes
        end
    end
    for k=IA(i):IA(i+1)-1
        y(i) = y(i) + AA(k) * x(JA(k));
    end
end

endfunction


