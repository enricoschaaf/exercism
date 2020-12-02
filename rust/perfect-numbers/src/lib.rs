#[derive(Debug, PartialEq, Eq)]
pub enum Classification {
    Abundant,
    Perfect,
    Deficient,
}

pub fn classify(num: u64) -> Option<Classification> {
    let aliquot_sum: u64 = (1..num / 2 + 1).filter(|x| num % x == 0).sum();

    match num {
        num if num < 1 => None,
        num if aliquot_sum == num => Some(Classification::Perfect),
        num if aliquot_sum > num => Some(Classification::Abundant),
        num if aliquot_sum < num => Some(Classification::Deficient),
        _ => None,
    }
}
