%% Various approx methods for a simple ODE:  
% mass on a spring: solving y"=-y or a simple pendulum
% Version 1.0 - Erik Bodegom
% We will follow the energy for the simple pendulum for 100 seconds
% What is the solution?  What is the period?
% total energy=0.5*mv^2+mgh = conserved

clear;close all;
%% Euler
y(1)=0;         %initial value for position
y(2)=1;         %initial value for velocity at the lowest point
y_0=y';
y=y_0;
n=10000;       % number of steps for Euler
h=0.01;         % delta_t, 10K steps
t=zeros(n,1);
ener=t;
for k=2:n;
    y=y+h*fun_pendulum(t,y);
    t(k)=t(k-1)+h;
    ener(k)=sum(y.^2)-1;
end;

scrsz = get(0,'ScreenSize');    %determines size of monitor=left,bottom,width,height
set(gcf,'OuterPosition',[1 1 scrsz(3)-60 scrsz(4)-20]);
subplot(2,2,1);
plot(t,ener,'r-');
title('Euler')
grid on;

%% Modified-Euler
y=y_0;
n=5000;       % number of steps for Modified-Euler
h=0.02;         % delta_t, 10/2 steps  NOTE less steps!
t=zeros(n,1);
ener=t;
for k=2:n;
    k1=h*fun_pendulum(t,y);
    k2=h*fun_pendulum(t,y+k1./2);
    y=y+k2;
    t(k)=t(k-1)+h;
    ener(k)=sum(y.^2)-1;
end;
subplot(2,2,2);
plot(t,ener,'g-');
title('Modified-Euler')
grid on;

%% Runge-Kutta 4th order
y=y_0;         %initial value
n=2500;       % number of steps for Runge-Kutta 4th order
h=0.04;         % delta_t, 10K/4 steps  NOTE less steps!
t=zeros(n,1);
ener=t;
for k=2:n;
    k1=h*fun_pendulum(t,y);
    k2=h*fun_pendulum(t,y+k1./2);
    k3=h*fun_pendulum(t,y+k2./2);
    k4=h*fun_pendulum(t,y+k3);
    y=y+(k1+2*k2+2*k3+k4)/6;
    t(k)=t(k-1)+h;
    ener(k)=sum(y.^2)-1;
end;
subplot(2,2,3);
plot(t,ener,'c-');
title('Runge-Kutta')
grid on;


%% Matlab ODE solver
tspan=[0 100];
options = odeset('RelTol',1e-10,'MaxStep',.1,'InitialStep',1e-3);
[t,y] = ode113(@fun_pendulum,tspan,y_0,options);
length(t)
subplot(2,2,4);
ener=y(:,1).^2+y(:,2).^2-1;
plot(t,ener,'b');
title('Matlab ODE solver')
grid on;