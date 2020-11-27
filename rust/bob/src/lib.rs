pub fn reply(message: &str) -> &str {
    let message = message.trim();
    let is_shouting =
        message.chars().any(|c| c.is_alphabetic()) && message.to_uppercase() == message;
    let is_question = message.ends_with("?");

    if is_shouting && is_question {
        return "Calm down, I know what I'm doing!";
    }

    if is_question {
        return "Sure.";
    }

    if message.is_empty() {
        return "Fine. Be that way!";
    }

    if is_shouting {
        return "Whoa, chill out!";
    }

    return "Whatever.";
}
