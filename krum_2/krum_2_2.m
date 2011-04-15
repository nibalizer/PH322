%Spencer Krum
%PH 322 problem 2_9
%to solve a  cannon shot through air
%general form of euler Val(t + dt) = val(T) + dval(t) * dt

%solve numerically
%and reproduce fig 2.5

clear
close all

fprintf('%s', 'Launching a Cannon ball with air resistance') 

%setup consts
a = 6.5e-3
To = 25
alpha = 2.5


%b2 = b2/m
b2 = 4e-5



%setup time domain
dt = .01;
t1 = 0;
t2 = 12;
t = t1:dt:t2;

%initial speed is composed of vx and vy initial
x(1) = 0;
vx(1) = 30;
vy(1) = 30;
y(1) = 0;
v(1) = sqrt((vx(1)).^2 + (vy(1)).^2);
g = 9.8

%for loop three times
for k=1:length(t)-1,
    b2 = 4e-5;
    po = 1;
    p = po *(1 - a * y(k) / To).^alpha;
    b2 = b2 * p/po;
    v(k) = sqrt((vx(k)).^2 + (vy(k)).^2);

    x(k + 1) = x(k) + vx(k) * dt;
    vx(k +1) = vx(k) + - b2 * v(k) * vx(k) *dt;
    y(k + 1) = y(k) + vy(k) * dt;
    vy(k +1) = vy(k) + - b2 * v(k) * vy(k) *dt - g*dt;
    fprintf('T:\t%f\tV:\t%f\n', t(k),v(k))
    if length(y) > 100
        if y(k) < 0
            break
        end
    end

end

x1(1) = 0;
vx1(1) = 20;
vy1(1) = 40;
y1(1) = 0;
v(1) = sqrt((vx1(1)).^2 + (vy1(1)).^2);
g = 9.8

for k=1:length(t)-1,
    b2 = 4e-5;
    po = 1;
    p = po *(1 - a * y1(k) / To).^alpha;
    b2 = b2 * p/po;
    v(k) = sqrt((vx1(k)).^2 + (vy1(k)).^2);

    x1(k + 1) = x1(k) + vx1(k) * dt;
    vx1(k +1) = vx1(k) + - b2 * v(k) * vx1(k) *dt;
    y1(k + 1) = y1(k) + vy1(k) * dt;
    vy1(k +1) = vy1(k) + - b2 * v(k) * vy1(k) *dt - g*dt;
    fprintf('T:\t%f\tV:\t%f\n', t(k),v(k))
    if length(y1) > 100 && y1(k) < 0
        break
    end

end

x2(1) = 0;
vx2(1) = 40;
vy2(1) = 20;
y2(1) = 0;
v(1) = sqrt((vx2(1)).^2 + (vy2(1)).^2);
g = 9.8

for k=1:length(t)-1,
    b2 = 4e-5;
    po = 1;
    p = po *(1 - a * y2(k) / To).^alpha;
    b2 = b2 * p/po;
    v(k) = sqrt((vx2(k)).^2 + (vy2(k)).^2);

    x2(k + 1) = x2(k) + vx2(k) * dt;
    vx2(k +1) = vx2(k) + - b2 * v(k) * vx2(k) *dt;
    y2(k + 1) = y2(k) + vy2(k) * dt;
    vy2(k +1) = vy2(k) + - b2 * v(k) * vy2(k) *dt - g*dt;
    fprintf('T:\t%f\tV:\t%f\n', t(k),v(k))
    if length(y2) > 100 && y2(k) < 0
        break
    end

end

plot(x,y, 'r', x1,y1,'b', x2,y2,'g')
%plot(x,y, 'r')
legend('The x,y coordinate of a cannonball in air init cond vx0=30, vy0=30','The x,y coordinate of a cannonball in air init cond vx0=40, vy0=20','The x,y coordinate of a cannonball in air init cond vx0=20, vy0=40')
pause()
