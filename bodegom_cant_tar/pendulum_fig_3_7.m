%% Two damped, driven pendula starting off w/ a minor difference
% Fig 3.7 in the book
% Version 1.0 - Erik Bodegom
% 
clear;close all;
Fd=.5;        % driving force strength
w=2/3;      % driving force period
q=.5;        % damping if q=zero then no damping  0, .001, .005, .1, .5

tmax=12*2*pi; 
y_0=[0.2 .0 0.2-.00001 .0]';   % initial angle and initial omega
tspan=[0 tmax];
options = odeset('RelTol',1e-8,'MaxStep',.1,'InitialStep',1e-3);
[t,y] = ode45(@(t,y) fun_pend_fig_3_7(t,y,w,Fd,q),tspan,y_0,options);


Fd=1.2;
options = odeset('RelTol',1e-8,'MaxStep',.1,'InitialStep',1e-3);
[t1,y1] = ode45(@(t1,y1) fun_pend_fig_3_7(t1,y1,w,Fd,q),tspan,y_0,options);

scrsz = get(0,'ScreenSize');    %determines size of monitor=left,bottom,width,height
set(gcf,'OuterPosition',[1 20 scrsz(3)-60 scrsz(4)-20]);
x=abs(y(:,1)-y(:,3))+1e-11;         % Notice: we take absolute sign here... because we plot semilog
x1=abs(y1(:,1)-y1(:,3))+1e-11;      % Log do not like negative numbers, we add a small number so for sure no zero
semilogy(t,x,'b',t1,x1,'r');
xlabel('time');ylabel('difference between 2 pendula');
title('Blue is fig 3.7a and the red one is fig 3.7b','Fontsize',20)
grid on;
