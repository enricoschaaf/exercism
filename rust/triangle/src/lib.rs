pub struct Triangle<T> {
    sides: [T; 3],
}

impl<T> Triangle<T>
where
    T: std::ops::Add<Output = T> + std::cmp::PartialOrd + Copy,
{
    pub fn build(sides: [T; 3]) -> Option<Triangle<T>> {
        match sides {
            [a, b, c] if a + b <= c || a + c <= b || b + c <= a => None,
            _ => Some(Triangle { sides }),
        }
    }

    pub fn is_equilateral(&self) -> bool {
        Triangle::is_type(self, 1)
    }

    pub fn is_scalene(&self) -> bool {
        Triangle::is_type(self, 3)
    }

    pub fn is_isosceles(&self) -> bool {
        Triangle::is_type(self, 2)
    }

    fn is_type(triangle: &Triangle<T>, len: usize) -> bool {
        let mut vec = triangle.sides.to_vec();
        vec.sort_by(|a, b| a.partial_cmp(b).unwrap());
        vec.dedup();
        vec.len() == len
    }
}
