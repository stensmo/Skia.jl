using Skia
using Documenter, DocumenterVitepress


pages = [
    "Home" => "index.md",
    "API" => "api.md",
    "Examples" => "examples.md",
]


makedocs(; 
    sitename = "Skia.jl Documentation", 
    authors = "Erik Stensmo",
    modules = [Skia],
    warnonly = true,
    checkdocs=:all,
    format=DocumenterVitepress.MarkdownVitepress(
        repo = "github.com/stensmo/Skia.jl", # this must be the full URL!
    ),
    pages=pages,
)



   

DocumenterVitepress.deploydocs(; repo="github.com/stensmo/Skia.jl",)