%% Fourier basics: aliasing
% The original function needs to have
% NO frequencies beyond the Nyquist freq.
% T is the period, and the function then has a freq. of 1/T
% or an omega 2 pi freq. = 2 pi/T
% Version 1.0 - Erik Bodegom

close all;clear;

tp=linspace(0,31,32);
% So timestep is 1, so Nyquist freq=0.5
% Hence: period should be larger than 1/f_c or 2!!!

% (4/3  ,4)  the nomenclature: T=4/3 is aliased into T_effective=4
% and similarly (4/5   ,4) means T=4/5 is aliased into T_effective=4
% (3/2    ,3),  (3/5    ,3),  (8/9   ,8), (5/3  ,2.5)
T=4; %8/9;      % T should be more than 2! BUT we are going to violate that rule
T_prime=4;      % T_prime is the aliased signal
% yp=sin((linspace(0,31,32)+.5)*2*pi/T); % only for at the Nyquist freq, shift pi/2, otherwise all zeros
yp=sin(tp*2*pi/T);                       % take out to see what happens when we engage the above (shifted) yp

hold on
scrsz = get(0,'ScreenSize');    %determines size of monitor=left,bottom,width,height
set(gcf,'OuterPosition',[1 1 scrsz(3)-60 scrsz(4)-20]);
subplot(5,1,1);
plot(tp,yp,'rs-');
gr_title=strcat('Function with period: ', num2str(T),'  and freq: ',num2str(1/T));
title(gr_title,'Fontsize',20);

syp=sin(linspace(0,255,256)*2*pi/(T*8));    % important same fn, but more datapts.!
stp=linspace(0,255,256)*32/256;
fp=fft(yp);                                 % fp =DFT of function

subplot(5,1,2);
plot(stp,syp,'b.:',tp,yp,'ro'); 
title('The same function as above but with extra samples (blue) and previous datapts (red)','Fontsize',20);

ypp=sin(linspace(0,31,32)*2*pi/T_prime); %T=8.  if original T=8/9 then aliased into T=8.
subplot(5,1,3);
plot(tp,abs(fp),'rs-',tp,abs(fft(ypp)),'b>-');  % shows aliasing
%btw: abs(1+1j)=1.4142135623730951
title('abs. of DFT TWO (2!) functions, red is original, blue is aliased freq','Fontsize',20);

subplot(5,1,4);
plot(tp,ifft(fp),'m-',tp,yp,'ro');
title('Inverse DFT of the DFT: ergo the function should return!','Fontsize',20);

subplot(5,1,5);
tpsd=linspace(0,16,17)/32;
% print 'Note that fp[i]=fp[31-i]'
% print fp
psd=abs(fp).^2;  %power spectral density
psd=psd(1:length(psd)/2+1);

plot(tpsd,psd,'rp-','MarkerSize',8);
title('Power spectral density: note the units and how it is summed','Fontsize',20);
xlabel('Nyquist freq. = .5: this is 2 samples per period','Fontsize',16)
