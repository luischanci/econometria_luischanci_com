using LinearAlgebra

# Matrix and vectors:
W = [0 .1 .9;1 0 0;.2 .8 0];    #SWM for NxN
y = [2, 3, 1, .1, 9, 8];             #panel N=3 T=2
y2= [2 1 9 3 .1 8]';             #panel N=3 T=2
x = [[1,1,1,1,1,1]';[2,1,1,3,3,2]']';
N = 3;
T = 2;
[kron(I(T),W)*y , kron(I(T),W)*y2]

inv(x'*x)*(x'*y)
inv(x'*x)*(x'*y2)



