// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:algorithmic/src/utils/comparators.dart';

/// Returns the last index of the [value] in a [list] in reverse order, otherwise -1.
///
/// You can control the range to search using the [start] and [count] parameters.
/// * If [start] parameter is not null, search start there and go backwards down to 0.
/// * If [start] is not less than the length of the [list], it will start at the end.
/// * If the [count] parameter is given, it will check up to [count] numbers of items.
/// * If either [start] or [count] is negative, -1 will be returned.
///
/// -------------------------------------------------------------------------
/// Complexity: Time `O(n)` | Space `O(1)`
int linearSearchReversed<E>(
  final List<E> list,
  final E value, {
  final int? start,
  final int? count,
}) {
  int i, j;
  final int n = list.length;

  // determine range [i, j)
  i = start ?? n - 1;
  j = -1;
  if (count != null) {
    if (count < 0) return -1;
    j = i - count;
    if (j < -1) j = -1;
  }
  if (i >= n) i = n - 1;

  // reverse loop in range (j, i]
  for (; i > j; --i) {
    if (list[i] == value) {
      return i;
    }
  }

  return -1;
}

/// Returns the last index where the [test] is true in the [list], otherwise -1.
///
/// You can control the range to search using the [start] and [count] parameters.
/// * If [start] parameter is not null, search start there and go backwards down to 0.
/// * If [start] is not less than the length of the [list], it will start at the end.
/// * If the [count] parameter is given, it will check up to [count] numbers of items.
/// * If either [start] or [count] is negative, -1 will be returned.
///
/// -------------------------------------------------------------------------
/// Complexity: Time `O(n)` | Space `O(1)`
int linearSearchReversedBy<E>(
  final List<E> list,
  final EqualityTest<E> test, {
  final int? start,
  final int? count,
}) {
  int i, j;
  final int n = list.length;

  // determine range [i, j)
  i = start ?? n - 1;
  j = -1;
  if (count != null) {
    if (count < 0) return -1;
    j = i - count;
    if (j < -1) j = -1;
  }
  if (i >= n) i = n - 1;

  // reverse loop in range (j, i]
  for (; i > j; --i) {
    if (test(list[i])) {
      return i;
    }
  }

  return -1;
}
