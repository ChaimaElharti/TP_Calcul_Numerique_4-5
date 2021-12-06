function[X,Y]=mesures()

     X=[100:1000]
     Y=zeros(1,900)

for i = 100:1000
    tic()
    A = rand(i,i)
    [L, D, LT] = myldlt(A)
    t = toc()
    Y(1,i)=t
end

plot2d(X,Y);
endfunction
