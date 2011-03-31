%Spencer Krum
%PH 322 problem 1_4

%general form of euler Val(t + dt) = val(T) + dval(t) * dt

%solve numerically
%dNa/dt = - Na / tau_a
%dNb/dt = Na / tau_a - Nb / tau_b

% uranium 238 has a halflife of 4.5 billion years and decays to thorium 234
% thorium 234 has a halflife of 24 days

% halflife = ln(2) * tau
% tau = halflife / ln(2)
% ln(2) ~ 0.69315

halflife_uranium_238 = 4.5 * 1 * 365 * 24 * 60 * 60;
halflife_thorium_234 =  24 * 24 * 60 * 60;

tau_u238 = halflife_uranium_238 / log(2);
tau_t234 = halflife_thorium_234 / log(2);


%setup time domain

%dt = 1e+3;
t1 = 0;
%t2 = 1e+8;
t = t1:dt:t2;

%assign tau_a and tau_b
%tau_a = tau_u238;
%tau_b = tau_t234;

dt = input("Please enter your delta-t value: ")
t2 = input("Please enter your t-final value: ")
tau_a = input("Please enter your tau_a value: ")
tau_b = input("Please enter your tau_b value: ")


disp(tau_a)
disp(tau_b)

% lets start with a mole of u238
% lets start with zero moles of t234
Na(1) = 6.022e+23;
Nb(1) = 0;

for i=1:length(t)-1,
    Na(i+1) = Na(i) + -Na(i) / tau_a *dt;
    Nb(i+1) = Nb(i) + ((Na(i) / tau_a) + (-Nb(i) / tau_b)) *dt;
    fprintf('T:\t%f\tNa:\t%f\t\tNb:\t%f\n', t(i), Na(i), Nb(i))
end

plot(t,Na, 'r', t, Nb, 'b')
pause()
