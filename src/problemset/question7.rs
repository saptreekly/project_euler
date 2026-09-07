// Question 7: 10,001st Prime Number

pub fn question_seven() -> i32 {
    let limit: usize = 120_000;
    let primes: Vec<usize> = sieve(limit);
    primes[10_000] as i32
}

fn sieve(limit: usize) -> Vec<usize> {
    let mut is_prime: Vec<bool> = vec![true; limit + 1];
    is_prime[0] = false;
    is_prime[1] = false;

    for p in 2..=((limit as f64).sqrt() as usize) {
        if is_prime[p] {
            for multiple in (p * p..=limit).step_by(p) {
                is_prime[multiple] = false;
            }
        }
    }

    is_prime
        .iter()
        .enumerate()
        .filter_map(|(num, &prime)| if prime { Some(num) } else { None })
        .collect()
}
