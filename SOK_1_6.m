%spencer krum
%ph 322 1_6.m

%population growth
%dN/dt = a * N - b*(N**2)


dt = input("Please enter your delta-t value: ")
t2 = input("Please enter your t-final value: ")
a = input("Please enter your a value: ")
b = input("Please enter your b value: ")

%setup time domain
%dt = 1e-4;
t1 = 0;
%t2 = 10;
t = t1:dt:t2;

%a = 10;
%b = 0;
%N(1) = 10;
%N(1) = 1000;

%a = 10;
%b = 3;
%N(1) = 10;

%a = 10;
%b = 0.01;
%N(1) = 1000;


for i=1:length(t)-1,
    N(i+1) = N(i) + ((a * N(i)) - (b * (N(i)**2)))*dt;
    fprintf('T:\t%f\tN:\t%f\n', t(i), N(i))
end

plot(t,N, 'r')
%semilogy(t,N, 'r')
pause()
