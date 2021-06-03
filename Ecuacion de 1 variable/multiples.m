%METODO RAICES MULTIPLES

fprintf('METODO RAICES MULTIPLES\n\n\n');

format long;%format long permite utilizar la maxima capacidad del computador


Xo = input ('ingrese el valor inicial\n');
Iter = input ('\ningrese el n�mero de iteraciones\n');
Tol = input ('\ningrese la tolerancia que desea\n');
F = input ('\ningrese la funci�n en comillas simples\n');

f = inline(F);%El comando inline permite hacer la asignacion posterior de variables en una funcion


Y1 = f(Xo);
Di = diff (F); %Calculando la derivada de la funcion F
Der = char(Di);%regresa los valores a texto
De = inline(Der);
D = De(Xo);%Se evalua la derivada en la X inicial, y asi saber si es adecuada para ejecutar el resto del metodo.
Di2 = diff(F,2);%Calculando la segunda derivada de la funcion F
Der2 = char(Di2);
Deri2 = inline (Der2);
D2 = Deri2 (Xo);%Se evalua la segunda derivada en la X inicial, y asi saber si es adecuada para ejecutar el resto del metodo.
Error = Tol+1;
Cont = 0;
Denominador =D^2-(Y1*D2);
Z1 = [Cont, Xo, Y1, D, Error];
Z = [Cont, Xo, Y1, D, Error];%Z es una matriz la cual permitira observar lo datos como una tabla al final del programa

while Y1~=0 && Error > Tol && Cont < Iter && Denominador~=0

    X1=Xo-((Y1*D)/(D^2-(Y1*D2)));
    Y1=f(X1);
    D=De(X1);
    D2=Deri2(X1);
    Error=abs((X1-Xo)/X1);
    Cont=Cont+1;
    Z(Cont,1)=Cont;
    Z(Cont,2)=Xo;
    Z(Cont,3)=Y1;
    Z(Cont,4)=D;
    Z(Cont,5)=D2;
    Z(Cont,6)=Error;
    %las z son las posiciones asignadas en la tabla a los resultados que se observaron
   
    Xo=X1;
end

if Y1==0
    fprintf('\n\nSOLUCION:\n')
    fprintf('%G es ra�z\n\n',Xo);
else
    if Error<Tol
        fprintf('\n\nSOLUCION:\n')
        fprintf( '%g es una aproximacion a una ra�z con una tolerancia %g \n\n',Xo,Tol)
    else
        if Denominador==0
            fprintf('\n\nSOLUCION:\n')
            fprintf('Se esta haciendo division por cero\n\n')
        else
            fprintf('\n\nSOLUCION:\n')
            fprintf('Fracaso en %g iteraciones\n\n',Iter);
        end
    end
end
fprintf('TABLA\n\n Cont                   Xn                  f(Xn)              f�(Xn)                f��(Xn)              Error Relativo\n\n');
disp(Z1);
disp(Z);%La funcion disp permite visualizar la tabla
ezplot(f);%Muestra la funcion graficada
grid on %muestra cuadricula en la grafica de la funcion



