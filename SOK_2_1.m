%Spencer Krum
%PH 322 problem 2_1

%general form of euler Val(t + dt) = val(T) + dval(t) * dt

%solve numerically
%and compare to analytical solution

%biker formula is v(i+1) = v(i) + (P/mv(i) * dt)
%consts
%P=400
%m=70kg
%v(0) = 0

clear
close all


%dt = input('Please enter your delta-t value: ')
%t2 = input('Please enter your t-final value: ')

%setup consts
P = 400;
m = 70;

%setup time domain
dt = .0001;
t1 = 0;
t2 = 3;
t = t1:dt:t2;

%initial speed is 0
v(1) = 0.0001;

for k=1:length(t)-1,
    v(k+1) = v(k) + (P./(m * v(k))) * dt;
    fprintf('T:\t%f\tV:\t%f\n', t(k),v(k))
end


plot(t,v, 'r')
pause()
