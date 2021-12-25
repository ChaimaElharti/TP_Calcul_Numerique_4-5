tic()
Am = rand(5000,5000)
A = tril(Am) + triu(Am', 1) 
function [L, D] = myldlt(A)

n = size(A,"r")

// On sélectionne les sous matrices au déterminant différent de 0
for i = 1:n
    if det(A(i,i))==0
        disp("Impossible")
    else

L = tril(A)
D = diag(A)
v = zeros(n,1)
v(1) = D(1)
for j = 1:n
    for i = 1:j
        v(i) = L(j,i) * L(i,i);
        L(j,j) = L(j,j) - L(j,i) * v(i)
        for k = j+1:n
            L(k,j) = (L(k,j) - L(k,i) * v(i)) / L(j,j);
        end
    end
end



for i=1:n
    L(i,i) = 1
end

    end
end
endfunction

t = toc()
disp(t)



