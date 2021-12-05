function[] = test_myldlt(A)
A = rand(3,3)
[L,D,LT] = myldlt(A)
disp(L*D*LT)
disp(A)
err_comm = norm((A-L*D*LT) / A)
disp(err_comm)

endfunction
