function pend_ans = fun_pendulum(t,y)
%FUN_PENDULUM Solve y''=-y
%           dy/dt=v_y
%           dv_y/dt=-y
pend_ans =zeros(2,1);
pend_ans(1)=y(2);
pend_ans(2)=-y(1);
end

