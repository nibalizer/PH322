%spencer krum
%ph 322 1_6.m

%population growth
%dN/dt = a * N - b*(N**2)
clear
close all

TF = input('You want defaults? y/n : ', 's')
if strcmpi(TF, 'y')
    dt = .001
    a = 10;
    b = 3;
    N(1) = 100;
    t1 = 0;
    t2 = 1;
else
    t1 = 0;
    dt = input('Please enter your delta-t value: ')
    t2 = input('Please enter your t-final value: ')
    a = input('Please enter your a value: ')
    b = input('Please enter your b value: ')
    N(1) = input('Please enter your starting population value: ')
end

%setup time domain
%dt = 1e-4;
%t1 = 0;
%t2 = 5;
t = t1:dt:t2;

%a = 10;
%b = 0;
%N(1) = 10;
%N(1) = 1000;

%a = 10;
%b = 3;
%N(1) = 10;

%a = 10;
%b = 3;
%N(1) = 100;

%a = 10;
%b = 0.01;
%N(1) = 1000;
A(1) = N(1);

%math motels mech vibration and pop dynamics by richard hoberman

for k=1:length(t)-1,
    A(k+1) = (a * (N(1)  / (a - b*N(1) + b * N(1) * exp(a * t(k)))) * exp(a * t(k)));
    N(k+1) = N(k) + ((a * N(k)) - (b * (N(k)^2)))*dt;
    fprintf('T:\t%f\tN:\t%fA:\t%f\n', t(k), N(k), A(k))
end

plot(t,N, 'r', t, A, 'b')
%semilogy(t,N, 'r')
pause()
