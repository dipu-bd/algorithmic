// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:algorithmic/src/utils/comparators.dart';

/// Returns the first occurrence of the [value] in the [list].
///
/// It starts from the first item of the [list] and compares the [value] with
/// each items one by one. If the [value] matches with an item, the index is
/// returned. If [value] does not match with any items, -1 is returned.
///
/// -------------------------------------------------------------------------
/// The other optional arguments are listed below:
/// * [offset] is the index where the search starts.
///   - If [offset] is null or negative, search starts at 0.
///   - if [offset] exceeds the length of the [list], -1 is returned.
/// * [count] is the number if items to search for.
///   - If [count] is null, it will search of all available items.
///   - If [count] is negative, -1 is returned.
///   - If [count] + [offset] is negative, -1 is returned.
///   - If [count] + [offset] is greather than or equal to the length of the list,
///     it will search all available items.
/// * [compare] is a custom comparator function between a list element and the value.
///   If it is null, the default == operator will be used to measure equality.
///
/// -------------------------------------------------------------------------
/// Complexity: Time `O(n)` | Space `O(1)`
int linearSearch<E, V>(
  final List<E> list,
  final V value, {
  final int? offset,
  final int? count,
  final EntryComparator<E, V>? compare,
}) {
  int i, j, m;
  final int n = list.length;

  // Determine the lookup range [i, j)
  i = offset ?? 0;
  if (i >= n) return -1;
  m = count ?? ((i < 0 ? -i : 0) + n);
  if (m <= 0) return -1;
  j = i + m;
  if (i < 0) i = 0;
  if (i >= j) return -1;
  if (j > n) j = n;

  // Search forwards
  if (compare != null) {
    for (; i < j; i++) {
      if (compare(list[i], value) == 0) {
        return i;
      }
    }
  } else {
    for (; i < j; i++) {
      if (list[i] == value) {
        return i;
      }
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
/// * [offset] is the index where the search starts.
///   - If [offset] is null or negative, search starts at 0.
///   - if [offset] exceeds the length of the [list], -1 is returned.
/// * [count] is the number if items to search for.
///   - If [count] is null, it will search of all available items.
///   - If [count] is negative, -1 is returned.
///   - If [count] + [offset] is negative, -1 is returned.
///   - If [count] + [offset] is greather than or equal to the length of the list,
///     it will search all available items.
/// * [compare] is a custom comparator function between a list element and the value.
///   If it is null, the default == operator will be used to measure equality.
///
/// -------------------------------------------------------------------------
/// Complexity: Time `O(n)` | Space `O(1)`
int linearSearchReversed<E, V>(
  final List<E> list,
  final V value, {
  final int? offset,
  final int? count,
  final EntryComparator<E, V>? compare,
}) {
  int i, j, m;
  final int n = list.length;

  // Determine the lookup range [i, j)
  i = offset ?? (n - 1);
  if (i <= 0) return -1;
  m = count ?? (i > n ? i : n);
  if (m <= 0) return -1;
  j = i - m;
  if (j < 0) j = -1;
  if (i <= j) return -1;
  if (i >= n) i = n - 1;

  // Search backwards
  if (compare != null) {
    for (; i > j; i--) {
      if (compare(list[i], value) == 0) {
        return i;
      }
    }
  } else {
    for (; i > j; i--) {
      if (list[i] == value) {
        return i;
      }
    }
  }

  return -1;
}
