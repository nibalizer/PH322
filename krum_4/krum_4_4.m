%Spencer Krum
%April 28, 2011
%PH 322 problem 4_4 which is actually 3_12 from book


%Text of the Problem:
%In constructing the Poincare section in Figure 3.9 we plotted points
%only at times that were in phase with the drive force; that is, at
%times t = 2pin/omegaD, where n is an integer. At these values of t
%the driving force passed through zero [see (3.18)]. However, we could
%just as easily have chosen to make the plot at times corresponding to
%a maximum of the drive force, or at times pi/4 out of phase with this
%force, etc. Construct the Poincare sections for these cases and
%compare them with Figure 3.9.

%General plan of solution:
%   1) Construct working Baseball simulator
%   2) Add in crosswind by introducing a new Z component
%       a) Total velocity is now v = sqrt(x^2 + y^2 + z^2) 
%       b) Need a new angle phi, for direction in Z-X plane

%general form of euler Val(t + dt) = val(T) + dval(t) * dt

%Clear all previous functions
clear
close all

%Print name of Problem

fprintf('%s', 'Baseball with a 10mph crosswind')

%precalculation

% 10 mph = 4.4704 meters / second


%setup consts
%all velocities in m/s

crosswind = 4.4704
initial_height = 1
powerhitter_initial_velocity = 49
v = 1 %m/s
vd = 35  %m/s 
delta = 5 %m/s
b2m = 0.0039 + (0.0058/ (1 + exp(v - vd)* delta))

a = 6.5e-3
To = 25
alpha = 2.5

%setup time domain
dt = .001;
t1 = 0;
t2 = 12;
t = t1:dt:t2;

%initial speed is composed of vx and vy initial
x(1) = 0;
z(1) = 0;
vx(1) = sin(pi/4)*49; %45 degree angle, 110mph(49m/s)
vz(1) = 0
vy(1) = cos(pi/4)*49;
y(1) = 1;
v(1) = sqrt((vx(1)).^2 + (vy(1)).^2);
g = 9.8

%for loop three times
for k=1:length(t)-1,
    b2 = 4e-5;
    po = 1;
    p = po *(1 - a * y(k) / To).^alpha;
    b2 = b2 * p/po;
    v(k) = sqrt((vx(k)).^2 + (vy(k)).^2 )+ (vz(k).^2);
    b2 = 0.0039 + (0.0058/ (1 + exp(v(k) - vd)* delta));

    x(k + 1) = x(k) + vx(k) * dt;
    z(k + 1) = z(k) + vz(k) * dt;
    vx(k +1) = vx(k) + - b2 * v(k) * vx(k) *dt;
    y(k + 1) = y(k) + vy(k) * dt;
    vy(k +1) = vy(k) + - b2 * v(k) * vy(k) *dt - g*dt;
    vz(k +1) = vz(k) + - b2 * v(k) * vz(k) * dt;
    fprintf('T:\t%f\tV:\t%f\n', t(k),v(k))
    if length(y) > 100 %this little abominiation kills the execution if we've done more than 100 iterations and if the ball has hit the ground, or, to be more specific, has dropped below the ground and tunneled into the earth
        if y(k) < 0
            break
        end
    end

end
%initial speed is composed of vx and vy initial

%path not involving a crosswind
x1(1) = 0;
vx1(1) = cos(.610)* 49;
vy1(1) = sin(.610)* 49;
y1(1) = 1;
v(1) = sqrt((vx1(1)).^2 + (vy1(1)).^2);
g = 9.8

for k=1:length(t)-1,
    b2 = 4e-5;
    po = 1;
    p = po *(1 - a * y1(k) / To).^alpha;
    b2 = b2 * p/po;
    v(k) = sqrt((vx1(k)).^2 + (vy1(k)).^2);
    b2 = 0.0039 + (0.0058/ (1 + exp(v(k) - vd)* delta));

    x1(k + 1) = x1(k) + vx1(k) * dt;
    vx1(k +1) = vx1(k) + - b2 * v(k) * vx1(k) *dt;
    y1(k + 1) = y1(k) + vy1(k) * dt;
    vy1(k +1) = vy1(k) + - b2 * v(k) * vy1(k) *dt - g*dt;
    fprintf('T:\t%f\tV:\t%f\n', t(k),v(k))
    if length(y1) > 100 && y1(k) < 0
        break
    end

end

diff = x1(end) - x(end)

fprintf('The two balls traveled a difference of %f meters', diff)

plot(x,y, 'r', x1,y1,'b' )

%plot(x,y, 'r')
legend('Baseball height, distance (in meters) under a 10mph crosswind', 'Uncrosswinded baseball(same units) for comparison')
pause()
