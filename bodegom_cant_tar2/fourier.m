%% Fourier basics: sine
% Fourier analysis of a sine and a sawtooth
% Version 1.0 - Erik Bodegom

close all;clear;
x=linspace(0,15,16);
y=sin(x*pi/4);
z=fft(y)
hold on
scrsz = get(0,'ScreenSize');    %determines size of monitor=left,bottom,width,height
set(gcf,'OuterPosition',[1 1 scrsz(3)-60 scrsz(4)-20]);
subplot(2,2,1);
plot(x,y,'gx-','LineWidth',2,'MarkerSize',8)
title('A sine wave: note how many points!','Fontsize',20)
grid on;
xlabel('time in steps of pi/4');ylabel('sine');

z=fft(y);
subplot(2,2,2);
plot(x,real(z),'rx-',x,imag(z),'bx',x,imag(z),'c:','LineWidth',2,'MarkerSize',8)
title('The real(red) and imag(blue) part of the FT','Fontsize',20)
grid on;
xlabel('time in steps of pi/4');ylabel('Real/imag FT');

subplot(2,2,3);
yi=ifft(z);
plot(x,imag(yi),'bx',x,real(yi),'rx:','LineWidth',2,'MarkerSize',8)
title('The ifft of the fft: hence the function','Fontsize',20)
grid on;
xlabel('time in steps of pi/4');ylabel('Real and Imag of ifft(fft)');

subplot(2,2,4);
plot(x,abs(z),'c',x,abs(z),'x','LineWidth',2,'MarkerSize',8)
title('The magnitude of FT','Fontsize',20)
grid on;
xlabel('Fourier frequency [what units?] It does not make sense');ylabel('magnitude');

%% Now correct frequencies!  Nyquist=f_c=1/(2*time step)
% Here time step is pi/4, hence f_c=1/(2*pi/4)=2/pi
n=length(x)/2+1;
x=x(1:n)*2/pi/8;   % Note this divided by 8 because 8 is the largest x....
z=abs(z);
z=z(1:n);
subplot(2,2,4);

plot(x,abs(z),'c',x,abs(z),'x','LineWidth',2,'MarkerSize',8)
title('The magnitude of FT','Fontsize',20)
grid on;
xlabel('Fourier frequency [Hz]');ylabel('magnitude');

%% Fourier basics: SAWTOOTH
% Fourier analysis of a sawtooth
% 
close all;clear;
x=linspace(-7.5,7.5,32);
y=x;
z=fft(y);
hold on
scrsz = get(0,'ScreenSize');    %determines size of monitor=left,bottom,width,height
set(gcf,'OuterPosition',[1 1 scrsz(3)-60 scrsz(4)-20]);
subplot(2,2,1);
plot(x,y,'go-','LineWidth',2,'MarkerSize',8)
title('A sawtooth','Fontsize',20)
grid on;
xlabel('time');ylabel('sawtooth');
tic
z=fft(y);
toc
subplot(2,2,2);
plot(x+8,real(z),'rx-',x+8,imag(z),'bx',x+8,imag(z),'c:','LineWidth',2,'MarkerSize',8)
title('The real(red) and imag(blue) part of the FT','Fontsize',20)
grid on;
xlabel('frequency''s number');ylabel('Real/imag FT');

subplot(2,2,3);
yi=ifft(z);
plot(x,imag(yi),'bx',x,real(yi),'rx:','LineWidth',2,'MarkerSize',8)
title('The ifft of the fft: hence the function','Fontsize',20)
grid on;
xlabel('time in steps of pi/4');ylabel('Real and Imag of ifft(fft)');

subplot(2,2,4);
plot(x,abs(z),'c',x,abs(z),'x','LineWidth',2,'MarkerSize',8)
title('The magnitude of FT','Fontsize',20)
grid on;
xlabel('Fourier frequency [what units?]');ylabel('magnitude');

%% Now correct frequencies!  Nyquist frequency=f_c=1/(2*time step)
% Here time step is 1, hence f_c=0.5

n=length(x)/2+1;
x=linspace(0,0.5,n);
z=abs(z);
z=z(1:n);
subplot(2,2,4);

plot(x,abs(z),'c',x,abs(z),'x','LineWidth',2,'MarkerSize',8)
title('The magnitude of FT','Fontsize',20)
grid on;
xlabel('Fourier frequency [Hz]');ylabel('magnitude');