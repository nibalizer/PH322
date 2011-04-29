%Christian Diaz    Assignment 3.3       4/20/11

%This program approximates the root of f(x)=cos(x)-x using the bisection
%method to eight significant figures.  It then displays the root and the
%number of iterations necessary to reach that approximation.

clear; close all; clc;
fprintf('This programs uses the method of bisection to approximate the root of \n f(x)=cos(x)-x to eight significant figures. \n');

%Define function and variables
f=inline('cos(x)-x');           %defines the function to evaluate
a=0;                            %defines first left x end point to begin evaluation
b=2;                            %defines first right x end point
n=100;                          %maximum number of iterations 
tol=0.00000001;                 %limits number of significant figures since the equation is unlikely to have an exact value
ya=f(a);                        %y value of left end point 
yb=f(b);                        %y value of right end point

%Check to make sure the two end points have different signs to ensure a
%zero exists between them.
if sign(ya)==sign(yb), error('The given function has same sign at end points'); 
end;

%loop to calculate the convergence of the bisection method
for k=1:n
    m=(a+b)/2;              %x midpoint between the two end points 
    ym=f(m);                %function evaluated at m
    iter=k;                 %iteration counter    
    if abs(ym)<tol          %compares the value of the function at m to the tolerance to decide if the bisection has converged
       fprintf('\n');
       fprintf('The bisection has converged at %9.8f. \n',m); 
       fprintf('The calculation took %3i iterations. \n',k);
       break; 
    end;
    if sign(ym)~= sign(ya); %This whole if statement compares the signs of the bounds and center to determine where the zero lies
        b=m;    
        yb=ym;
    else
        a=m; 
        ya=ym;
    end
    
    %if the tolerance is not reached within the maximum number of
    %iterations this section is displayed
    if (iter>=n), disp('zero not found to desired tolerance within the given iterations');
    end;
end
