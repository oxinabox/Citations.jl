using Citations
using Test

module Demo
    using Citations
    export mul, add
    
    @declare_citation "Demo Citation Module"

    mul(x,y)=x*y
    @declare_citation mul "-2000BC, Babylonians, Multiplication"
    
    add(x,y) = x+y
    Citations.cite(::typeof(add)) = "Lost To Time, Addition"

end
using .Demo

@testset "Citations.jl" begin
    @testset "Functions" begin
        @test cite(mul) == "-2000BC, Babylonians, Multiplication"
        @test cite(add) == "Lost To Time, Addition"
    end

    @testset "Modules" begin
        @test cite(Demo) == "Demo Citation Module"
    end


    @testset "Citing julia" begin
        @test match(r"Julia.*Jeff.*Alan.*Stefan.*Viral", cite(Core)) != nothing
    end
end
