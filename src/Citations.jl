module Citations

export cite, @declare_citation

cite(::Any) = missing

cite(m::Module) = cite(m.eval)  # every module has a unique `eval` function

#todo think about this
#cite_all(m::Module) = skipmissing(cite.(eval.(names(m))))

"""
    @declare_citation ref

Use this within a module (e.g. a package) to declare a citation for it.
After this has been used to declare a citation `ref` for `MyModule`
it can be looked up using `cite(MyModule)` which will return `ref`
"""
macro declare_citation(ref)
    :(Citations.@declare_citation($(__module__).eval, $(esc(ref))))
end

"""
    @declare_citation fun ref

Declares a citation for the function `fun`, with the value `ref`.
After this has been used, it can be looked up using
by calling the `cite` function from the Citation package
`cite(fun)` will return `ref`.
"""
macro declare_citation(fun, ref)
    :(Citations.cite(::typeof($(esc(fun)))) = $(esc(ref)))
end


# We declare the citations for the julia modules directly on the eval,
# Normally you would just `@declare_cite` in the module itself 
@declare_citation Core.eval "Julia: A Fresh Approach to Numerical Computing. Jeff Bezanson, Alan Edelman, Stefan Karpinski and Viral B. Shah (2017) SIAM Review, 59: 65–98. doi: 10.1137/141000671. url: http://julialang.org/publications/julia-fresh-approach-BEKS.pdf."



end # module
