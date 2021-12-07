// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:algorithmic/src/utils/extractors.dart';
import 'package:algorithmic/src/utils/comparators.dart';

/// Returns the first occurrence of the [value] in the [list].
///
/// It starts from the first item of the [list] and compares the [value] with
/// each items one by one. If the [value] matches with an item, the index is
/// returned. If [value] does not match with any items, -1 is returned.
///
/// -------------------------------------------------------------------------
/// The other optional arguments are listed below:
/// * [offset] index in the list is the first index where the search should begin. Default is 0.
///   - If [offset] is negative, search starts from 0.
///   - if [offset] is greater than number of items in the [list], -1 is returned.
/// * [count] represents the number of items to search starting from the [offset].
///   - If [count] is negative, it will search 0 items.
///   - if [count]+[offset] may exceed the number of items in the [list].
/// * [valueOf] function transforms the [value] and [list] items before matching. Default is [identity].
/// * [isEqual] is a custom comparator function to check if two values are equal. Default is [identical].
///
/// -------------------------------------------------------------------------
/// Complexity: Time `O(n)` | Space `O(1)`
int linearSearch<E, V>(
  List<E> list,
  E value, {
  int? offset,
  int? count,
  ValueExtractor<E, V>? valueOf,
  IdentityComparator<V, V>? isEqual,
}) {
  valueOf ??= identity;
  isEqual ??= identical;

  final int n = list.length;
  final V e = valueOf(value);
  if (!isEqual(e, e)) {
    // isEqual function is not valid
    return -1;
  }

  // start index
  int i = offset ?? 0;
  if (i >= n) {
    return -1;
  }

  // final index
  int j = count == null ? n : i + count;
  if (j <= i) {
    return -1;
  }

  // adjust i and j
  if (i < 0) {
    i = 0;
  }
  if (j > n) {
    j = n;
  }

  // Search forwards
  for (; i < j; i++) {
    if (isEqual(valueOf(list[i]), e)) {
      return i;
    }
  }

  return -1;
}

/// Returns the last occurrence of the [value] in the [list].
///
/// It starts from the last item of the [list] and compares the [value] with
/// each items one by one. If the [value] matches with an item, the index is
/// returned. If [value] does not match with any items, -1 is returned.
///
/// -------------------------------------------------------------------------
/// The other optional arguments are listed below:
/// * [offset] index in the list is the first index where the search should begin. Default is 0.
///   - if [offset] is greater than number of items in the [list], search starts from end of the [list].
///   - If [offset] is negative, -1 is returned.
/// * [count] represents the number of items to search starting from the [offset].
///   - If [count] is negative, it will search 0 items.
///   - if [offset] - [count] may produce a negative value.
/// * [valueOf] function transforms the [value] and [list] items before matching. Default is [identity].
/// * [isEqual] is a custom comparator function to check if two values are equal. Default is [identical].
///
/// -------------------------------------------------------------------------
/// Complexity: Time `O(n)` | Space `O(1)`
int linearSearchReversed<E, V>(
  List<E> list,
  E value, {
  int? offset,
  int? count,
  ValueExtractor<E, V>? valueOf,
  IdentityComparator<V, V>? isEqual,
}) {
  valueOf ??= identity;
  isEqual ??= identical;

  final int n = list.length;
  final V e = valueOf(value);
  if (!isEqual(e, e)) {
    // isEqual function is not valid
    return -1;
  }

  // start index
  int i = offset ?? (n - 1);
  if (i < 0) {
    return -1;
  }

  // final index
  int j = count == null ? -1 : i - count;
  if (i <= j) {
    return -1;
  }

  // i and j index
  if (i >= n) {
    i = n - 1;
  }
  if (j < -1) {
    j = -1;
  }

  // Search backwards
  for (; i > j; i--) {
    if (isEqual(e, valueOf(list[i]))) {
      return i;
    }
  }

  return -1;
}
