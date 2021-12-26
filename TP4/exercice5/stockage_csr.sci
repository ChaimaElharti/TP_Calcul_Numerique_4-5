// Produit matrice vecteur 

function [y] = csr_matvect(A, x)
    n = size(A,'r')
    y=zeros(n,1)
    for i=1:n
        for j=1:m
                y(i)=y(i)+A(i,j)*x(j);
        end
    end
endfunction

// Test et validation 

function[y,err_comm]=test_csr()

// Nombre de lignes
n=2;

// Nombre de colonnes
m=2;

/* Matrice creuse à valeurs aléatoires dont 
la densité est fixée par le troisième argument. */
A=sprand(n,m,0.25);
disp(A)
disp(nnz(A))

// Vecteur de la base canonique
x=[1;0]
disp(x)

[y]= csr_matvect(A,x)

// erreur
err_comm =norm(y-A*x)/norm(y)
endfunction

