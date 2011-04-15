%Spencer Krum
%PH 322 problem 2_2
%to solve a bike rider
%general form of euler Val(t + dt) = val(T) + dval(t) * dt

%solve numerically
%and reproduce fig 2.5

clear
close all

fprintf('%s', 'Bike rider')

%setup consts



%setup time domain
dt = .01;
t1 = 0;
t2 = 12;
t = t1:dt:t2;

%initial speed is composed of vx and vy initial
v(1)=13
v2(1)=13
v3(1)=13
v4(1)=13
vi2= v(1).^2
P=400
m=70
p=1
A= .33
C= 1

%for loop four times
for k=1:length(t)-1,
    v(k+1) = v(k) + P/(m*v(k)) *dt - C*p*A*(v(k).^2)/(2*m) * dt;
    fprintf('T:\t%f\tV:\t%f\n', t(k),v(k))
end

P=500
m=70
p=1
A= .33
C= 1
for k=1:length(t)-1,
    v2(k+1) = v2(k) + P/(m*v2(k)) *dt - C*p*A*(v2(k).^2)/(2*m) * dt;
    fprintf('T:\t%f\tV:\t%f\n', t(k),v2(k))
end

P=400
m=70
p=1
A= .20
C= 1
for k=1:length(t)-1,
    v3(k+1) = v3(k) + P/(m*v3(k)) *dt - C*p*A*(v3(k).^2)/(2*m) * dt;
    fprintf('T:\t%f\tV:\t%f\n', t(k),v3(k))
end

P=500
m=70
p=1
A= .20
C= 1
for k=1:length(t)-1,
    v4(k+1) = v4(k) + P/(m*v4(k)) *dt - C*p*A*(v4(k).^2)/(2*m) * dt;
    fprintf('T:\t%f\tV:\t%f\n', t(k),v4(k))
end
plot(t,v, 'r', t, v2, 'b', t, v3, 'y', t, v4, 'g')
legend('Bike rider velocity, power=400 area=.33', 'Bike rider velocity, power=500 area=.33','Bike rider velocity, power=400 area=.20','Bike rider velocity, power=500 area=.20')
pause()
