pub fn collatz(n: u64) -> Option<u64> {
    match n {
        0 => None,
        1 => Some(0),
        n if n % 2 == 0 => Some(1 + collatz(n / 2).unwrap()),
        _ => Some(1 + collatz(n * 3 + 1).unwrap()),
    }
}
