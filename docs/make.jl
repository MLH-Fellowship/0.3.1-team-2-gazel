using Documenter, 0.3.1-team-2

makedocs(;
    modules=[0.3.1-team-2],
    format=Documenter.HTML(),
    pages=[
        "Home" => "index.md",
    ],
    repo="https://github.com/dnabanita7/0.3.1-team-2/blob/{commit}{path}#L{line}",
    sitename="0.3.1-team-2",
    authors="Nabanita Dash, Biswajit Ghosh, Gautam Mishra",
    assets=String[],
)

deploydocs(;
    repo="github.com/dnabanita7/0.3.1-team-2",
)
