%Spencer Krum
%April 21, 2011
%PH 322 problem 3_3 


%Text of the Problem:

%3_3: Find the root of f(a) = cos(x)-x = 0 by the method of bisection: How many iterations are necessary to determine the root to eight significant figures?

%General plan of solution:
%   1) Make do bisection(binary search)
%   2) run like a boss

%general form of euler Val(t + dt) = val(T) + dval(t) * dt

%Clear all previous functions
clear
close all

%Print name of Problem

fprintf('%s', 'bisection on cos(x)-x'

%precalculation



%setup consts

func = inline('cos(x)-x','x')

top = -10
bottom = 20 
err = 1
it = 0
fprintf('%s', 'Starting with top = -10, bottom = 20')

while (err < 1e-8);
    arstY:
    val = inline(val)

    


    
