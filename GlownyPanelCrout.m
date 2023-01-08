fprintf("start")
%Przykład pierwszy 
%AX=B
%XA=B
A = gallery("gcdmat",10);
B=randn(10,4);
Display_example(A,B);


%Przykład drugi B=I
%AX=B
%XA=B
fprintf("B jednostkowa")
A = gallery("gcdmat",10);
B=eye(10);
Display_example(A,B);


%Przykład trzeci B=I
%AX=B
%XA=B
fprintf("B jednostkowa")
A = [1,7,3;4,0,6;7,1,9];
B=eye(3);
Display_example(A,B);


%Przykład czwarty
%AX=B
%XA=B

A = [1,7,3;4,0,6;7,1,9];
B=[0,2;1,4;7,15];
Display_example(A,B);



%Przykład piąty B=AX=XA
%AX=B
%XA=B
fprintf("B=AX=XA")
A=[2,0;1,-1];
B=[6,0;2,0];
Display_example(A,B);


%Przykład szósty
%AX=B
%XA=B
A = gallery("gcdmat",5);
B=randn(5,4);
Display_example(A,B);


%PONIŻEJ ZNAJDUJĄ SIĘ KODY DO RYSOWANIA WYKRESÓW, DZIAŁAJĄ ONE POJEDYNCZO

% poniższy kod pokazuje na wykresie jak zmienia się błąd względny
%w zaleznośći od rozmiaru macierzy A
% błąd wzgledny:
% z- dokładne rozwiązanie układu Ax=B, 
% X obliczone numerycznie przybliżenie  
% błąd względny ||X-z||/||z||

y=repelem(0,100);
x=1:100;
for i=x
    A=gallery("gcdmat",i);
    B=randn(i,1);
    X = solve_crout_LUX(A, B);
    z = inv(A)*B;
    y(i)= norm(z-X)/norm(z);
end
hold on
plot(x,y)
title("Wielkość błędu względnego w zależności od rozmiaru macierzy dla xA=B")

xlabel("rozmiar macierzy kwadratowej A")
ylabel("wielkość błędu")
hold off

% poniższy kod pokazuje na wykresie jak zmienia się błąd względny
%w zaleznośći od rozmiaru macierzy A
% błąd wzgledny:
% z- dokładne rozwiązanie układu xA=B, 
% X obliczone numerycznie przybliżenie  
% błąd względny ||X-z||/||z||

y=repelem(0,100);
x=1:100;
for i=x
    A=gallery("gcdmat",i);
    B=randn(1,i);
    X = solve_crout_XLU(A, B);
    z = B*inv(A);
    y(i)= norm(z-X)/norm(z);
end
hold on
plot(x,y)
title("Wielkość błędu względnego w zależności od rozmiaru macierzy dla xA=B")

xlabel("rozmiar macierzy kwadratowej A")
ylabel("wielkość błędu")
hold off

%poniższy kod pokazuje na wykresie jak zmienia się błąd względny
%w zaleznośći od liczby kolumn macierzy B
% błąd wzgledny:
% z- dokładne rozwiązanie układu XA=B, 
% X obliczone numerycznie przybliżenie  
% błąd względny ||X-z||/||z||

y=repelem(0,100);
x=1:100;
for i=x
    A=gallery("gcdmat",10);
    B=randn(i,size(A,1));
    X = solve_crout_XLU(A, B);
    z = B*inv(A);
    y(i)= norm(z-X)/norm(z);
end
hold on
plot(x,y)
title("Wielkość błędu względnego w zależności od liczby kolumn macierzy B dla Ax=B")
xlabel("liczba kolumn macierzy B")
ylabel("wielkość błędu")
hold off

%poniższy kod pokazuje na wykresie jak zmienia się błąd względny
%w zaleznośći od liczby kolumn macierzy B
% błąd wzgledny:
% z- dokładne rozwiązanie układu AX=B, 
% X obliczone numerycznie przybliżenie  
% błąd względny ||X-z||/||z||

y=repelem(0,100);
x=1:100;
for i=x
    A=gallery("gcdmat",10);
    B=randn(size(A,1),i);
    X = solve_crout_LUX(A, B);
    z = inv(A)*B;
    y(i)= norm(z-X)/norm(z);
end
hold on
plot(x,y)
title("Wielkość błędu względnego w zależności od liczby kolumn macierzy B dla Ax=B")
xlabel("liczba kolumn macierzy B")
ylabel("wielkość błędu")
hold off

%poniższy kod rysuje czasa rozwiązywania równań Ax=B i xA=B dla 
%rozmiarów macierzy A [1,100]
y=repelem(0,100);
x=1:100;
for i=x
    A=gallery("gcdmat",i);
    B=randn(i,2);
    y(i)=time_comparing(A,B);
end
hold on
plot(x,y)
title("Czas rozwiązywanie układów równań xA=B oraz Ax=B")
xlabel("Rozmiar macierzy A")
ylabel("czas")
hold off
%poniższy kod rysuje roznice czasu rozwiązywania równań Ax=B i xA=B dla 
%liczby kolumn\wierszy macierzy B[1,100]
y=repelem(0,100);
x=1:100;
for i=x
    A=gallery("gcdmat",10);
    B=randn(size(A,1),i);
    y(i)= time_comparing(A,B);
end
hold on
plot(x,y)
title("Czas rozwiązywanie układów równań xA=B oraz Ax=B")
xlabel("liczba kolumn macierzy B")
ylabel("czas")
hold off

