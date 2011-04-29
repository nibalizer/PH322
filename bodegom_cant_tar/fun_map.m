function [ x ] = fun_map( z )
%FUN_MAP maps numbers that are more than pi or less than -pi into the range
% of [-pi pi]
n=fix(z/pi);
is=0;
for k=1:length(n);
    if n(k)~=0;
        is=abs(n(k))/n(k);
    end;
    x(k)=z(k)-2*pi*fix(n(k)/2+is*.5);
end

