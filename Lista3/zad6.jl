include("methods.jl")
using .methods


f1 = x -> exp(1-x)-1
pf1 = x -> -exp(1-x)
f2 = x -> x*exp(-x)
pf2 = x -> -exp(-x) * (-1 + x)

epsilon = 1/2 * 10 ^ -5
delta = 1/2 * 10 ^ -5

maxit = 100

println("f1")

println("Bisekcja")
println(mbisekcji(f1, 0.0, 1.1, delta, epsilon))
println("Newton")
println(mstycznych(f1, pf1, -1.0, delta, epsilon, maxit))
println("Sieczne")
println(msiecznych(f1, -1.0, 0.0, delta, epsilon, maxit))


println("f2")

println("Bisekcja")
println(mbisekcji(f2, -1.0, 2.0, delta, epsilon))
println("Newton")
println(mstycznych(f2, pf2, -1.0, delta, epsilon, maxit))
println("Sieczne")
println(msiecznych(f2, -2.0, -1.0, delta, epsilon, maxit))