%% Damped, driven pendulum - Poincare
% Version 1.0 - Erik Bodegom
%
clear;close all;
Fd=1.0;        % driving force strength   1.2   1.35   1.44
w=2/3;      % driving force period
q=.5;        % damping if q=zero then no damping  0, .001, .005, .1, .5

% next step is just to get rid of transients
tmax=10*3*pi;   % 10 periods at  the driving frequency
y_0=[0. .01]';   % initial angle and initial omega
tspan=[0 tmax];
options = odeset('RelTol',1e-10,'MaxStep',.1,'InitialStep',1e-3);
[t,y] = ode113(@(t,y) fun_pend_damping(t,y,w,Fd,q),tspan,y_0,options);

ntimes=length(t);
y_0=[y(ntimes,1) y(ntimes,2)]';   % angle and omega after 10 periods

tmax=300*3*pi; % now 300 periods at  the driving frequency
tspan=[0 tmax];
options = odeset('RelTol',1e-10,'MaxStep',.1,'InitialStep',1e-3);
[t,y] = ode113(@(t,y) fun_pend_damping(t,y,w,Fd,q),tspan,y_0,options);

ntimes=length(t);
fprintf('Poincare number of data pts: \t %g \n',ntimes)
scrsz = get(0,'ScreenSize');    %determines size of monitor=left,bottom,width,height
set(gcf,'OuterPosition',[1 20 scrsz(3)-60 scrsz(4)-20]);
subplot(2,2,1);
plot(t/(2*pi),y(:,1),'r',t/(2*pi),y(:,2),'b')
title('\theta=red and \omega=blue','Fontsize',20)
grid on;
xlabel('period number');ylabel('\theta and \omega');

%% now calculating the reduced theta and figuring out how many rotations,
% how many times over the top the pendulum has gone is calculated in
% fun_map
ndrive=0; % number of times the driving force has gone thru its cycle
tdrive=2*pi/w;
xpoin(1)=0;
vpoin(1)=0;
x=y(:,1);
y(:,3)=fun_map(y(:,1));
for k=1:ntimes;
    if t(k)>(ndrive+1)*tdrive;
        ndrive=ndrive+1;
        xpoin(ndrive)=y(k-1,1)+ (( ndrive*tdrive -t(k-1) )/(  t(k)-t(k-1)  )) *(y(k,1)-y(k-1,1)) ;
        % note: the above eq is tricky....
        vpoin(ndrive)=y(k-1,2)+ (( ndrive*tdrive -t(k-1) )/(  t(k)-t(k-1)  ))  *(y(k,2)-y(k-1,2));
    end;
end;
xpoin=fun_map(xpoin);

subplot(2,2,2);
plot(t/(2*pi),y(:,3),'r',t/(2*pi),y(:,2),'b')
axis([0 100 -3.2 3.2]);              %[xmin xmax ymin ymax]
title('reduced \theta=red and \omega=blue','Fontsize',20)
grid on;
xlabel('period number');ylabel('reduced \theta and \omega');

%% Part 2
subplot(2,2,3);
plot(y(:,3),y(:,2),'b.')
title('\omega vs reduced \theta','Fontsize',20)
grid on;
xlabel('reduced \theta');ylabel('\omega');

subplot(2,2,4);
plot(xpoin,vpoin,'kx')
title('\omega vs reduced \theta at the drive frequency','Fontsize',20)
grid on;
xlabel('\theta');ylabel('\omega');