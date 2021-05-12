# Convex Optimisation Three Ways

This is the repo where I solve the same two convex optimisation problems (one linear and one quadratic) in three different languages: Excel, MATLAB and Julia

## The Problems

### The Pizza Problem - Linear Programming

The core task of the pizza problem is to minimize the cost of a pizza while maintaining a particular nutritional profile. The following tables are provided:

Table 1

|Nutrient   | Requirement|Units |
|:----------|-----------:|:-----|
|Calcium    |       750.0|mg    |
|Iron       |        12.0|mg    |
|Protein    |        48.5|g     |
|Vitamin A  |      4500.0|IU    |
|Thiamine   |         1.3|mg    |
|Niacin     |        16.0|mg    |
|Riboflavin |         1.6|mg    |
|Vitamin C  |        30.0|mg    |



Table 2

|Item         | Upper Bounds | Lower Bound |
|:------------|-------------:|------------:|
|Bacon        |         0.993|           NA|
|Celery       |         1.561|           NA|
|Cheese       |         2.270|        1.703|
|Dough        |         5.249|        4.266|
|Green Pepper |         1.561|           NA|
|Ham          |         1.135|           NA|
|Mushroom     |         1.135|           NA|
|Onion        |         0.993|           NA|
|Pepperoni    |         0.983|           NA|
|Pineapple    |         1.703|           NA|
|Sauce        |         1.986|        1.140|
|Tomato       |         1.703|           NA|
|Meat         |            NA|        0.993|
|Veg.         |            NA|        0.993|
|Fungi        |            NA|        0.922


Table 3

|Item         | Calcium|  Iron| Protein| Vitamin A| Thiamine| Niacin| Riboflavin| Vitamin C|
|:------------|-------:|-----:|-------:|---------:|--------:|------:|----------:|---------:|
|Bacon        |  13.000| 1.189|   8.392|        NA|    0.361|  1.828|      0.114|        NA|
|Celery       |  40.000| 0.250|      NA|   125.000|    0.025|  0.500|      0.025|    10.000|
|Cheese       | 517.700| 0.222|  20.000|  3000.000|    0.022|  6.000|      0.244|        NA|
|Dough        |  18.233| 3.826|  14.224|        NA|    0.586|  8.852|      0.628|        NA|
|Green Pepper |   9.459| 0.675|   1.351|   209.460|    0.081|  0.540|      0.081|   127.030|
|Ham          |   9.031| 2.291|  14.692|        NA|    0.740|  4.009|      0.178|        NA|
|Mushroom     |   6.000| 0.800|   3.000|        NA|    0.100|  4.300|      0.460|     3.000|
|Onion        |  27.273| 0.545|   1.818|    18.182|    0.363|  0.545|      0.036|    10.000|
|Pepperoni    |  10.000| 2.500|  15.000|        NA|       NA|  2.000|         NA|        NA|
|Pineapple    |  12.016| 0.310|   0.387|    25.194|    0.081|  0.193|      0.019|     6.977|
|Sauce        |  14.000| 1.800|   2.000|   800.000|    0.100|  1.400|      0.060|     6.000|
|Tomato       |  13.333| 0.533|   1.333|   450.000|    0.066|  0.800|      0.040|    22.667|

Table 4

|Item         | Cost in cents/100 grams|
|:------------|-----------------------:|
|Bacon        |                   88.54|
|Celery       |                   28.28|
|Cheese       |                   93.20|
|Dough        |                   19.26|
|Green Pepper |                   50.20|
|Ham          |                   88.10|
|Mushroom     |                   62.40|
|Onion        |                   10.66|
|Pepperoni    |                   88.22|
|Pineapple    |                   51.96|
|Sauce        |                   70.48|
|Tomato       |                   44.06|


We make two core assumptions here:

1. We assume that when nutritional info is not provided, it's zero. We'd rather be overshooting our nutritional profile than undershooting it
2. The ingredients for the categories for Meat "Veg. and Fungi are not provided, so we assume them
    * Meat: Ham, Bacon and Pepperoni
    * Veg.: Celery, Green Pepper, Onion
    * Fungi: Mushroom

### The Investment Portfolio Problem - Quadratic Programming

The investment portfolio problem is also simple: minimise the risk of from a selection of investments while delivering a benchmark 8% expected return with a portfolio size of $50,000.

The following table is provided, describing the dividend return in cents for each investment option over the past 5 years.

|Investment     | Year 1| Year 2| Year 3| Year 4| Year 5|
|:--------------|------:|------:|------:|------:|------:|
|Investment 1   |     10|      4|     12|     13|      6|
|Investment 2   |      6|      9|      6|      5|      9|
|Investment 3   |     17|      1|     11|     19|      2|

Note: The expected returns for each investment option were calculated before hand (it's just the mean over the 5 years) as well as the covariance matrix.


## Implementation Notes:

### Excel
Both problems exist in the same excel sheet, and have been solved using the solver add on. While the solver add on is not enabled by default it is included by default and can be enabled. Instructions for doing that can be found [here](https://support.microsoft.com/en-us/office/load-the-solver-add-in-in-excel-612926fc-d53b-46b4-872c-e24772f078ca).

Because of the nature of the problems, two different solver methods must be used. For the pizza problem, use "Simplex LP". For the Portfolio problem use "GRG Nonlinear". 


### MATLAB

The problems are solved in MATLAB using the inbuilt functions. I'd recommend becoming familiar with the documentation for both: [linprog](https://au.mathworks.com/help/optim/ug/linprog.html), [quadprog](https://au.mathworks.com/help/optim/ug/quadprog.html)


### Julia

The problems are solved in Julia using Convex.jl for the problem definition and SCS.jl for the actual solving. I'd recommend you make sure you have those packages installed.  At the top of each script I've commented out code that you can use to install them. Please note you only have to install them once. 

Like MATLAB, I'd also recommend reading the documentation for [Convex.jl](https://jump.dev/Convex.jl/stable/). 

## Pros and Cons

To simplify the pros and cons here's a table ranking the software packages across a variety of dimensions. Fundamentally it misses out a lot however, and I'd recommend you ultimately use what's most comfortable for you and those around you. 

| Language | Ease of Use | Usage Among "Technical" People | Usage Among "Non-Technical" People | Extensibility | Cost to Run |
|----------|:-----------:|:------------------------------:|:----------------------------------:|:-------------:|-------------|
| Julia    | 1 (tied)    | 3                              | 3                                  | 2             | 1           |
| MATLAB   | 3           | 1                              | 2                                  | 1             | 3           |
| Excel    | 1 (tied)    | 2                              | 1                                  | 3             | 2           |

