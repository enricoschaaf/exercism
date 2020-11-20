pub fn nth(n: u32) -> u32 {
    match n {
        0 => 2,
        n => (3..)
            .step_by(2)
            .filter(|&i| !(2..i / 2 + 1).any(|x| i % x == 0))
            .nth((n - 1) as usize)
            .unwrap(),
    }
}
