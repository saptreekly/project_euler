module Question2

function solve()::Int
    limit = 4_000_000
    a, b = 1, 2
    sum = 0
    while a < limit 
        if a%2 == 0
            sum += a
        end
        a, b = b, a + b
    end
    return sum
end

end