function[L,d] = LU_tridiag(a,b,c)
    n = size(b, 'c')
    d(1) = b(1)
    for i=2:n
        L(i-1) = a(i-1) / d(i-1);
        d(i) = b(i) - (L(i-1) * c(i-1));
    end
endfunction


function[L1,d,L2,U, Lp1, dp1,Lp2,dp2]=test_tridiag()
a = [1 2]
b = [3 4 5]
c = [6 7]

A = [3 6 0;
     1 4 7;
     0 2 5]

P = [2 -1 0;
    -1 2 -1;
     0 -1 2]

ap = [-1 -1]
bp = [2 2 2]
cp = [-1 -1]

[L1,d] = LU_tridiag(a,b,c)
[Lp1, dp1] = LU_tridiag(ap,bp,cp)
[L2,U] = lu(A)
[Lp2,dp2] = lu(P)



endfunction
