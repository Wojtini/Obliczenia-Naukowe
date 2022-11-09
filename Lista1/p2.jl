# Wojciech Maziarz 254613
include("custom_prints.jl")
use_print = pprint
precisions = [Float16, Float32, Float64]


function kahan(float)
    float(3)*(float(4)/float(3)-float(1))-float(1)
end

for precision in precisions
    use_print(precision, kahan(precision), eps(precision))
end
