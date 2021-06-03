

fprintf('REVISION DERIVADAS \n\n\n');

format long

Xo = input ('ingrese el valor inicial \n');
Xf = input ('ingrese el valor final \n');
G = input ('\n ingrese la funcion G\n');



Di = diff(G);
Der = char(Di);
D = inline(Der);
cont = 0;
Deri = D(Xo);

Z = [Xo,Deri];

while   Deri>-1 & Deri<1 & Xo<Xf
    cont = cont+1;
    Xo = Xo+0.1;
    Deri = D(Xo);
    Z(cont,1) = Xo;
    Z(cont,2) = Deri;
end
if Deri<-1
    fprintf('La funcion tiene derivadas menores de -1 y mayores 1 en %g\n\n',Xo);
else
    if Deri>1
        fprintf('La funcion tiene derivadas menores de -1 y mayores 1 en %g\n\n',Xo);
    else
        if Xo>Xf
            fprintf('La funcion tiene derivadas entre -1 y 1, FUNCION CORRECTA\n\n');
        else
            fprintf('La funcion tiene derivadas entre -1 y 1 FUNCION CORRECTA\n\n');
        end
    end
end

disp(Z);
ezplot(D); %Muestra la funcion graficada
grid on %Muestra cuadricula en la grafica de la funcion

%E= error absoluto nso dice sobre los decimales correctos y su cota es de
%E<0.5*10^-d

%e= error relativo nos dice sobre las cifras significativas y su cota es de
%e<5*10^-k
