// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:algorithmic/src/utils/comparators.dart';

/// Returns the first index of the [value] in the [list], otherwise -1.
///
/// You can control the range to search using the [start] and [count] parameters.
/// * If [start] is given, search start there and go towards the end of the [list].
/// * If [start] is not below the length of the [list], -1 will be returned.
/// * If [start] is negative, search starts at [start] + [count] or 0, whichever is greater.
/// * If the [count] parameter is given, it will check up to [count] numbers of items.
/// * If [count] is negative, -1 will be returned.
///
/// -------------------------------------------------------------------------
/// Complexity: Time `O(n)` | Space `O(1)`
int linearSearch<E>(
  final List<E> list,
  final E value, {
  final int? start,
  final int? count,
}) {
  int i, j;
  final int n = list.length;

  // determine range [i, j)
  i = start ?? 0;
  j = n;
  if (count != null) {
    if (count < 0) return -1;
    j = i + count;
    if (j > n) j = n;
  }
  if (i < 0) i = 0;

  // forward loop in range [i, j)
  for (; i < j; ++i) {
    if (list[i] == value) {
      return i;
    }
  }

  return -1;
}

/// Returns the first index where the [test] is true in the [list], otherwise -1.
///
/// You can control the range to search using the [start] and [count] parameters.
/// * If [start] is given, search start there and go towards the end of the [list].
/// * If [start] is not below the length of the [list], -1 will be returned.
/// * If [start] is negative, search starts at [start] + [count] or 0, whichever is greater.
/// * If the [count] parameter is given, it will check up to [count] numbers of items.
/// * If [count] is negative, -1 will be returned.
///
/// -------------------------------------------------------------------------
/// Complexity: Time `O(n)` | Space `O(1)`
int linearSearchBy<E>(
  final List<E> list,
  final EqualityTest<E> test, {
  final int? start,
  final int? count,
}) {
  int i, j;
  final int n = list.length;

  // determine range [i, j)
  i = start ?? 0;
  j = n;
  if (count != null) {
    if (count < 0) return -1;
    j = i + count;
    if (j > n) j = n;
  }
  if (i < 0) i = 0;

  // forward loop in range [i, j)
  for (; i < j; ++i) {
    if (test(list[i])) {
      return i;
    }
  }

  return -1;
}
