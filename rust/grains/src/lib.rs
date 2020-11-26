pub fn square(s: u32) -> u64 {
    if s > 0 && s < 65 {
        return u64::pow(2, s - 1);
    }
    panic!("Square must be between 1 and 64")
}

pub fn total() -> u64 {
    (1..65).map(square).sum()
}
