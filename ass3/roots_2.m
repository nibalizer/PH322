%% Version 1.0 - Finding roots - Erik Bodegom
%% bisection:  finding roots

close all;
inline_fun1=inline('3.*x.^3-2*x.^2+5*x-1','x')
inline_fun2=inline('cos(x)-x','x')
inline_fun3=inline('(x.^8)/40320-(x.^6)/720+(x.^4)/24-(x.^2)/2-x+.5','x')
inline_DF1=inline('6*x.^2-4*x+5','x')
inline_DF2=inline('sin(x)-1','x')
inline_DF3=inline('8/40320*x.^7-6/720*x.^5+4*x.^3/2-1','x')

xbot=-1;
xtop=1;
tol=1e-10;                          %Rel. tolerance--> 1E-10
x=xbot:(xtop-xbot)/100:xtop;
y=inline_fun1(x);
plot(x,y,'b:',x,0*x,'k-',[0 0],[-12 6],'k-');
title('blue=inline1, red=inline2, green=inline3');
hold on;
grid on;
fprintf('Bisection \t Tolerance: %e \n',tol)
bot=inline_fun1(xbot);
top=inline_fun1(xtop);
i=0;
tol_tst=1;
% set tol_tst, the error, to 1 so it won't trigger the while before the loop gets started
while tol_tst>tol;
    i=i+1;
    z=(xtop+xbot)/2;
    tol_tst=xtop-xbot;
    test=inline_fun1(z);
    if (test*bot<0);
        xtop=z;
        top=test;
    else;
        xbot=z;
        bot=test;
        fprintf('%3d \t %10.9e \t %7.4e \n',i,z,tol_tst)
    end;
    %3d \t %10.9e \t %7.4e means print the following numbers as: 3 digits, exponential notation, ditto
    if z~0;
        tol_tst=tol_tst/z;  %notice relative tolerance... why?
    end;
end;

%% Newton-Raphson:  finding roots

fprintf('\n Newton-Raphson \n')
tol=1e-10;                          %Rel. tolerance--> 1E-10
x=7.39085e-001;
x=1;
i=0;
tol_tst=1;
while tol_tst>tol && i<30;
    i=i+1;
    test=x-inline_fun1(x)/inline_DF1(x);
    if x~0;
        tol_tst=abs((x-test)/x);
        fprintf('%3d \t %10.9e \t %10.9e \t %7.4e \n',i,x,inline_fun1(x),inline_DF1(x))
        x=test;
    end;
end;


%% Regula falsi: finding roots

fprintf('\n Regula falsi \n')
fplot(inline_fun2,[-1 1],'r-')
fprintf('Iter     best guess                 xbot                 xtop          inline_fun2(best guess)\n')
xbot=-.55;
xtop=1.;
bot=inline_fun2(xbot);
top=inline_fun2(xtop);
tol_tst=1;
i=0;
test=1;
while tol_tst>tol;
    fprintf('%3d \t %10.9e \t %10.9e \t %7.4e \t %7.4e \n',i,z,xbot,xtop,test)
    i=i+1;
    z=xtop-top*(xbot-xtop)/(bot-top);
    test=inline_fun2(z);
    if (test*bot<0);
        xtop=z;
        top=test;
    else;
        xbot=z;
        bot=test;
    end;
    if z~0;
        tol_tst=test/z;
    end;
end;

%% Secant: finding roots
fprintf('\n Secant \n')
fplot(inline_fun3,[-1 1],'g-')
fprintf('Iter        xmid              xlast           inline_fun3(last guess)\n')
xlast=-.5;
xmid=-.2;
last=inline_fun3(xlast);
mid=inline_fun3(xmid);
i=0;
mid=inline_fun3(xmid);
last = inline_fun3(xlast);
tol_tst = 1;
while tol_tst > tol || i>20;
    i =i+1;
    z=xmid-mid *(xmid-xlast)/(mid-last);
    last=mid;
    xlast=xmid;
    mid=inline_fun3(z);
    xmid=z;
    fprintf('%3d \t %10.9e \t %10.9e \t %7.4e \n',i, xmid, xlast, mid)
    if z ~= .0;
        tol_tst = abs(mid/z);
    end;
end;

%% Matlab fzero uses Brent-Dekker method (mix of bisection, secant, and quadratic interpolation
[x,f,exitflag,output]=fzero(inline_fun3,0);
fprintf('\n Built-in Matlab: fzero \n')
fprintf('x= \t %g  \n',x)
disp(output)
