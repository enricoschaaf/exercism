pub fn abbreviate(phrase: &str) -> String {
    String::from(" ")
        .chars()
        .chain(phrase.chars())
        .zip(phrase.chars())
        .filter(|t| {
            t.1.is_alphabetic() && !t.0.is_alphabetic() && t.0 != '\''
                || t.1.is_uppercase() && t.0.is_lowercase()
        })
        .map(|(_, c)| c)
        .collect::<String>()
        .to_uppercase()
}
