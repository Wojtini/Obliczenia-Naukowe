include("methods.jl")
using Test
using .methods

ns = [5, 10, 15]

for n in ns
    rysujNnfx(x -> exp(x), 0.0, 1.0, n, "5I1")
    rysujNnfx(x -> x^2 * sin(x), -1.0, 1.0, n, "5I2")
    rysujNnfx(x -> abs(x), -1.0, 1.0, n, "6I1")
    rysujNnfx(x -> 1 / (1 + x^2), -5.0, 5.0, n, "6I2")

end
