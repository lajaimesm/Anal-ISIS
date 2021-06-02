disp('MÉTODO DE NEWTON')

%vbles de entrada
tol=input('Inserte tolerancia: ');
f=input('Inserte la función: ','s');
xo=input('Inserte valor inicial: ');
niter=input('Inserte iteraciones: ');

fx=inline(f);
fxo=fx(xo);
df=input('Inserte la primera derivada de la función: ','s');
dfx=inline(df);
dfxo=dfx(xo);

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
  x1=xo-(fxo/dfxo);
  fxo=fx(x1);
  dfxo=dfx(x1);
  e=abs(x1-xo);
  xo=x1;
  fprintf('\n %g        %10.10f          %10.10f \n',cont,xo,e)
  cont=cont+1;
end

if fxo==0
  printf('xo=%i es una raíz',xo)
elseif e<tol
  printf('x1=%f es una aproximación de una raíz con tolerancia de %e',x1,tol)
elseif dfxo==0
  printf('x1=%f es una posible raíz multiple',x1)
else 
  printf('Falló en %i iteraciones',niter)
end