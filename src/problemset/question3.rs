// Question 3: Largest Prime Factor

pub fn question_three() -> u64 {
    const NUM: u64 = 600_851_475_143;
    let mut largest: u64 = 0;
    let square_num: u64 = (NUM.isqrt() as u64) + 1;

    for i in 1..=square_num {
        if check_prime(i) && NUM % i == 0 && i > largest {
            largest = i
        }
    }
    largest
}

fn check_prime(n: u64) -> bool {
    let square_n: u64 = (n.isqrt() as u64) + 1;
    if n <= 2 {
        return false;
    }
    for i in (3..=square_n).step_by(2) {
        if n % i == 0 {
            return false;
        }
    }
    true
}