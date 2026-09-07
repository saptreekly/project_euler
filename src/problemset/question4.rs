// Question 4: Largest Palindrome Product

pub fn question_four() -> u32 {
    let mut largest: i32 = 0;
    for i in 100..=999 {
        for j in 100..=999 {
            let prod = i * j;
            if check_palindrome(prod) && prod > largest {
                largest = prod;
            }
        }
    }
    largest as u32
}

fn check_palindrome(n: i32) -> bool {
    let string_n: String = n.to_string();
    let string_n_rev: String = string_n.chars().rev().collect();

    if string_n == string_n_rev {
        return true;
    }
    false
}
