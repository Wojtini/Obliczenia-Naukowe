include("custom_prints.jl")
include("hilb.jl")
include("matcond.jl")
using LinearAlgebra
useprint = pprint

function test_hilb(size)
    A = hilb(size)
    x = ones(size)
    gauss, inverse = test_matrix(A, x)
    useprint(size, rank(A), cond(A), norm(inverse - x)/norm(x), norm(gauss - x)/norm(x))
end

function test_random(size, c)
    A = matcond(size, c)
    x = ones(size)
    gauss, inverse = test_matrix(A, x)
    useprint(size, rank(A), cond(A), norm(inverse - x)/norm(x), norm(gauss - x)/norm(x))
end

function test_matrix(A, x)
    b = A * x

    gauss = A \ b
    inverse = inv(A) * b
    return gauss, inverse
end

println("Hilbert")
for n in 1:20
    test_hilb(n)
end 

sizes = [5, 10, 20]
conds = [1.0, 10.0, 10^3, 10^7, 10^12, 10^16]

println("Losowa")
for size in sizes
    for cond in conds
        test_random(size, cond)
    end
end
