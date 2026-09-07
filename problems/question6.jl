module Question6

function solve()::Int
    return sum(1:100)^2 - sum(abs2, 1:100)
end

end