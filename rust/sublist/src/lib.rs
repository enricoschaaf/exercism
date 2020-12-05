use Comparison::*;

#[derive(Debug, PartialEq)]
pub enum Comparison {
    Equal,
    Sublist,
    Superlist,
    Unequal,
}

pub fn sublist<T: PartialEq>(first_list: &[T], second_list: &[T]) -> Comparison {
    match (first_list.len(), second_list.len()) {
        (0, 0) => Equal,
        (0, _) => Sublist,
        (_, 0) => Superlist,
        (x, y) if x < y => {
            if second_list.windows(x).any(|v| v == first_list) {
                Sublist
            } else {
                Unequal
            }
        }
        (x, y) if x > y => {
            if first_list.windows(y).any(|v| v == second_list) {
                Superlist
            } else {
                Unequal
            }
        }
        (_, _) => {
            if first_list == second_list {
                Equal
            } else {
                Unequal
            }
        }
    }
}
