# Wojciech Maziarz 254613
include("custom_prints.jl")
use_print = pprint

function f(x)
    return sqrt(x^2 + 1) - 1
end

function g(x)
    return x^2 / (sqrt(x^2 + 1) + 1)
end

for i in range(1, 200)
    x::Float64 = 8.0 ^ (-1 * i)
    x_str = string("8^{-",i,"}")
    use_print(x_str, f(x), g(x))
end

