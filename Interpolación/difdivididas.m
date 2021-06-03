%Diferencias Divididas 

fprintf('Metodo de diferencias divididas');
syms x
fun = input('- Defina la función                 : ');
X = input('- Introduzca los valores de x       : ');
Y = input('- Introduzca los valores de y       : ');
z = input('- Introduzca el valor a aproximar   : ');
n = length(X);
D = zeros(n,n);

D(:,1) = Y;

for j=2:n
    for k=j:n
        D(k,j)=(D(k,j-1)-D(k-1,j-1))/(X(k)-X(k-j+1))
    end
end

s=1;
c=0;
q=0;
p=0;
for k=2:n
    for j=k
        s=1;
        for m=1:1
            q=q+1;
            for h=1:(k-1)
                s=s*(z-X(k-q));
                q=q-1;
            end
            p=p+1;
            q=q+p;
        end
    end
    c=c+(D(k,j)*s);
end

for k=1:1
    for j=k
        c=c+(D(k,j));
    end
end
fprintf('\n');
fprintf('- El resultado es           : %10.8f\n',c);
fprintf('\n');
d=subs (fun,z);
fprintf('- La función evaluada es    : %10.8f\n',d);
fprintf('\n');
w=abs(d-c);
fprintf('- El porcentaje de error es : %10.8f\n',w);
fprintf('\n');