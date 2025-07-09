library;

use std::logging::log;

/// Checks if a number is even
pub fn is_even(x: u64) -> bool {
    x % 2 == 0
}

/// Checks if a number is odd
pub fn is_odd(x: u64) -> bool {
    !is_even(x)
}

/// Simple struct to demonstrate library usage
pub struct Point {
    pub x: u64,
    pub y: u64,
}

impl Point {
    /// Creates a new Point
    pub fn new(x: u64, y: u64) -> Self {
        Point { x, y }
    }

    /// Calculates the Manhattan distance from origin
    pub fn manhattan_distance(self) -> u64 {
        self.x + self.y
    }
}

// test
#[test]
fn test_is_even_with_even_numbers() {
    assert(is_even(0));
    assert(is_even(2));
    assert(is_even(4));
    assert(is_even(100));
    assert(is_even(1000));
}

#[test] 
fn test_is_even_with_odd_numbers() {
    assert(!is_even(1));
    assert(!is_even(3));
    assert(!is_even(5));
    assert(!is_even(99));
    assert(!is_even(1001));
}

#[test]
fn test_is_odd_with_odd_numbers() {
    assert(is_odd(1));
    assert(is_odd(3));
    assert(is_odd(5));
    assert(is_odd(99));
    assert(is_odd(1001));
}

#[test]
fn test_is_odd_with_even_numbers() {
    assert(!is_odd(0));
    assert(!is_odd(2));
    assert(!is_odd(4));
    assert(!is_odd(100));
    assert(!is_odd(1000));
}

#[test]
fn test_is_even_and_is_odd_are_complementary() {
    let test_values = [0, 1, 2, 3, 42, 43, 100, 101];
    let mut i = 0;
    while i < 8 {
        let val = test_values[i];
        // Every number should be either even or odd, but not both
        assert(is_even(val) != is_odd(val));
        i += 1;
    }
}

#[test]
fn test_point_creation() {
    let p1 = Point::new(0, 0);
    assert_eq(p1.x, 0);
    assert_eq(p1.y, 0);

    let p2 = Point::new(5, 10);
    assert_eq(p2.x, 5);
    assert_eq(p2.y, 10);

    let p3 = Point::new(1000, 2000);
    assert_eq(p3.x, 1000);
    assert_eq(p3.y, 2000);
}

#[test]
fn test_manhattan_distance_origin() {
    let origin = Point::new(0, 0);
    assert_eq(origin.manhattan_distance(), 0);
}

#[test]
fn test_manhattan_distance_positive_coordinates() {
    let p1 = Point::new(3, 4);
    assert_eq(p1.manhattan_distance(), 7);

    let p2 = Point::new(1, 1);
    assert_eq(p2.manhattan_distance(), 2);

    let p3 = Point::new(10, 20);
    assert_eq(p3.manhattan_distance(), 30);
}

#[test]
fn test_manhattan_distance_single_axis() {
    let p_x_axis = Point::new(5, 0);
    assert_eq(p_x_axis.manhattan_distance(), 5);

    let p_y_axis = Point::new(0, 7);
    assert_eq(p_y_axis.manhattan_distance(), 7);
}

#[test]
fn test_manhattan_distance_large_values() {
    let large_point = Point::new(1000, 2000);
    assert_eq(large_point.manhattan_distance(), 3000);

    let max_point = Point::new(u64::max() / 2, u64::max() / 2);
    // This should not overflow since we're using max/2 for each coordinate
    assert_eq(max_point.manhattan_distance(), u64::max() - 1);
}

#[test]
fn test_multiple_points_different_distances() {
    let points = [
        Point::new(1, 2),  // distance: 3
        Point::new(2, 3),  // distance: 5  
        Point::new(4, 1),  // distance: 5
        Point::new(0, 8),  // distance: 8
    ];

    assert_eq(points[0].manhattan_distance(), 3);
    assert_eq(points[1].manhattan_distance(), 5);
    assert_eq(points[2].manhattan_distance(), 5);
    assert_eq(points[3].manhattan_distance(), 8);
}