# Wojciech Maziarz 254613
include("custom_prints.jl")
use_print = pprint
precisions = [Float32, Float64]

function sum_forward(X, Y)
    if length(X) != length(Y)
        println("Bad matrix")
        return
    end
    S = 0
    for i in range(1, length(X))
        S = S + X[i] * Y[i]
    end
    return S
end

function sum_backwards(X, Y)
    if length(X) != length(Y)
        println("Bad matrix")
        return
    end
    S = 0
    for i in range(length(X), 1, step=-1)
        S = S + X[i] * Y[i]
    end
    return S
end

function sum_highest_to_lowest(X, Y, T)
    if length(X) != length(Y)
        println("Bad matrix")
        return
    end
    P = multiply_arrays(X, Y, T)
    sort!(P, by=abs)
    return positive_negative_separate_sum(P, T)
end

function sum_lowest_to_highest(X, Y, T)
    if length(X) != length(Y)
        println("Bad matrix")
        return
    end
    P = multiply_arrays(X, Y, T)
    sort!(P, by=abs, rev=true)
    return positive_negative_separate_sum(P, T)
end

function multiply_arrays(X, Y, T)
    P = Array{T}(undef, length(X))
    for i in range(1, length(X))
        P[i] = X[i]::T * Y[i]::T
    end
    return P
end

function positive_negative_separate_sum(P, T)
    S_minus::T = 0
    S_plus::T = 0
    for p in P
        if p < 0
            S_minus += p
        else
            S_plus += p
        end
    end
    return S_minus + S_plus
end

for precision in precisions
    x = precision[2.718281828, -3.141592654, 1.414213562, 0.5772156649, 0.3010299957]
    y = precision[1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]
    use_print(precision)
    use_print(sum_forward(x, y))
    use_print(sum_backwards(x, y))
    use_print(sum_lowest_to_highest(x, y, precision))
    use_print(sum_highest_to_lowest(x, y, precision))
end