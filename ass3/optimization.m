%% optimization using the golden section rule
% Version 1.0 - Erik Bodegom

close all;
inline_fun=inline('(x+5).^2 +pi/10','x');
%inline_fun=inline('3*x.^4-2*x.^2+5*x+1','x')

xb=-10;
xt=10;
x=linspace(xb,xt,100);
y=inline_fun(x);
plot(x,y,'r-')
grid on;

g=(sqrt(5)-1)/2;  %golden ratio

tol=1.e-12;          % tolerance-->[1E-12]
fb=inline_fun(xb);
ft=inline_fun(xt);
d=(xt-xb)*g ;        % distance between top and bottom * golden ratio
xm=xb+d;             % midpoint
fm=inline_fun(xm);
fprintf('\nOptimization: \nIteration    xt-xb           ft-fb               (ft-fb)/fm \n');
for k=1:100;     %limit % of computations to 100
    if (xm-xb)>(xt-xm);
        d=(xm-xb)*g;
    else
        d=(xt-xm)*g;
    end;
    if (xm-xb)>(xt-xm);
        x=xb+d;
        f=inline_fun(x);
        if f<fm && f<fb;
            ft=fm;
            xt=xm;
            xm=x;
            fm=f;
        else
            xb=x;
            fb=f;
        end;
    else
        x=xm+d;
        f=inline_fun(x);
        
        if f<fm && f<ft;
            xb=xm;
            fb=fm;
            xm=x;
            fm=f;
        else
            xt=x;
            ft=f;
        end;
    end;
    fprintf(' %3d \t %9.7e \t %9.7e \t %9.7e \n', k,xt-xb,(ft-fb),(ft-fb)/fm);
    if abs(xt-xb)<tol;
        break;  % this terminates the loop prior to completion of the "for" loop
    end;
end;

fprintf('\n %3d %9.7e \t %9.7e \t %9.7e \n' ,k,xb,xm,xt)
fprintf('%3d %9.7e \t %9.7e \t %9.7e \t %8.2e \n' ,k,fb,fm,ft,tol)

