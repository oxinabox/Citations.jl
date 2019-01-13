using Documenter, Citations

makedocs(;
    modules=[Citations],
    format=Documenter.HTML(),
    pages=[
        "Home" => "index.md",
    ],
    repo="https://github.com/oxinabox/Citations.jl/blob/{commit}{path}#L{line}",
    sitename="Citations.jl",
    authors="Lyndon White",
    assets=[],
)

deploydocs(;
    repo="github.com/oxinabox/Citations.jl",
)
