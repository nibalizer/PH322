%Spencer Krum
%April 28, 2011
%PH 322 problem 4_2 which is actually 4_2 from syllabus


%Text of the Problem:
%Find an extremum of 2x^4-x^3-x^2+17 between -10 and 10, there may be multiple extrema, find at least one

%General plan of solution:
%get high definition vector of values between -10 and 10
%run findpeaks
%sidenote: this is accomplished in one line in python or mathmatica .o0(why can't i turn that in?)

%Clear all previous functions
clear
close all

%Print name of Problem

fprintf('%s', 'Find an extremum of 2x^4-x^3-x^2+17 between -10 and 10, there may be multiple extrema, find at least one')

%precalc

inline_fun1=inline('2.*x.^4-x.^3-x.^2+17','x')

t = -10:.0001:10;

%calc

y = inline_fun1(t);

pks = findpeaks(y);

fprintf('%f',pks)

