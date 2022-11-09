# Wojciech Maziarz 254613
function lprint(numbers...)
    converted = []
    for number in numbers
        if occursin("{", string(number))
            push!(converted, string("\$",number,"\$"))
        else
            push!(converted, string("\\num{",number,"}"))
        end
    end
    print(join(converted, " & "))
    print(" \\\\ \\hline \n")
end

macro Name(arg)
    string(arg)
 end

function pprint(numbers...)
    converted = [string(number) for number in numbers]
    print(join(converted, "  "))
    print("\n")
end