usefloat = Float32
include("custom_prints.jl")
use_print = pprint

function p(prev_p, r)
    prev_p + r * prev_p * (1 - prev_p)
end

function print_tab(A, B)
    if length(A) != length(B)
        return
    end
    for n in 1:length(A)
        use_print(B[n], A[n])
    end
end

p_0 = usefloat(0.01)
r = usefloat(3.0)
A = [p_0]
B = [p_0]
for n in 2:40
    append!(A, p(A[n-1], r))
    if n != 11
        append!(B, p(B[n-1], r))
    else
        append!(B, usefloat(0.722))
    end
end

println("p_0 = ", p_0, " r = ", r)
println("Normalne Zaburzone")
# print_tab(A, B)

#FLoat 32 i 64

A = [Float64(0.01)]
r_a = Float64(3.0)
B = [Float32(0.01)]
r_b = Float32(3.0)
for n in 2:40
    append!(A, p(A[n-1], r_a))
    append!(B, p(B[n-1], r_b))
end

println("p_0 = ", p_0, " r = ", r)
println("Float32 Float64")
print_tab(A, B)
