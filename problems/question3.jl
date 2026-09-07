module Question3

using Primes

function solve()::Int
    n = 600851475143
    
    return maximum(keys(factor(n))) # work smarter, not harder!

end

end