module Citations

export cite, @declare_citation

cite(::Any) = missing

cite(m::Module) = cite(m.eval)  # every module has a unique `eval` function

#todo think about this
#cite_all(m::Module) = skipmissing(cite.(eval.(names(m))))


"""
    declare_citation(function|module,  ref)

    Declares a citation for a function or module.
    After this has been used, it can be looked up using
    by calling the `cite` function from the Citation package
"""
function declare_citation(fun::T, ref)
    Citations.eval(:(Citations.cite(::$T) = $(ref)))
end

declare_citation(m::Module, ref) = declare_citation(m.eval, ref)



# Citations for Julia itself
declare_citation(Core.eval, "Julia: A Fresh Approach to Numerical Computing. Jeff Bezanson, Alan Edelman, Stefan Karpinski and Viral B. Shah (2017) SIAM Review, 59: 65–98. doi: 10.1137/141000671. url: http://julialang.org/publications/julia-fresh-approach-BEKS.pdf.")


end # module
