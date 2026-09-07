def solve():
    a, b = 1, 2
    sum = 0
    while a < 4_000_000:
        if a % 2 == 0:
            sum += a
        a, b = b, a + b
    return sum
