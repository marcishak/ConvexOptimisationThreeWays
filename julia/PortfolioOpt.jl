# using Pkg
# Pkg.add("Convex")
# Pkg.add("SCS")


using Convex, SCS


# Q4 - Portfolio Opt

Σ = [
    0.0012	-0.00056	0.0023;
    -0.00056	0.00028	-0.0012;
    0.0023	-0.0012	0.00552 
    ]

μ = [0.09 0.07 0.1]


x = Variable(length(μ))

benchmark_return = 4000

portfolio_risk = quadform(x, Σ)

portfolio_return = dot(x, μ)

xᵤ = 50000

xₗ = 0

problem = minimize(
    portfolio_risk, 
    portfolio_return >= benchmark_return,
    x <= xᵤ,
    x >= xₗ,
    sum(x) <= xᵤ
)

solve!(problem, SCS.Optimizer)

sol_x = evaluate(x)

print(sol_x)

