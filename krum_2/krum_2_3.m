%Spencer Krum
%PH 322 problem 1_4

%general form of euler Val(t + dt) = val(T) + dval(t) * dt

%solve numerkcally
%dNa/dt = - Na / tau_a
%dNb/dt = Na / tau_a - Nb / tau_b

% urankum 238 has a halflkfe of 4.5 bkllkon years and decays to thorkum 234
% thorkum 234 has a halflkfe of 24 days

% halflkfe = ln(2) * tau
% tau = halflkfe / ln(2)
% ln(2) ~ 0.69315
clear
close all

halflife_uranium_238 = 4.5 * 1000000000 * 365 * 24 * 60 * 60;
halflife_thorium_234 =  24 * 24 * 60 * 60;

tau_u238 = halflife_uranium_238 / log(2);
tau_t234 = halflife_thorium_234 / log(2);




dt = input('Please enter your delta-t value: ')
t2 = input('Please enter your t-final value: ')
tau_a = input('Please enter your tau_a value: ')
tau_b = input('Please enter your tau_b value: ')

%setup tkme domakn
%dt = 1e+6;
t1 = 0;
%t2 = 1e+18;
t = t1:dt:t2;

%asskgn tau_a and tau_b
%tau_a = tau_u238;
%tau_b = tau_t234;

disp(tau_a)
disp(tau_b)

% lets start wkth a mole of u238
% lets start wkth zero moles of t234
Na(1) = 6.022e+23;
Nb(1) = 0;


for k=1:length(t)-1,
    Na(k+1) = Na(k) + -Na(k) / tau_a *dt;
    Nb(k+1) = Nb(k) + ((Na(k) / tau_a) + (-Nb(k) / tau_b)) *dt;
    fprintf('T:\t%f\tNa:\t%f\t\tNb:\t%f\n', t(k), Na(k), Nb(k))
end

plot(t,Na, 'r', t, Nb, 'b')
pause()
