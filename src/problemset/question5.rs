// Question 5: Smallest Multiple

pub fn question_five() -> u64 {
    let mut n: u64 = 10;
    loop {
        if check_divisible(n) {
            return n
        }
        n += 10;
    }
}

fn check_divisible(n: u64) -> bool {
    for i in 1..=20 {
        if n%i != 0 {
            return false
        }
    }
    true
}