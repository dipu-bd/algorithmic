// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:algorithmic/src/utils/templates.dart';

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
  List<E> list,
  E value, {
  int? start,
  int? count,
}) {
  int l, h;
  int n = list.length;

  // determine range [l, h)
  l = start ?? 0;
  h = n;
  if (count != null) {
    if (count < 0) return -1;
    h = l + count;
    if (h > n) h = n;
  }
  if (l < 0) l = 0;

  // forward loop in range [l, h)
  for (; l < h; ++l) {
    if (list[l] == value) {
      return l;
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
  List<E> list,
  EqualityTest<E> test, {
  int? start,
  int? count,
}) {
  int l, h;
  int n = list.length;

  // determine range [l, h)
  l = start ?? 0;
  h = n;
  if (count != null) {
    if (count < 0) return -1;
    h = l + count;
    if (h > n) h = n;
  }
  if (l < 0) l = 0;

  // forward loop in range [l, h)
  for (; l < h; ++l) {
    if (test(list[l])) {
      return l;
    }
  }

  return -1;
}
