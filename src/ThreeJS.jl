module ThreeJS 

import Patchwork
import Patchwork.Elem
using Compat

export outerdiv, initscene

include("util.jl")
include("render.jl")
include("properties.jl")

"Outer div to keep the three-js tag in."
function outerdiv(w::String="100%",h::String="600px")
    Elem(:div, style=@compat Dict(:width=>w, :height=>h))
end

"Initiates a three-js scene"
function initscene()
        Elem(:"three-js")
end

if isdefined(Main, :IJulia)
    assetpath = Pkg.dir("ThreeJS","assets","bower_components")
    polymermicro = readall(joinpath(assetpath,"polymer","polymer-micro.html"))
    polymermini = readall(joinpath(assetpath,"polymer","polymer-mini.html"))
    polymer = readall(joinpath(assetpath,"polymer","polymer.html"))
    three= readall(joinpath(assetpath,"three-js","threejs","three.js"))
    trackball = readall(
        joinpath(assetpath,"three-js","threejs","TrackballControls.js")
        )
    threejs = readall(joinpath(assetpath,"three-js","three-js.html"))
    display(
        MIME"text/html"(),
        "$polymermicro$polymermini$polymer
        <script>$three</script>
        <script>$trackball</script>
        $threejs"
    )
end

end # module
