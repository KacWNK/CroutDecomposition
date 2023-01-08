function [X] = solve_crout_XLU(A,B)
% Funkcja rozwiązująca równania xA=B poprzez funkcje solve_crout_LUX()
X=solve_crout_LUX(A',B')';
end