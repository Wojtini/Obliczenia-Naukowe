# Wojciech Maziarz 254613
include("custom_prints.jl")
use_print = pprint

function wzor(x)
    return x*(float(1.0)/x)
end

function z4(how_many, float)
    x = float(1.0)
    found = 0
    me = eps(float)
    while x < float(2.0) && found < how_many
        x = x + me
        if (wzor(x) != 1)
            found += 1
            use_print(x, wzor(x))
        end
    end
end

N = 10
z4(N, Float64)