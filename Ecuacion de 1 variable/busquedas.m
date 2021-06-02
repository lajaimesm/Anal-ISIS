
disp("BUSQUEDAS INCREMENTALES");

a=input("Ingrese el menor valor del intervalo: ");

b=input("Ingrese el mayor valor del intervalo: ");

d=input("Ingrese el delta: ");

f=input("Ingrese la función en términos de X: ",'s');

f=inline(f);



disp('----------------------------------------------------------');


%Variables -------------------------------------------

con=1;

con2=0;

int=0; %intervalos con posibles ceros en la funcion

z=0; %Ceros en la funcion


%Metodo ---------------------------------------------------------------

for i=a:d:b-d

  if f(i)==0 
   roots(con2+1,1)=i;
   con2=con2+1;
   z=1;   

  else
    fx0=f(i);
    fx1=f(i+d);    

    if fx0*fx1<0
       int=1;
       ranges(con,1)=i;
       ranges(con,2)=i+d;
       con=con+1;
    end
  end
end

 if f(b)==0
    roots(con2+1,1)=b;
    z=1;
 end  

if z==1
  disp("Los siguientes valores son ceros para la función: ")
  disp(roots)
end

if int==1
  disp("Rangos con posibles ceros: ")
  disp(ranges)
elseif z==1
  disp("No hay intervalos adicionales con ceros: ")
elseif z==0
  disp("No hay ceros: ")
end