pub fn build_proverb(list: &[&str]) -> String {
    let mut i = 0;
    let mut proverb = Vec::new();

    for elem in list {
        i = i + 1;
        if list.len() == i {
            proverb.append(&mut vec![format!("And all for the want of a {}.", list[0])])
        } else {
            proverb.append(&mut vec![format!(
                "For want of a {} the {} was lost.",
                elem, list[i]
            )]);
        }
    }
    proverb.join("\n")
}
