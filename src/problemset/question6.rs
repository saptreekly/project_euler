pub fn question_six() -> u64 {
    let mut sum_of_squared: u64 = 0;
    let mut square_of_sum: u64 = 0;

    for i in 1..=100 {
        sum_of_squared += i * i;
        square_of_sum += i;
    }

    square_of_sum *= square_of_sum;

    sum_of_squared.abs_diff(square_of_sum)
}
