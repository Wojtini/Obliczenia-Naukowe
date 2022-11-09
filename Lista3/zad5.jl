include("methods.jl")
using .methods


f = x -> 3*x - exp(x)
epsilon = 1/2 * 10 ^ -5
delta = 1/2 * 10 ^ -5

println("Bisekcja")
println(mbisekcji(f, 0.0, 1.5, delta, epsilon))