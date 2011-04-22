%Spencer Krum
%PH 322 problem 2_9

%general form of euler Val(t + dt) = val(T) + dval(t) * dt

%solve numerically
%and reproduce fig 2.5

clear
close all


%dt = input('Please enter your delta-t value: ')
%t2 = input('Please enter your t-final value: ')

%setup consts
a = 6.5e-3
To = 25
alpha = 2.5


%b2 = b2/m
b2 = 4e-5

b2 = b2 * p/po

p = po (1 - a * y / To).^alpha

%setup time domain
dt = .0001;
t1 = 0;
t2 = 3;
t = t1:dt:t2;

%initial speed is 0
x(1) = 0;
vx(1) = 0;
vy(1) = 0;
y(1) = 0;
v(1) = 0;
v = sqrt(vx(k)^2 + vy(k)^2)

for k=1:length(t)-1,

    x(k + 1) = x(k) + vx(k) * dt
    vx(k +1) = vx(k) + - b2 * v(k) * vx(k) 
    y(k + 1) = y(k) + vy(k) * dt
    vy(k +1) = vy(k) + - b2 * v(k) * vy(k) 
    fprintf('T:\t%f\tV:\t%f\n', t(k),v(k))
end


plot(t,v, 'r')
pause()
