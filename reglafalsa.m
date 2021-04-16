
disp('REGLA FALSA')

%Variables de entrada

xi=input('Inserte intervalo mínimo: ');
xs=input('Inserte intervalo máximo: ');
f=input('Inserte la función: ','s');
tol=input('Inserte la tolerancia: ');
niter=input('Inserte iteraciones: ');

fx=inline(f,'x');
fxi=fx(xi);
fxs=fx(xs);

Xi=disp(xi);
Xs=disp(xs);
F=disp(f);
T=disp(tol);
N=disp(niter);

printf('f(Xi) = %f. \n\n',fxi)
printf('f(Xs) = %f. \n\n',fxs)

fprintf('\n cont         xm                e \n')

if fxi==0
  printf('Xi = %i es una raíz',xi)
elseif fxs==0
  printf('Xs = %i es una raíz',xs)
elseif fxi*fxs<0
  xm=(xi-(fxi)*(xs-xi))/(fxs-fxi);
  fxm=fx(xm);
  cont=1;
  e=tol+1;
end

  while (e>tol && fxm~=0) && cont<=niter
    if fxi*fxm<0
      xs=xm;
      fxs=fxm;
    else
      xi=xm;
      fxi=fxm;
     endif
     xaux=xm;
     xm=(xi-(fxi)*(xs-xi))/(fxs-fxi);
     fxm=fx(xm);
     e=abs(xm-xaux);
     fprintf('\n %g        %10.10f          %10.10f \n',cont,xm,e)
     cont=cont+1;
    end  

  if fxm==0
    printf('Xm = %i es una raíz',xm)
  elseif e<tol
    printf('Xm = %i es una aproximación a una raíz con una tolerancia de %e',xm,tol)
  else
    printf('Falló en %i iteraciones',niter)
  %disp('El intervalo es inadecuado')
  end

ezplot(f)

grid on