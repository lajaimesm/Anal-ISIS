% METODO DE LA SECANTE

fprintf('METODO DE LA SECANTE\n\n\n');

format long;%format long permite utilizar la m�xima capacidad del computador

Xo = input('ingrese xo\n');
X1 = input('\ningrese x1\n');
Tol = input('\ningrese la tolerancia\n');
Iter = input('\ningrese el n�mero de iteraciones\n');
Fun = input('\ningrese la funci�n entre comillas simples\n');

f=inline (Fun); %El comando inline permite hacer la asignaci�n posterior de variables en una funcion

yo=f(Xo);

if yo == 0
    fprintf('\n\nSOLUCION:\n')
    fprintf('xo es raiz\n');

else
    y1 =f(X1);
    d =(y1-yo);
    e =Tol+1;
    cont =0;
    Z1 = [cont,X1, y1, e];
    Z = [cont,X1, y1, e];
    %Z es una matriz la cual permitira observar lo datos como una tabla al final del programa

    while y1~=0 & e>Tol && cont<Iter && d~=0

        X2 =  X1-((y1*(X1-Xo))/(d));
        e = abs((X2-X1)/X2);
        %e = abs(X2-X1);
        Xo = X1;
        yo = y1;
        y1 = f(X2);
        X1 = X2;
        d = (y1-yo);
        cont = cont+1;
        Z(cont,1) = cont;
        Z(cont,2) = X1;
        Z(cont,3) = y1;
        Z(cont,4) = e;
        %las z son las posiciones asignadas en la tabla a los resultados que se observaron
        
    end

    if y1 == 0
        fprintf('\n\nSOLUCION:\n')
        fprintf('%g es ra�z\n\n',X1);
    else
        if e < Tol
            fprintf('\n\nSOLUCION:\n')
            fprintf( '%g es una aproximacion a una ra�z con una tolerancia %g \n\n',X1,Tol)
        else
            if d == 0
                fprintf('\n\nSOLUCION:\n')
                fprintf('el denominador es cero, FRACASO\n\n');
            else
                fprintf('\n\nSOLUCION:\n')
                fprintf('Fracaso en %g iteraciones\n\n',Iter);
            end
        end
    end
end
fprintf('TABLA\n\ninteraciones               Xn               y1                 Error relativo\n\n');
disp(Z1);
disp(Z);
%ezplot(f);
fplot(f,[-1 15]); %Muestra la funcion graficada


grid on %Muestra cuadricula en la grafica de la funcion



