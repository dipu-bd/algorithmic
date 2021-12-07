// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

/// A template for comparsion function between two objects.
///
/// The return value of this function should be:
/// * zero if [left] is equal to [right]
/// * negative integer if [left] is less than [right]
/// * positive integer if [left] is greater than [right]
typedef Comparator<E, V> = int Function(E left, V right);
