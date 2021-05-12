% q3.m
% MATH5165 Optimisation - Assignment 1
% Question 3

% Item order
items = [
"cheese"
"sauce"
"dough"
"pepperoni"
"ham"
"bacon"
"green pepper"
"onion"
"celery"
"mushrooms"
"tomatoes"
"pineapple"
]


% Setting up our cost vector (from table)
cost = [ 93.2
70.48
19.26
88.22
88.1
88.54
50.2
10.66
28.28
62.4
44.06
51.96 ];


% Setting up our nutrition vector (from table)
nuts = [517.7	0.222	20	3000	0.022	6	0.244	0
14	1.8	2	800	0.1	1.4	0.06	6
18.233	3.826	14.224	0	0.586	8.852	0.628	0
10	2.5	15	0	0	2	0	0
9.031	2.291	14.692	0	0.74	4.009	0.178	0
13	1.189	8.392	0	0.361	1.828	0.114	0
9.459	0.675	1.351	209.46	0.081	0.54	0.081	127.03
27.273	0.545	1.818	18.182	0.363	0.545	0.036	10
40	0.25	0	125	0.025	0.5	0.025	10
6	0.8	3	0	0.1	4.3	0.46	3
13.333	0.533	1.333	450	0.066	0.8	0.04	22.667
12.016	0.31	0.387	25.194	0.081	0.193	0.019	6.977];


% Setting up our nutrition requirments constraint (from table)
nuts_req = [750
12
48.5
4500
1.3
16
1.6
30
];


% including items into meat, veg and fungi
% meat includes pepperioni, ham and bacon
% veg includes green pepper onion, celery, and tomatoes
% fungi includes mushrooms

mvf = [ 0	0	0
0	0	0
0	0	0
1	0	0
1	0	0
1	0	0
0	1	0
0	1	0
0	1	0
0	0	1
0	1	0
0	0	0
];

% setting up our meat veg and fungi requirements
mvf_req = [
    0.993
    0.993 
    0.922];

% setting up our ingredient upper bounds (from table)
upperbounds = [2.27
1.986
5.249
0.983
1.135
0.993
1.561
0.993
1.561
1.135
1.703
1.703
];

% setting up our ingredient lower bounds(from table)
lowerbounds = [
1.703
1.14
4.266
0
0
0
0
0
0
0
0
0
];

% setting it up into matlabs form
b = -[nuts_req ; mvf_req]';
A = -[nuts mvf]';


% running the linear optimisation
[x,fval,exitflag,output] = (linprog(cost, A, b, [],[],...
                                   lowerbounds, upperbounds))


[items x]
