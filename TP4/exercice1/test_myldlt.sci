A = rand(4, 4)
A_symmetric = tril(A) + triu(A', 1) 
// on fait bien attention à rentrer une matrice symétrique à notre fonction. 

function[] = test_myldlt(A_symmetric)

[L,D] = myldlt(A_symmetric)

n = size(A,"r")

/* On départage le vecteur contenant les valeurs de la diagonale sur une matrice diagonale.
Juste pour bien visualiser mais en réalité, cela nous ne intéresse pas 
du point de vue de la performance.  */

for i = 1:n 
    for j = 1:n 
        if i==j then D(i,j) = L(i,i)
        else D(i,j) = 0
        end
    end
end
disp(abs(L*D*L'-A_symmetric))

//on calcule notre erreur commise. 
err_comm = norm((A_symmetric-L*D*L') / A_symmetric)
disp(err_comm)

endfunction


