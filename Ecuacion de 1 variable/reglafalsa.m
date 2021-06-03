%REGLA FALSA

fprintf('METODO REGLA FALSA\n\n\n');
format long;%format long permite utilizar la maxima capacidad del computador


Xi = input ('Ingrese el limite inferior del intervalo\n');
Xs = input ('\nIngrese el limite superior del intervalo\n');
Tol = input ('\nIngrese la tolerancia deseada\n');
Iter = input ('\nIngrese el numero de iteraciones\n');
Fun = input ('\nIngrese la funcion entre comillas simples\n');


f = inline (Fun);%El comando inline permite hacer la asignacion posterior de variables en una funcion.

Yi = f(Xi);
Ys = f(Xs);

if Yi == 0
    fprintf('\n\nSOLUCION:\n')
    fprintf('Xi es raiz\n\n');
else
    if Ys == 0
        fprintf('\n\nSOLUCION:\n')
        fprintf('Xs es raiz\n\n');
    else
        if Yi*Ys < 0
            Xm = (Xi)-((f(Xi)*(Xi-Xs))/(f(Xi)-f(Xs)));
            Ym = f(Xm);
            Error = Tol+1;
            Cont = 1;
            Z = [Cont,Xi,Xs,Xm,Ym,Error];
            %Z es una matriz la cual permitira observar lo datos como una tabla al final del programa
        
            while Ym~=0 && Error>Tol && Cont<Iter

                if Yi*Ym < 0
                    Xs = Xm;
                    Ys = Ym;
                else
                    Xi = Xm;
                    Yi = Ym;
                end
                Xaux = Xm;
                Xm = (Xi)-((f(Xi)*(Xi-Xs))/(f(Xi)-f(Xs)));
                Ym = f(Xm);
                Error = abs(Xm-Xaux)/Xm;
                Cont = Cont+1;
                Z(Cont,1) = Cont;
                Z(Cont,2) = Xi;
                Z(Cont,3) = Xs;
                Z(Cont,4) = Xm;
                Z(Cont,5) = Ym;
                Z(Cont,6) = Error;
                %las z son las posiciones asignadas en la tabla a los resultados que se observaron

            end
            if Ym == 0
                fprintf('\n\nSOLUCION:\n')
                fprintf('%g es raiz\n\n',Xm);
            else
                if Error<Tol
                    fprintf('\n\nSOLUCION:\n')
                    fprintf( '%g es una aproximacion a una ra�z con una tolerancia %g \n\n',Xm,Tol);
                else
                    fprintf('\n\nSOLUCION:\n')
                    fprintf('Fracaso en %g iteraciones\n\n',Iter);
                end
            end
        else
            fprintf('\n\nSOLUCION:\n')
            fprintf('El intervalo es inadecuado\n\n');
        end
    end
end
fprintf('TABLA\n\nIteraciones                   Xi                    Xs                   Xm                 Ym             Error Absoluto\n\n');
disp(Z)
ezplot(f);
%fplot(f,[-1 10]);%Muestra la funcion graficada
grid on %Muestra cuadricula en la grafica de la funcion


