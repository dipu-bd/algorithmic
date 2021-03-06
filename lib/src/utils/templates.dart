// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

/// A template for comparsion function between two objects.
///
/// The return value of this function should be:
/// * zero if [left] is equal to [right]
/// * negative integer if [left] is less than [right]
/// * positive integer if [left] is greater than [right]
typedef EntryComparator<E, V> = int Function(E left, V right);

/// A template for equality test function for two objects.
///
/// The return value of this function should be:
/// * `true` if [left] is equal to [right],
/// * `false` otherwise.
typedef DualEqualityTest<E, V> = bool Function(E left, V right);

/// A template for test function for an element.
///
/// The return value of this function should be:
/// * `true` if the [element] is equal,
/// * `false` otherwise.
typedef EqualityTest<E> = bool Function(E element);

/// A template for test function for an element.
///
/// The return value of this function should be:
/// * `true` if the [element] is strictly lesser,
/// * otherwise, `false` if equal or greater.
typedef LessThanTest<E> = bool Function(E element);

/// A template to extract key of an element.
///
/// This function should be one to one.
/// One element should map to one and only one key.
typedef KeyOf<E, V> = V Function(E element);
