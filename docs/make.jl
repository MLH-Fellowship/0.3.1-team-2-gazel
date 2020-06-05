using Documenter, gazel

makedocs(;
    modules=[gazel],
    format=Documenter.HTML(),
    pages=[
        "Home" => "index.md",
    ],
    repo="https://github.com/dnabanita7/gazel.jl/blob/{commit}{path}#L{line}",
    sitename="gazel.jl",
    authors="Nabanita Dash, Biswajit Ghosh, Gautam Mishra",
    assets=String[],
)

deploydocs(;
    repo="github.com/dnabanita7/gazel.jl",
)
