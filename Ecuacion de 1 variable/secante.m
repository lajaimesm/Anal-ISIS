disp("SECANTE");

%vbles entrada
f=input('Ingresar función en términos de x: ','s');
f=inline(f);
tol=input('Ingrese la tolerancia : ');
x0=input('Ingrese primer valor inicial: ');
x1=input('Ingrese el segundo valor inicial: ');
niter=input('Ingrese iteraciones: ');
fx0=f(x0);

if fx0==0
  disp([num2str(x0)," es cero para la función ingresada."]) 
else
  fx1=f(x1);
  count=0;
  error=tol+1;
  den=fx1-fx0;
end

  while error>tol && fx1~=0 && den~=0 && count<niter
    x2=x1-fx1*(x1-x0)/den;
    error=abs(x2-x1);
    x0=x1;
    fx0=fx1;
    x1=x2;
    fx1=f(x1);
    den=fx1-fx0;
    count=count+1;
  end
  
  if fx1==0
    disp([num2str(x1)," Es cero para la función."])
  elseif error<tol
    disp([num2str(x1)," Es un valor aproximado a cero con una tolerancia de: ",num2str(tol)])
  elseif den==0
    disp("Hay una posible raíz multiple.")
  else
    disp("No se encontraron ceros con los datos ingresados.")
  end