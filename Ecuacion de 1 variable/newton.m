%METODO DE NEWTON

fprintf('METODO DE NEWTON\n\n\n');

format long;  %format long permite utilizar la maxima capacidad del computador

Xo = input ('ingrese el valor inicial\n');
Iter = input ('\ningrese el numero de iteraciones\n');
Tol = input ('\ningrese la tolerancia que desea\n');
F = input ('\ningrese la funcion en comillas simples\n');

f=inline(F);%El comando inline permite hacer la asignacion posterior de variables en una funcion

Y1 = f(Xo);
Derivada = diff(F)%Se esta calculando la derivada de la funcion F
Der = char(Derivada);%Convierte los valores a texto
D = inline(Der);
De = D(Xo);%Se evalua la derivada en la X inicial, y asi saber si es adecuada para
%ejecutar el resto del metodo, es decir si es diferente de cero.
Error = Tol+1;
Cont = 0;
Z1 = [Cont, Xo, Y1, De, Error];

%Z es una matriz la cual permitira observar lo datos como una tabla al final del programa
Z= [Cont, Xo, Y1, De, Error];

while Y1~=0 && Error>Tol && Cont<Iter && De~=0
    X1 = Xo-(Y1/De);
    Y1 = f(X1);
    De = D(X1);
    Error = abs((X1-Xo)/X1);
    Cont = Cont+1;
    Z(Cont,1) = Cont;
    Z(Cont,2) = Xo;
    Z(Cont,3) = Y1;
    Z(Cont,4) = De;
    Z(Cont,5) = Error;
    %las z son las posiciones asignadas en la tabla a los resultados que se observaron
   
    Xo=X1;

end

if Y1==0
    fprintf('\n\nSOLUCION:\n')
    fprintf('%g es raiz\n\n',Xo);
else
    if Error<Tol
        fprintf('\n\nSOLUCION:\n')
        fprintf( '%g es una aproximacion a una raiz con una tolerancia %g \n\n',Xo,Tol)
    else
        if De==0
            fprintf('\n\nSOLUCION:\n')
            fprintf('Se esta haciendo division por cero y Xo posiblemente es una raiz multiple\n\n')
        else
            fprintf('\n\nSOLUCION:\n')
            fprintf('Fracaso en %g iteraciones\n\n',Iter);
        end
    end
end

fprintf('TABLA\n\n Cont                  Xn                   f(Xn)               f2(Xn)               Error relativo\n\n');
disp(Z1);
disp(Z);

ezplot(f);%Muestra la funcion graficada


grid on %muestra cuadricula en la grafica de la funcion



