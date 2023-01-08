function [X] = solve_crout_LUX(A,B)
%Funkcja wykorzystuje funkcje solve_crout_UXY, solve_crout_LYB oraz crout
% do rozwiązania układu A*X=B poprzez dekompozycje metodą crouta macierzy A

% wykonujemy dekompozycje crouta macierzy A
[L,U] = crout(A);

% rozwiązujemy układ równań LY = B
Y = solve_crout_LYB(L, B);

% rozwiązujemy układ równań UX = Y
X = solve_crout_UXY(U, Y);

end