function [L, D, LT] = myldlt(A)

n = size(A,"r")

// On sélectionne les sous matrices au déterminant différent de 0
for i = 1:n
    if det(A(i,1))==0
        disp("Impossible")
else

L = A
for j = 1:n
    v = []
    for i = 1:j
        v = L(j,i) * L(i,i);
    if j>0 then
        L(j,j) = L(j,j) - L(j,j) * v
        for k = j+1:n
            L(k,j) = (L(k,j) - L(k,j) * v) / L(j,j)
        end
    else 
        for k = j+1:n
            L(k,j) = L(k,j) / L(j,j)
        end
    end
    end 
end

D = diag(L)
// On départage le vecteur contenant les valeurs de la diagonale sur une matrice diagonale. 
for i = 1:n 
    for j = 1:n 
        if i==j then D(i,j) = L(i,i)
        else D(i,j) = 0
        end
    end
end

L = tril(L)
for i=1:n
    L(i,i) = 1
end
LT = L'


end
end
endfunction
