# Wojciech Maziarz 254613
include("custom_prints.jl")
use_print = pprint
float = Float64

function nextfloatvalue(x, guess)
    use_print(x, bitstring(x))
    use_print("nextfloat(x)", bitstring(nextfloat(x)))
    difference = nextfloat(x) - x
    use_print(guess,difference)
end

from = float(1.0)
guess = float(2.0)^(-52)
x = nextfloatvalue(from, guess)

from = float(2.0)
guess = float(2.0)^(-51)
x = nextfloatvalue(from, guess)

from = float(0.5)
guess = float(2.0)^(-53)
x = nextfloatvalue(from, guess)