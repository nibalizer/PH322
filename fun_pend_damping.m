function pend_ans = fun_pend_damping(t,y,w,Fd,q)
%FUN_PEND_DAMPING damped driven pendulum
%angle theta is given by y, hence dy/dt=omega
% gravition=g=1
% length l=1
%           dy(1)/dt=omega=y(2)
%           d_omega/dt=-sin(y(1))-q y(2) +Fd sin(w*t)
pend_ans =zeros(2,1);
pend_ans(1)=y(2);
pend_ans(2)=-sin(y(1))-q*y(2) +Fd*sin(w*t);
end

