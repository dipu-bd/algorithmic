// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

/// A template for comparsion function between two objects.
///
/// The return value of this function should be:
/// * zero if [left] is equal to [right]
/// * negative integer if [left] is less than [right]
/// * positive integer if [left] is greater than [right]
typedef EntryComparator<E, V> = int Function(E left, V right);

/// A template for testing an item for equality.
///
/// The return value of this function should be:
/// * `true` if the [element] is equal,
/// * `false` otherwise.
typedef EqualityTest<E> = bool Function(E element);

/// A template for testing if an item is lesser.
///
/// The return value of this function should be:
/// * `true` if the [element] is strictly lesser,
/// * otherwise, `false` if equal or greater.
typedef LessThanTest<E> = bool Function(E element);

/// A template for testing if an item is greater.
///
/// The return value of this function should be:
/// * `true` if the [element] is strictly greater,
/// * otherwise, `false` if equal or greater.
typedef GreaterThanTest<E> = bool Function(E element);
