function [L, D, LT] = myldlt(A)

if A==A' then //Matrice symétrique
n = size(A,"r")

// On sélectionne les sous matrices au déterminant différent de 0
for i = 1:n
    if det(A(i,1))==0
        disp("Impossible")
else


d = zeros(n,1)
v = zeros(n,1)
L = tril(A)

for j = 1:n
    for k = 1:j-1
        d(j) = A(j,j) - cumsum(d(k) * L(j,k)**2);
        v(j,1) = d(j,1) * L(j,k);
    end
    d(j) = A(j,j) - L(j,1:j-1) * v(1:j-1);
    L(j+1:n,j) = (A(j+1:n,j) - L(j+1:n,1:j-1) * v(1:j-1)) / d(j);
end



for i=1:n
    L(i,i) = 1
end
D = diag(d)
LT = L'

end
end
end
endfunction
