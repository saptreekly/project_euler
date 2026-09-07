def solve():
    sum_square = sum(pow(x, 2) for x in range(1, 101))
    square_sum = pow(sum(x for x in range(1, 101)), 2)
    return abs(sum_square - square_sum)