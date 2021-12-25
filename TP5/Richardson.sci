function [x]=Richardson(A,b,x0,k)
n=size(A,"r")
x=x0
for i=1:k
    for j=1:n
        x(j) = ((b(j)-A(j,1:n)* x )* A(j,j)) + x(j);
    end
end
endfunction
