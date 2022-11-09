# Wojciech Maziarz 254613
include("custom_prints.jl")
use_print = lprint
float = Float64

function f(x)
    return sin(x) + cos(3 * x)
end

function f_wzor(x, h)
    return (f(x+h)-f(x))/h
end

function f_derivative(x)
    return cos(x) - 3 * sin(3 * x)
end

x = float(1.0)
n_values = float[-x for x=0:54]

if use_print == pprint
    println("n  x+h  pochodna  wzor_pochodnej")
end
for n in n_values
    h::float = 2.0^(n)
    use_print(n, x+h, f_wzor(x, h), abs(f_derivative(x)-f_wzor(x, h)))
end