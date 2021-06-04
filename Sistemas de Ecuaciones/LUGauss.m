function [Fin] = LUgauss(A,b)
%Matriz aumentada
[f c]=size(A);

cont=0;
parar=false;

L=eye(f,f);

for q=1:f-1
    if(A(q,q)==0)
        parar=true;
        disp("No se puede factorizar")
        disp("Es necesario hacer intercambio de filas en la etapa"+q)
        break;
    end
    
    disp("Etapa " +q)
    
    %Buscar el elemento mayor 
    aij=max(abs(A(q:f,q)));
    i=find(abs(A(:,q))==aij);
    
    %Procedo a realizar la eliminacion
    m=[];
    for k=q:f-1
        cont=cont+1;
        m(k)=A(k+1,q)/A(q,q);
        L(k+1,q)=m(k);
        Mul(cont)=m(k);
    end
    
    %Calculo las nuevas filas
    for n=q:f-1
        A(n+1,:)=A(n+1,:)-m(n).*A(q,:);
    end
    A;
    U=A
    L
end


%FACTORIZACIoN LU
while parar==false
    %SOLUCIoN DEL PROBLEMA
    %Encontrar las soluciones zi con sustitucion progresiva
    Lb=[L b]
    for b=1:f
        suma=0;
        for k=1:b-1
            suma=suma+Lb(b,k)*z(k,1);
        end
        z(b,1)=(Lb(b,f+1)-suma);
    end
    
    %Imprimir soluciones zi
    for j=1:f
        disp("z"+j+": "+z(j))
    end
    
    %Encontrar las soluciones xi aplicando sustitucion regresiva
    Uz=[U z];
    for d=f:-1:1
        suma=0;
        for k=d+1:f
            suma=suma+Uz(d,k)*x(k,1);
        end
        x(d,1)=(Uz(d,f+1)-suma)/Uz(d,d);
    end
    
    %Imprimir soluciones xi
    for j=1:f
        disp("x"+j+": "+x(j))
    end
    
    parar=true;
end
end

