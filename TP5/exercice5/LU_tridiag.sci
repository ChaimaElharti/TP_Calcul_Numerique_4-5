function[L,d] = LU_tridiag(a,b,c)
    n = size(b, 'c')
    d(1) = b(1)
    for i=2:n
        L(i) = a(i-1) / d(i-1);
        d(i) = b(i) - (L(i) * c(i-1));
    end
endfunction
