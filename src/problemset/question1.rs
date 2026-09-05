// Question 1: Multiples of 3 or 5

pub fn question_one() -> i32 {
    let mut answer: i32 = 0;
    for i in 0..=1000 {
        if i % 3 == 0 || i % 5 == 0 {
            answer += i
        }
    }
    answer
}
