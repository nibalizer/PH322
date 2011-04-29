%% Various approx methods for a simple ODE:  
% Fourier synthesis of a sawtooth
% We sum the first 3,5,9,21,101, 1001 sines that make up a sawtooth
% Only one half of the graph is shown (sines are odd, so flip it over twice
% to imagine the other half)
% We see that with increasing number of terms we approximate the sawtooth
% better, except at the discontinuity at t=0.5, where we are off by ~18%:
% we call this the Gibbs phenomenon
% Version 1.0 - Erik Bodegom

close all;clear;

tstep=.0001
tp=zeros(10001,1);
yp=zeros(10001,6);
col={'r-','g-','b-','m-','c-','r-'}  % this is a cellarray curly brackets: what does this do?
        % each string is its own cell.  Normal arrays work differently!
im=[3,5,9,21,101,1001];      %im=use: 3,5,9,21,101 sines

hold on
scrsz = get(0,'ScreenSize');    %determines size of monitor=left,bottom,width,height
set(gcf,'OuterPosition',[1 1 scrsz(3)-60 scrsz(4)-20]);
plot([.0,.5,.5],[.0,1.,.0],'k','LineWidth',3)  % plots sawtooth
title('sum of 3,5,9,21,101, 1001 sines approximating a sawtooth','FontSize',20)
xlabel('Time');
ylabel('Sawtooth');
for m=1:6;
    imax=im(m);    
    disp(imax)
    t=.0;
    n=1;
    while t<.5-tstep;
        s=.0;
        isign=1;
        t=t+ tstep;
        for k=1:imax;
            s=s+2*sin(k*2*pi*t)/(k*isign*pi);
            isign=-isign;
        end;
        tp(n)=t;
        yp(n,m)=s;
        n=n+1;
    end;
    plot(tp(1:n-1,1),yp(1:n-1,m),col{m});
    
end;
legend('sawtooth','3 sines','5 sines','9 sines','21 sines','101 sines','1001 sines')
    
    
    