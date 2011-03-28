%Spencer Krum
%PH322 Problem 1
%

%euler formula to do diffeq dv/dt = -g
%from t = 0, t= 10
%using various timesteps


%general form of euler Val(t + dt) = val(T) + dval(t) * dt
%cool thing is dval(t) is defined as -g for all vals

g = 9.8

dt = .01


t1 = 0;

t2 = 10;
t = t1:dt:t2;

y(1) = 0;


for i=1:length(t)-1,
    y(i+1) = y(i) + -g;
end

plot(t,y,'-ok')

  
