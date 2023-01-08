function [ time_Ax, time_xA] = time_comparing(A,B)
g= @() solve_crout_LUX(A,B);
B=B';
f= @() solve_crout_XLU(A,B);
time_Ax=timeit(g);
time_xA=timeit(f);

end