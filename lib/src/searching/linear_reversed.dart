// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import '../utils/templates.dart';

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
  List<E> list,
  E value, {
  int? start,
  int? count,
}) {
  int l, h;
  int n = list.length;

  // determine range [l, h]
  l = 0;
  h = start ?? n - 1;
  if (count != null) {
    if (count < 0) return -1;
    l = h - count + 1;
    if (l < 0) l = 0;
  }
  if (h >= n) h = n - 1;

  // reverse loop in range [l, h]
  for (; h >= l; h--) {
    if (list[h] == value) {
      return h;
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
  List<E> list,
  EqualityTest<E> test, {
  int? start,
  int? count,
}) {
  int l, h;
  int n = list.length;

  // determine range [l, h)
  l = 0;
  h = start ?? n - 1;
  if (count != null) {
    if (count < 0) return -1;
    l = h - count + 1;
    if (l < 0) l = 0;
  }
  if (h >= n) h = n - 1;

  // reverse loop in range [l, h)
  for (; h >= l; h--) {
    if (test(list[h])) {
      return h;
    }
  }

  return -1;
}
