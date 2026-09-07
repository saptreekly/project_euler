module Question4

@inline function is_palindrome_6digit(n::Int)::Bool
    # Short-circuit comparison from outer digits to inner digits.
    # Division by constants is compiled by LLVM into fast reciprocal multiplications.
    (n ÷ 100000 == n % 10) &&
    ((n ÷ 10000) % 10 == (n ÷ 10) % 10) &&
    ((n ÷ 1000) % 10 == (n ÷ 100) % 10)
end

function solve()::Int
    max_pal = 0
    best_factors = (0, 0)

    for i in 999:-1:100
        # If the largest possible product with this i cannot beat max_pal, stop searching
        if i * 999 <= max_pal
            break
        end

        # A 6-digit palindrome is always divisible by 11.
        # If i is not divisible by 11, j MUST be divisible by 11.
        if i % 11 == 0
            start_j = i
            step_j = 1
        else
            start_j = i - (i % 11)
            step_j = 11
        end

        for j in start_j:-step_j:100
            p = i * j
            if p <= max_pal
                break
            end

            if is_palindrome_6digit(p)
                max_pal = p
                best_factors = (i, j)
                break
            end
        end
    end

    return max_pal
end

end