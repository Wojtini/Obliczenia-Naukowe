include("methods.jl")
using .methods


f = x -> sin(x) - 1/4 * x^2
pf = x -> cos(x) - 1/2 * x
epsilon = 1/2 * 10 ^ -5
delta = 1/2 * 10 ^ -5
maxit = 100

println("Bisekcja")
println(mbisekcji(f, 1.5, 2.0, delta, epsilon))
println("Newton")
println(mstycznych(f, pf, 1.5, delta, epsilon, maxit))
println("Sieczne")
println(msiecznych(f, 1.0, 2.0, delta, epsilon, maxit))