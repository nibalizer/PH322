% Trajectory of a Batted Ball with wind
% Laurel Dunn
% 4/22/2011
% Program models the trajectories of two batted balls. Both balls are
% batted at a 35 degree angle (for maximum range) with an initial velocity of 110 mph
% First ball is batted
% in the absense of wind. Second ball experiences a wind of 10mph
% perpendicular to its path. Wind is taken to blow in the z direction and 
% both balls are batted in the x,y plane.

dt=.001;    % Define time step and interval
t=0:dt:5;
a=.61087;   % batted at 35 degree angle from horizontal 

v1=0*t;
v1(1)=49.1744;  
v2=0*t;
v2(1)=49.1744;

vx1=0*t;
vx1(1)=v1(1)*cos(a);    % initial velocity has both x and y components
vx2=0*t;
vx2(1)=v2(1)*cos(a);

vy1=0*t;
vy1(1)=v1(1)*sin(a);
vy2=0*t;
vy2(1)=v2(1)*sin(a);

vz1=0*t;                % devine variable arrays and initial conditions
vz1(1)=0;
vz2=0*t;
vz2(1)=0;

x1=0*t;
x1(1)=0;
x2=0*t;
x2(1)=0;
y1=0*t;
y1(1)=1;
y2=0*t;
y2(1)=1;
z1=0*t;
z1(1)=0;
z2=0*t;
z2(1)=0;

g=9.8;
vwind=4.4704;
d=length(t);

for k=1:d;
    y1(k+1)=y1(k)+vy1(k)*dt;        % Initial displacement arrays
    x1(k+1)=x1(k)+vx1(k)*dt;
    z1(k+1)=0;
    
    y2(k+1)=y2(k)+vy2(k)*dt;
    x2(k+1)=x2(k)+vx2(k)*dt;
    z2(k+1)=z2(k)+vz2(k)*dt;
    
    B1(k+1)=.0039+.0058/(1+exp((v1(k)-35)/5));  % Drag coefficients
    B2(k+1)=.0039+.0058/(1+exp((v2(k)-35)/5));
    
    dragx1(k)=-B1(k)*(v1(k))*(vx1(k));      % Drag forces
    dragy1(k)=-B1(k)*(v1(k))*(vy1(k));
    dragz1(k)=0;
    
    dragx2(k)=-B2(k)*(v2(k))*(vx2(k));
    dragy2(k)=-B2(k)*(v2(k))*(vy2(k));
    dragz2(k)=-B2(k)*(v2(k))*(vz2(k)-vwind);
    
    vx1(k+1)=vx1(k)+dragx1(k)*dt;       % directional velocities
    vy1(k+1)=vy1(k)-g*dt+dragy1(k)*dt;
    vz1(k+1)=0;
    
    vx2(k+1)=vx2(k)+dragx2(k)*dt;
    vy2(k+1)=vy2(k)-g*dt+dragy2(k)*dt;
    vz2(k+1)=vz2(k)+dragz2(k)*dt;
    
    v1(k+1)=sqrt((vx1(k+1)^2+vy1(k+1)^2+vz1(k+1)^2));   % total velocities
    v2(k+1)=sqrt((vx2(k+1)^2+vy2(k+1)^2+vz2(k+1)^2));
end


subplot(2,1,1),plot(x1,y1,'r',x2,y2,'b-')
ylim([0 32])
title('x,y plot of ball trajectories')
xlabel('horizontal distance (m)')
ylabel('height (m)')
legend('no wind','with wind','location','best')

subplot(2,1,2),plot3(x1,z1,y1,'r',x2,z2,y2,'b-')
xlim([0 130])
ylim([-5 10])
zlim([0 30])
grid

title('x,y,z plot of ball trajectories')
xlabel('horizontal distance (m)')
zlabel('height (m)')
ylabel('distance deflected by wind (m)')
legend('no wind','with wind','location','best')