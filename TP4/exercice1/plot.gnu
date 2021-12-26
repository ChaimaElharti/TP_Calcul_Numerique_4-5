set term png size 1900,1000

set output "myldlt"

set grid

set title "LDLT Factorization"

set ylabel "Time in seconds"

set xlabel "Data"

plot "out0.dat" using 2:1 w lp t "LDLt"
