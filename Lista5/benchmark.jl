include("matrixgen.jl")
include("methods.jl")
using .methods
using .matrixgen
using SparseArrays
using Formatting
using LinearAlgebra

MAX_SIZE = 50000
JUMP_SIZE = 50000
BLOCK_SIZE = 4

function test_single(A, b, blocksize)
    gaussElimination(A, b, blocksize)
    solveGauss(A, b, blocksize)
end

function benchmark()
    for size in JUMP_SIZE:JUMP_SIZE:MAX_SIZE

        println("Generation")
        blockmat(size, BLOCK_SIZE, 1.0, "benchmark_matrix")
        A = readMatrixFromFile(open("benchmark_matrix"))
        x = ones(A.m)
        b = A * x
        println("start test")
        (_, time, memory) = @timed test_single(A, b, BLOCK_SIZE)

        println("size: ", size)
        println("time: ", time)
        println("memory: ", memory)
        println("")
        println("")
    end
end

benchmark()