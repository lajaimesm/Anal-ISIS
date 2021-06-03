% METODO DE BUSQUEDAS INCREMENTALES

format long %format long permite utilizar la maxima capacidad del computador


fprintf('BUSQUEDAS INCREMENTALES\n\n\n')

Xo = input('Ingrese el valor inicial\n');
Delta = input('\nIngrese el incremento (Delta)\n');
Iter = input ('\nIngrese el numero de iteraciones\n');
Fun = input ('\nIngrese la funcion en comillas simples\n');

f = inline(Fun); %El comando inline permite hacer la asignacion posterior de variables en una funcion.

Yo = f(Xo);

if Yo==0
    fprintf('\n\nSOLUCION:\n')
    fprintf ('Xo es raiz\n\n');
else
    X1 = Xo+Delta;
    Cont = 1;
    Y1 = f(X1);
    Z = [Cont,Xo,Yo,Yo*Y1];
    %Z es una matriz la cual permitira observar lo datos como una tabla al final del programa 

    while Yo*Y1>0 & Cont<Iter
        Xo = X1;
        Yo = Y1;
        X1 = Xo+Delta;
        Y1 = f(X1);
        Cont = Cont+1;
        Z(Cont,1) = Cont;
        Z(Cont,2) = Xo;
        Z(Cont,3) = Yo;
        Z(Cont,4) = Yo*Y1;
        %las z son las posiciones asignadas en la tabla a los resultados que se observaron
        
    end
    if Y1==0
        fprintf('\n\nSOLUCION:\n')
        fprintf('%g es raiz\n\n',X1);
    else
        if Yo*Y1<0
            fprintf('\n\nSOLUCION:\n')
            fprintf ('El intervalo que contiene la ra�z es[%g,%g]\n\n',Xo,X1);
        else
            fprintf('\n\nSOLUCION:\n')
            fprintf ('Fracaso en %g iteraciones\n\n',Iter);
        end
    end
end
fprintf('TABLA\n\nIteraciones                 Xo                  Yo                  Yo*Y1 \n\n');
disp(Z); %Muestra los datos en forma de tabla 
ezplot(f); %Muestra la funcion graficada
grid on %Muestra cuadricula en la grafica de la funcion


