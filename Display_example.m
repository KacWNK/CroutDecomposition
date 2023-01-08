function [] = Display_example(A,B)
%Funkcja wykorzystująca funkcje solve_crout_LUX, wbudowaną funkcje inv
% oraz funkcje chceck result do zobrazowania wyników tych funkcji
X=solve_crout_LUX(A,B)
Y=inv(A)*B
B=B';
X_2=solve_crout_XLU(A,B)
Y_2=B*inv(A)
B=B';
check_result(A,B)



end