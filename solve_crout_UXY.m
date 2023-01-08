function [X] = solve_crout_UXY(A,B)
%Funkcja służy do rozwiązania równania U*X=Y
% gdzie U jest macierzą górnotrójkątną o wymiarach nxn
% a X i Y są macierzami o wymiarach nxm
% zwraca wartość X
% dane wejściowe A->U B ->Y
if size(A,1)~=size(B,1)
    error('number of rows of A and B matrix must be equal')
end
[n,m]=size(B);
X=zeros(n,m);

for i=n:-1:1
     j=n:-1:i+1;
     x=A(i,j)*X(j,:);
     X(i,:)=(B(i,:)-x)/A(i,i);
    
end
end