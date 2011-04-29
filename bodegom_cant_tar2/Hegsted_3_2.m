% Hegsted_3_18
% Damian Hegsted 4/21/2011

% Calculate the effect of backspin on a fastball.  How much does an angular
% velocity of 1000 rpm (typical for a fastball) affect the trajectory?
% Backspin axis will be the z axis which not shown here as all the forces
% act in the y direction.

% clear data
clc;clear;close all;

% The spin dependent force is:
% F=S*w*vx

% and the equations of motion are
% dx/dt=vx
% dvx/dt=-B*v*vx/m
% dy/dt=vy
% dvy/dt=-g+S*vx*w/m

% setting initial constants
S=.00041;                          % Magnus Force
% B/m=.0039+.0058/(1+exp((v-35)/5))     % Baseball drag
g=9.80665;                              % gravity
t=0;
x=0;                          % thrown along x axis
y=1;                          % thrown from 1 m off the ground (height)
v0=42.4688;                   % initial velocity
vx=v0;                        % initial x velocity
vy=0;                         % initial y velocity
w=1000/60*2*pi;               % radians per second

% time steps
N=500;
dt=1/N;

% loop fastball with backspin
for n=1:N
    x(n+1)=x(n)+vx(n)*dt;
    y(n+1)=y(n)+vy(n)*dt;
    vx(n+1)=vx(n)-dt*(.0039+.0058/(1+exp((sqrt(vx(n)^2+vy(n)^2)-35)/5)))*sqrt(vx(n)^2+vy(n)^2)*vx(n);
    vy(n+1)=vy(n)+dt*S*vx(n)*w-g*dt;
end

plot(x,y);axis([0 18.288 0 1.1]);
hold on
xlabel('Distance Thrown (m)');ylabel('Height (m)');
title('Trajectory of Fastball with Backspin');

% loop fastball without backspin
S=0;
for n=1:N
    x(n+1)=x(n)+vx(n)*dt;
    y(n+1)=y(n)+vy(n)*dt;
    vx(n+1)=vx(n)-dt*(.0039+.0058/(1+exp((sqrt(vx(n)^2+vy(n)^2)-35)/5)))*sqrt(vx(n)^2+vy(n)^2)*vx(n);
    vy(n+1)=vy(n)-dt*S*vx(n)*w-g*dt;
end
plot(x,y,'r--');
legend('With Backspin','Without Backspin');
hold off

diff=(.03984-.01149)*3.2808399*12;

% Conclusion:
% In the distance of 60 feet (18.288 m) the ball travels to the home plate it
% experiences an upward Magnus Force.  Compared to a throw without backspin
% it reaches home plate 1.1161 inches higher.