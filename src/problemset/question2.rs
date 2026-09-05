// Question 2: Even Fibonacci Numbers

pub fn question_two() -> u32 {
    let mut one: u32 = 1;
    let mut two: u32 = 2;
    let mut sum: u32 = 0;
    while one < 4_000_000 {
        if one % 2 == 0 {
            sum += one
        }
        let buffer = one + two;
        one = two;
        two = buffer;
    }
    sum
}
