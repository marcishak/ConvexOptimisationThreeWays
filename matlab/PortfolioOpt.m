% q4.m
% MATH5165 Optimisation - Assignment 1
% Question 4

% expected dividends
expected_div = [0.09 0.07 0.1 ];

% covariance matrix
cov_mat = [0.0012	-0.00056	0.0023
-0.00056	0.00028	-0.0012
0.0023	-0.0012	0.00552
];

% return benchmark
benchmark_ret = [4000];

% portfolio size constraints
portfolio_size = [1 1 1];

portfolio_eq = [50000];

% setting up into matlab form
H = 2*cov_mat;
f = [];

Aeq = [];
beq = [];

A = [-expected_div ; portfolio_size];
b = [-benchmark_ret ; portfolio_eq];

[x,fval,exitflag,output,lambda] = quadprog(H,f,A,b,Aeq,beq)

x