%% version 1.0 Erik Bodegom
% pathological function,  finding roots

close all;
inline_fun=inline('3.*x.^2+log((pi-x).^2)/pi^4+1','x')
dx=0;
m=['b' 'g' 'r' 'c' 'y'];
hold on
for k=1:4;
    dx=.01*.1^(k)
    x=1:dx:4;
    y=inline_fun(x);
    plot(x,y,m(k))
    
end;
title('3x^2 + log((pi-x)^2) /pi^4 + 1 from 1 to 4','FontSize',22);
hold off;
%% revisit same function but rewritten
% Substiute x with x+pi   Obviously the log will give problems or at least it should!
% we will do our best to avoid x=0: logs do NOT like zeros!

inline_fun=inline('3.*(x+pi).^2+log((x).^2)/pi^4+1','x')
x=zeros(502,4);
hold on;
for k=1:4;
    dx=1e-18*.01^(k)
    x(:,k)=-250.5*dx:dx:250.5*dx;
end;
y=inline_fun(x);

createfigurePathological(x(:,1),y(:,1),x(:,2),y(:,2),x(:,3),y(:,3),x(:,4),y(:,4));
