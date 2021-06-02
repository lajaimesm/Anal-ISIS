disp('BISECCIÓN')

%Variables de entrada

xi=input('Inserte Intervalo mínimo: ');
xs=input('Inserte Intervalo máximo: ');
f=input('Inserte Función: ','s');
tol=input('Inserte tolerancia: ');
niter=input('Inserte iteraciones: ');


fx=inline(f,'x');
fxi=fx(xi);
fxs=fx(xs);

Xi=disp(xi);
Xs=disp(xs);
F=disp(f);
T=disp(tol);
N=disp(niter);
printf('f(Xi) = %f. \n\n',fxi);
printf('f(Xs) = %f. \n\n',fxs);


disp('----------------------------------------------------------');

fprintf('\n cont         xm                e \n');



if fxi==0
  printf('Xi = %i es una raíz',xi)
elseif fxs==0
  printf('Xs = %i es una raíz',xs)
elseif fxi*fxs<0
  xm=(xi+xs)/2;
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
     xm=(xi+xs)/2;
     fxm=fx(xm);
     e=abs(xm-xaux);
     fprintf('\n %g        %10.10f          %10.10f \n',cont,xm,e)
     cont=cont+1;
    end 

  if fxm==0
    printf('Xm = %i es una raíz',xm)
  elseif e<tol
    printf('Xm = %i es una aproximación con una toleracia de %e',xm,tol)
  else
    printf('Falló en %i iteraciones',niter)
  end
  
  %disp('El intervalo es inadecuado')
end



%GRAFICO DE LA FUNCIÓN

ezplot(f)

stem(cont,e)


grid on