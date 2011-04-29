%% Damped, driven pendulum
% Version 1.0 - Erik Bodegom
% 
clear;close all;
Fd=0;        % driving force strength
w=2/3;      % driving force period
q=.0;        % damping if q=zero then no damping  0, .001, .005, .1, .5

tmax=5*2*pi; 
y_0=[0. .01]';   % initial angle and initial omega
tspan=[0 tmax];
options = odeset('RelTol',1e-10,'MaxStep',.1,'InitialStep',1e-3);
[t,y] = ode113(@(t,y) fun_pend_damping(t,y,w,Fd,q),tspan,y_0,options);
length(t)
scrsz = get(0,'ScreenSize');    %determines size of monitor=left,bottom,width,height
set(gcf,'OuterPosition',[1 20 scrsz(3)-60 scrsz(4)-20]);
subplot(2,2,1);
ener=1-cos(y(:,1))+0.5*y(:,2).^2-.5*y_0(2).^2; %(1-cos(y_0(1)));
plot(t,ener,'b')
grid on;
gr_title=strcat('Energy as a function of time, q=', num2str(q));
title(gr_title,'Fontsize',20);
xlabel('time');ylabel('energy change from start');

subplot(2,2,2);
plot(t,y(:,1),'r',t,y(:,2),'b')
title('\theta=red and \omega=blue','Fontsize',20)
grid on;
xlabel('time');ylabel('\theta and \omega');

%% Part 2
subplot(2,2,3);
plot(y(:,1),y(:,2),'g')
title('\theta versus \omega','Fontsize',20)
grid on;
xlabel('\theta');ylabel('\omega');

tspan=tspan*10;
[t,y] = ode113(@(t,y) fun_pend_damping(t,y,w,Fd,q),tspan,y_0,options);
n=length(t)
n1=round(n/10);
subplot(2,2,4);
plot(y(n1:n,1),y(n1:n,2),'g');
gr_title=sprintf('theta versus omega from');
gr_title=strcat(gr_title, num2str(t(n1),3),'  to  ',num2str(t(n),3));
title(gr_title,'Fontsize',20);
grid on;
xlabel('\theta');ylabel('\omega');
