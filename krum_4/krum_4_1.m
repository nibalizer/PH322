%Spencer Krum
%April 28, 2011
%PH 322 problem 4_1 which is actually 4_1 from syllabus


%Text of the Problem:
%Use N-R to solve x^2/3 - 169 = 0

%General plan of solution:
%   1) find way to use dr. bodegom's n-r solver.
%   2) profit

%Clear all previous functions
clear
close all

%Print name of Problem

fprintf('%s', 'Use N-R to solve x^2/3 - 169 = 0')


%precalculate, which here means to establish inline functions

inline_fun1=inline('x.^(2/3) - 169','x')
inline_DF1=inline('(2/3) * x^(-1/3)','x')

% So begins the 'stolen code' section
%% Newton-Raphson:  finding roots

fprintf('\n Newton-Raphson \n')
tol=1e-10;                          %Rel. tolerance--> 1E-10
x=7.39085e-001;
x=1;
i=0;
tol_tst=1;
while tol_tst>tol && i<30;
    i=i+1;
    test=x-inline_fun1(x)/inline_DF1(x);
    if x~0;
        tol_tst=abs((x-test)/x);
        fprintf('%3d \t %10.9e \t %10.9e \t %7.4e \n',i,x,inline_fun1(x),inline_DF1(x))
        x=test;
    end;
end;

fprintf('The winning value is %f', x)
