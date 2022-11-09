include("methods.jl")
using Test
using .methods

@testset "bisekcja tests" begin
    @test mbisekcji(x -> x^2, -10.0, 10.0, 0.0, 0.0)[4] == 1
    @test mbisekcji(x -> x^2 - 1, 0.0, 2.0, 0.01, 0.01)[1] ≈ 1.0 atol=0.01
    
    @test mbisekcji(x -> x^3-x-2, 1.0, 2.0, 0.01, 0.01)[1] ≈ 1.521 atol=0.01
    
    @test mbisekcji(x -> cos(x) - x * exp(x), 0.0, 1.0, 0.01, 0.01)[1] ≈ 0.517 atol=0.01
    @test mbisekcji(x -> x^4-x-10, 1.5, 2.0, 0.01, 0.01)[1] ≈ 1.86 atol=0.01
    @test mbisekcji(x -> x-exp(-x), 0.0, 2.0, 0.01, 0.01)[1] ≈ 0.565 atol=0.01

    @test mbisekcji(x -> exp(-x) * (x^2+5*x+2) + 1, -1.0, 0.0, 0.01, 0.01)[1] ≈ -0.577 atol=0.01

    @test mbisekcji(x -> x-sin(x)-(1/2), 1.0, 2.0, 0.01, 0.01)[1] ≈ 1.497 atol=0.01
    @test mbisekcji(x -> exp(-x) - 3*log(x), 0.5, 1.5, 0.000001, 0.00001)[1] ≈ 1.115448 atol=0.000001
end

@testset "Newton/styczne tests" begin
    @test mstycznych(x -> x^3 - 1, x -> 3x^2, 2.0, 0.01, 0.1, 1)[4] == 1
    @test mstycznych(x -> x^3 + 3, x -> 3x^2, -5.0, 0.01, 0.1, 100)[1] ≈ -3^(1/3) atol=0.1
    @test mstycznych(x -> (x/2)^2 + sin(x), x -> x/2 + cos(x), 1.5, 1/2*10^-5, 1/2*10^-5, 20)[1] ≈ 0 atol=0.001
end

@testset "sieczne tests" begin
    @test msiecznych(x -> x^2 - 1, -10.0, 10.0, 0.1, 0.01, 1)[4] == 1
    @test msiecznych(x -> x^2 - 1, 0.0, 2.0, 0.01, 0.1, 10)[1] ≈ 1 atol=0.1
    
    @test msiecznych(x -> x^3 - 5*x + 1, 0.0, 1.0, 0.000001, 0.000001, 10)[1] ≈ 0.201640 atol=0.000001
    @test msiecznych(x -> x^2 * exp(-x/2) - 1, 0.0, 2.0, 0.001, 0.001, 10)[1] ≈ 1.429 atol=0.001
end