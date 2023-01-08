function [Y] = solve_crout_LYB(A,B)
%Funkcja służy do rozwiązania równania L*Y=B
% gdzie L jest macierzą dolnotrójkątną o wymiarach nxn
% a Y i B są macierzami o wymiarach nxm
% zwraca wartość Y
% dane wejściowe A->L B->B
if size(A,1)~=size(B,1)
    error('number of rows of A and B matrix must be equal')
end
[n,m]=size(B);
Y=zeros(n,m);

for i=1:n
     j=1:i-1;
     y=A(i,j)*Y(j,:);
     Y(i,:)=(B(i,:)-y)/A(i,i);
    
end
end