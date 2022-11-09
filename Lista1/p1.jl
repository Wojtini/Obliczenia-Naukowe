# Wojciech Maziarz 254613
precisions = [Float16, Float32, Float64]

function closest_above(float, number=1.0)
    x = float(2.0)
    target = float(number)
    val = x
    while x != number 
        val = x
        x = (x + target) / 2
    end
    return val - target
end

function max(float)
    x = float(1.0)
    while !isinf(x * float(2.0))
        x = x * float(2.0)
    end
    sec = x / float(2.0)
    
    while sec != 0
        while !isinf(x + sec) && x != (x + sec)
            x = x + sec
        end
        sec = sec / float(2.0)
    end

    return x
end


for precision in precisions
    println(precision)
    println("macheps")
    println(closest_above(precision, precision(1.0)))
    println(eps(precision))
    println("eta")
    println(closest_above(precision, precision(0.0)))
    println(nextfloat(precision(0.0)))
    println("max")
    m = max(precision)
    println(m)
    println(bitstring(m))
    println(floatmax(precision))
    println(bitstring(floatmax(precision)))
end

println("Float32")
println(floatmin(Float32))
println("Float64")
println(floatmin(Float64))
