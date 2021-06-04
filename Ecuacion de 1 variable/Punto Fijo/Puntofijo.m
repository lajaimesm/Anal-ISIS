%METODO DE PUNTO FIJO

fprintf('METODO PUNTO FIJO\n\n\n');

format long;%format long permite utilizar la maxima capacidad del computador


Xo = input('ingrese el valor inicial\n');
Iter = input('\ningrese el n�mero de iteraciones\n');
Tol = input('\ningrese la tolerancia que desea\n');
Fun = input('\ningrese la funcion en comillas simples\n');
G = input('\ningrese la funcion despejada en comillas simples\n');

f = inline(Fun);
g = inline(G);%El comando inline permite hacer la asignaci�n posterior de variables en una funcion.

Yn = f(Xo);
Error = Tol+1;
Cont = 0;
Z1 = [Cont,Xo,Yn,Error];
%Z es una matriz la cual permitira observar lo datos como una tabla al final del programa

Z = [Cont,Xo,Yn,Error];
while Yn~=0 & Error>Tol & Cont<Iter
    Xn = g(Xo);
    Yn = f(Xn);
    Error = abs((Xn-Xo)/Xn);
    %Error = abs(Xn-X0);
    Cont = Cont+1;
    Z(Cont,1) = Cont;
    Z(Cont,2) = Xn;
    Z(Cont,3) = Yn;
    Z(Cont,4) = Error;
    %las z son las posiciones asignadas en la tabla a los resultados que se observaron
    
    Xo = Xn;
end

if Yn == 0
    fprintf('\n\nSOLUCION:\n')
    fprintf('%g es raiz\n\n',Xo);
else
    if Error<Tol
        fprintf('\n\nSOLUCION:\n')
        fprintf('%g es una aproximacion con un tolerancia de %g\n\n',Xo,Tol);
    else
        fprintf('\n\nSOLUCION:\n')
        fprintf('Fracaso en %g iteraciones\n\n',Iter);
    end
end
fprintf('TABLA\n\n Cont                   Xn                    Yn                 Error Relativo\n\n')
disp(Z1);
disp(Z);
ezplot(f); %Muestra la funcion graficada
grid on %Muestra cuadricula en la grafica de la funcion



