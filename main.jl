const PROBLEMS_DIR = joinpath(@__DIR__, "problems")
const TARGET_DIR = joinpath(@__DIR__, "target")
const CACHE_FILE = joinpath(TARGET_DIR, "answers.txt")

function load_cache()::Dict{String, String}
    cache = Dict{String, String}()
    if isfile(CACHE_FILE)
        for line in eachline(CACHE_FILE)
            line = strip(line)
            isempty(line) && continue
            parts = split(line, " = ", limit=2)
            if length(parts) == 2
                cache[parts[1]] = parts[2]
            end
        end
    end
    return cache
end

function save_cache(cache::Dict{String, String})
    mkpath(TARGET_DIR)
    open(CACHE_FILE, "w") do io
        sorted_keys = sort(collect(keys(cache)), by=k -> parse(Int, match(r"\d+", k).match))
        for k in sorted_keys
            println(io, "$k = $(cache[k])")
        end
    end
end

function run_all()
    cache = load_cache()
    updated = false

    files = filter(f -> match(r"^question\d+\.jl$", f) !== nothing, readdir(PROBLEMS_DIR))
    sort!(files, by=f -> parse(Int, match(r"\d+", f).match))

    println("Running Project Euler Solutions:\n" * "="^32)

    for file in files
        q_name = splitext(file)[1]

        if haskey(cache, q_name)
            println("✓ [$q_name] (Cached): $(cache[q_name])")
        else
            filepath = joinpath(PROBLEMS_DIR, file)
            mod = Base.include(Main, filepath)

            val = nothing
            elapsed = @elapsed begin
                val = Base.invokelatest(() -> mod.solve())
            end

            cache[q_name] = string(val)
            updated = true
            time_ms = round(elapsed * 1000, digits=3)
            println("★ [$q_name] Computed: $val  (Took: $(time_ms) ms)")
        end
    end

    if updated
        save_cache(cache)
        println("="^32 * "\nNew solutions cached to `target/answers.txt`.")
    end
end

run_all()