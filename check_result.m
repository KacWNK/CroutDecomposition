function [] = check_result(A,B)
%funkcja sprawdzająca poprawność przykładów dla Ax=B
%korzystająca z funkcji solve_crout_LUX, crout, oraz funkcji wbudowanych
% zwraca tabele z informacjami o wskazniku uwarunkowania, bledzie rozkladu,
% bledzie wzglednym, wspolczynniku stablinosci, wspolczynniku poprawnosci
% oraz czasy rozwiązywania równań Ax=B i xA=B (dla odpowiednio
% zmodyfikowanych jednak podobnych do siebie macierzy)
%przyjmuje macierz kwadratowa A o wymiarze n i macierz B o wymiarze nxm

X = solve_crout_LUX(A, B);
z = inv(A)*B;
[L,U]=crout(A);
wskaznik_uwar=cond(A);
blad_rozkladu= norm(A-L*U)/norm(A);
blad_wzgledny= norm(z-X)/norm(z);
wsp_stabilnosci= norm(X-z)/norm(z)*cond(A);
wsp_poprawnosci= norm(B-A*X)/norm(A)*norm(X);
g= @() solve_crout_LUX(A,B);
B=B';
f= @() solve_crout_XLU(A,B);
time_Ax=timeit(g);
time_xA=timeit(f);

tabela=table(wskaznik_uwar, blad_rozkladu, blad_wzgledny, ...
    wsp_stabilnosci, ...
    wsp_poprawnosci,time_Ax, time_xA, 'VariableNames', ...
    ["Wskaźnik uwarunkowania", "Błąd rozkładu", "Błąd względny", ...
    "Współczynnik stabilności", "Współczynnik poprawności", ...
    "czas rozwiązania Ax", "czas rozwiązania xA"])
end