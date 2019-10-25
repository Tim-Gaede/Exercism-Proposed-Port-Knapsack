using Test

include("knapsack.jl")

# Tests adapted from `problem-specifications//canonical-data.json` @ v1.0.0

println("\n"^2, "-"^54, "\n"^3)

@testset "No items................................" begin
    @test maximum_value(100, []) == 0
end

@testset "One item is too heavy..................." begin
    @test maximum_value(10, [Dict("weight" => 100, "value" => 1)]) == 0
end

@testset "Five items.  Cannot be greedy by weight." begin
    @test maximum_value(10, [Dict("weight" =>  2, "value" =>  5),
                             Dict("weight" =>  2, "value" =>  5),
                             Dict("weight" =>  2, "value" =>  5),
                             Dict("weight" =>  2, "value" =>  5),
                             Dict("weight" => 10, "value" => 21)]) == 21
end

@testset "Five items.  Cannot be greedy by value.." begin
    @test maximum_value(10, [Dict("weight" =>  2, "value" => 20),
                             Dict("weight" =>  2, "value" => 20),
                             Dict("weight" =>  2, "value" => 20),
                             Dict("weight" =>  2, "value" => 20),
                             Dict("weight" => 10, "value" => 50)]) == 80
end

@testset "Example knapsack........................" begin
    @test maximum_value(10, [Dict("weight" => 5, "value" => 10),
                             Dict("weight" => 4, "value" => 40),
                             Dict("weight" => 6, "value" => 30),
                             Dict("weight" => 4, "value" => 50)]) == 90
end

@testset "Eight items............................." begin
    @test maximum_value(104, [Dict("weight" => 25, "value" => 350),
                              Dict("weight" => 35, "value" => 400),
                              Dict("weight" => 45, "value" => 450),
                              Dict("weight" =>  5, "value" =>  20),
                              Dict("weight" => 25, "value" =>  70),
                              Dict("weight" =>  3, "value" =>   8),
                              Dict("weight" =>  2, "value" =>   5),
                              Dict("weight" =>  2, "value" =>   5)]) == 900
end

@testset "Fifteen items..........................." begin
    @test maximum_value(750, [Dict("weight" =>  70, "value" => 135),
                              Dict("weight" =>  73, "value" => 139),
                              Dict("weight" =>  77, "value" => 149),
                              Dict("weight" =>  80, "value" => 150),
                              Dict("weight" =>  82, "value" => 156),
                              Dict("weight" =>  87, "value" => 163),
                              Dict("weight" =>  90, "value" => 173),
                              Dict("weight" =>  94, "value" => 184),
                              Dict("weight" =>  98, "value" => 192),
                              Dict("weight" => 106, "value" => 201),
                              Dict("weight" => 110, "value" => 210),
                              Dict("weight" => 113, "value" => 214),
                              Dict("weight" => 115, "value" => 221),
                              Dict("weight" => 118, "value" => 229),
                              Dict("weight" => 120, "value" => 240)]) == 1458
end
