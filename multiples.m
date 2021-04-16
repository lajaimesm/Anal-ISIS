disp('RAÍCES MULTIPLES')

%vbles entrada
tol=input('Inserte la tolerancia: ');
f=input('Inserte la función: ','s');
xo=input('Inserte el valor inicial: ');
niter=input('Inserte iteraciones: ');

fx=inline(f);
fxo=fx(xo);
df=input('Inserte la primer derivada de la función: ','s');
dfx=inline(df);
dfxo=dfx(xo);
dff=input('Inserte la segunda derivada de la función: ','s');
dffx=inline(dff);
dffxo=dffx(xo);


Xo=disp(xo);
F=disp(f);
dF=disp(df);
T=disp(tol);
N=disp(niter);

printf('f(xo) = %f.\n\n',fxo)
fprintf('\n cont         xm                e \n')

cont=0;
e=tol+1;

while ((e>tol && fxo~=0) && dfxo~=0) && cont<niter
  den=(dfxo^2)-(fxo*dffxo);
  x1=xo-((fxo)*(dfxo))/den;
  fxo=fx(x1);
  dfxo=dfx(x1);
  dffxo=dffx(x1);
  e=abs(x1-xo);
  xo=x1;
  fprintf('\n %g        %10.10f          %10.10f \n',cont,xo,e)
  cont=cont+1;
end

if fxo==0
  printf('xo=%i es una raíz',xo)
elseif e<tol
  printf('x1=%f es una aproximación a una raíz con una tolerancia de %e',x1,tol)
elseif den==0
  printf('x1=%f ies una posible raíz multiple',x1)
else 
  printf('Falló en %i iteraciones',niter)
end