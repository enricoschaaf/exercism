use chrono::{DateTime, NaiveDateTime, Utc};

// Returns a Utc DateTime one billion seconds after start.
pub fn after(start: DateTime<Utc>) -> DateTime<Utc> {
    let seconds = DateTime::<Utc>::from(start).timestamp() + 1_000_000_000;
    let native_date_time = NaiveDateTime::from_timestamp(seconds, 0);
    return DateTime::<Utc>::from_utc(native_date_time, Utc);
}