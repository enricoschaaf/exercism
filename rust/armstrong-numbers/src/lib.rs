pub fn is_armstrong_number(num: u32) -> bool {
    let string = num.to_string();
    num == string
        .chars()
        .map(|c| c.to_digit(10).unwrap().pow(string.len() as u32))
        .sum::<u32>()
}
