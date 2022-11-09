include("methods.jl")
using Test
using .methods



@testset "ilorazyRoznicowe test" begin
    @test ilorazyRoznicowe([3.0, 1.0, 5.0, 6.0], [1.0, -3.0, 2.0, 4.0]) ≈ [1.0, 2.0, -0.37, 0.17] atol=0.01
    @test ilorazyRoznicowe([1.0, 3.0, 4.0, 5.0], [4.0, -2.0, 10.0, 16.0]) ≈ [4.0, -3.0, 5.0, -2.0] atol=0.1
end

x = [1.0, 3.0, 4.0, 5.0]
fx = [4.0, -2.0, 10.0, 16.0]
ir = ilorazyRoznicowe([1.0, 3.0, 4.0, 5.0], [4.0, -2.0, 10.0, 16.0])
@testset "warNewton test" begin
    @test warNewton(x, ir, 1.0) ≈ 4.0  atol=0.1
    @test warNewton(x, ir, 9.0) ≈ -260.0  atol=0.1
end

@testset "naturalna test" begin
    @test naturalna(x, fx) ≈ [-156.0, 262.0, -118.0, 16.0]  atol=0.1
end