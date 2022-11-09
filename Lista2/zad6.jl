include("custom_prints.jl")
use_print = pprint

function x(prev_x, c)
    prev_x^2 + c
end

vals = [
    [Float64(-2), [Float64(1)]],
    [Float64(-2), [Float64(2)]],
    [Float64(-2), [Float64(1.99999999999999)]],
    [Float64(-1), [Float64(1)]],
    [Float64(-1), [Float64(-1)]],
    [Float64(-1), [Float64(0.75)]],
    [Float64(-1), [Float64(0.25)]],
]

for val in vals
    c = val[1]
    for n in 2:41
        # println(val[2][n-1])
        append!(val[2], x(val[2][n-1], c))
    end
end

for n in 1:40
    use_print(
        # vals[1][2][n],
        # vals[2][2][n],
        vals[3][2][n],
        # vals[4][2][n],
        # vals[5][2][n],
        # vals[6][2][n],
        # vals[7][2][n],
    )
end