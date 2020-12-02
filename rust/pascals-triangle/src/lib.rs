pub struct PascalsTriangle {
    rows: Vec<Vec<u32>>,
}

impl PascalsTriangle {
    pub fn new(row_count: u32) -> Self {
        let rows = (1..=row_count).fold(Vec::new(), |acc, c| match c {
            1 => vec![vec![1]],
            _ => {
                let row = [
                    vec![1],
                    acc.last()
                        .unwrap()
                        .windows(2)
                        .map(|x| x.iter().sum())
                        .collect(),
                    vec![1],
                ]
                .concat();
                [acc, vec![row]].concat()
            }
        });

        PascalsTriangle { rows }
    }

    pub fn rows(&self) -> Vec<Vec<u32>> {
        self.rows.clone()
    }
}
