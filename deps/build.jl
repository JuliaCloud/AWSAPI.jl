using NodeJS

# Directory into which we'll install Node.js packages via npm
const NPM_DIR = joinpath(@__DIR__, "node_modules")

if !isdir(NPM_DIR)
    run(setenv(`$(npm_cmd()) install to-markdown`, dir=@__DIR__))
end

if !isdir(joinpath(NPM_DIR, "to-markdown"))
    error("installation of Node.js module to-markdown did not complete successfully")
end

if !isfile(joinpath(@__DIR__, "deps.jl"))
    open(joinpath(@__DIR__, "deps.jl"), "w") do io
        println(io, "const NPM_DIR = \"", NPM_DIR, "\"")
    end
end
