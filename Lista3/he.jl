include("methods.jl")
using Test
using .methods

f1 = x -> x^(1/3)
f2 = x -> 1/3 * x^(-2/3)
println(mstycznych(x -> x^2+1, x -> 2*x, 8.0, 1/2*10^-5, 1/2*10^-5, 200))
