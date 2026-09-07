module Question1

function solve()::Int
    
    limit = 1000
    
    sum_multiples(n) = begin
        p = (limit - 1) ÷ n
        n * p * (p + 1) ÷ 2
    
    end

    return sum_multiples(3) + sum_multiples(5) - sum_multiples(15)

end

end