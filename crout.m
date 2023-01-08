function [L, U] = crout(A)
%Funkcja dokonuje dekompozycji kwadratowej macierzy A na macierz
%dolnotrójkątną i górnotrójkątną przy czym górnotrójkątna macierz ma na
%głównej diagonali jedynki
if size(A,1)~=size(A,2)
    error('A must be a square matrix')
end
[n, n] = size(A);
L=zeros(n,n);
U=eye(n);

        for i = 1:n
            L(i, 1) = A(i, 1);
        end
        for j = 2:n
            U(1, j) = A(1, j) / L(1, 1);
        end
        for i = 2:n
            for j = 2:i
                L(i, j) = A(i, j) - L(i, 1:j - 1) * U(1:j - 1, j);
            end
            
            for j = i + 1:n
                U(i, j) = (A(i, j) - L(i, 1:i - 1) * U(1:i - 1, j)) / L(i, i);
            end
        end
   end