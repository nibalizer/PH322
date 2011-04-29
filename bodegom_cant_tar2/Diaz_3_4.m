%Christian Diaz    Assignment 3.4     4/20/11

%This program used the Newton-Raphson and Secant Methods to estimate the
%zero of the function f(x)=cos(x)-x.

clear; close all; clc;
fprintf('This program uses the Newton-Raphson and Secant methods to estimate the zero \n of the function f(x)=cos(x)-x. \n');

f=inline('cos(x)-x');   %function to be evaluated defined
df=inline('-sin(x)-1');  %derivative of evaluated function

%% Newton-Raphson method

%The Newton-Raphson method is an iterative method that estimates the zero
%of a function through the use of a knowledge of the derivative of the
%function.

fprintf('\n     Newton-Raphson Method \n');

a=0;                    %first x point
tol=0.00000001;         %tolerance
test=abs(f(a));         %sets a variable to compare with the tolerance
n=100;                  %maximum number of iterations
iter=1;                 %iteration counter
if iter<=n;
    while test>=tol;        %while loop calculates the approximation until the test variable is smaller then the tolerance
        m=a-(f(a)/df(a));   %note that the Newton-Raphson method reqires exact knowledge of the derivative of the function
        test=abs(f(m));
        a=m;
        iter=iter+1;
    end
    
    %displays the results of the while loop
    fprintf('\n');
    fprintf('The Newton-Raphson method converged to %9.8f \n',a);
    fprintf('This calculation took %3i iterations. \n',iter);
else
    
    %creates an out in case the equation does not converge to a zero
    fprintf('\n The Newton-Raphson method did not converge. \n');
end


%% Secant Method

%The secant method is an iterative method that uses two points to estimate 
%the derivative of the function and approximates the zero with the 
%intercept of this secant line.

fprintf('\n \n     Secant Method \n');

a=0;                    %first x point
b=0.5;                  %second x point
tol=0.00000001;         %tolerance
if abs(f(a))<abs(f(b)); %c will be the best approximation of the root
    c=a;
else
    c=b;
end
n=100;                  %maximum number of iterations
iter=1;                 %iteration counter
if iter<=n;
    while abs(f(c))>=tol;               %while loop calculates the approximation until the test variable is smaller then the tolerance
        sec=(f(b)-f(a))/(b-a);          %secant approximation of df
        if sec==0;
            error('fprime is 0')        %checks for error and exits if true
        end
        a=b;                            %save previous iteration value
        b=b-f(b)/sec;                   %calculates next step
        if abs(f(b))<abs(f(a));
            c=b;                        %stores best approx. of root
        else
            c=a;
        end
        iter=iter+1;
    end
    
    %displays the results of the while loop
    fprintf('\n');
    fprintf('The Secant method converged to %9.8f \n',c);
    fprintf('This calculation took %3i iterations. \n',iter);
else
    
    %creates an out in case the equation does not converge to a zero
    fprintf('\n The Secant method did not converge. \n');
end

fprintf('\n');
disp('Both of these methods are much more effient than bisection.');