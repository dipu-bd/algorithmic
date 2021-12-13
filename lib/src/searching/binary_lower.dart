// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:algorithmic/src/utils/comparators.dart';

/// Returns the index of the _first_ item from a sorted [list] that is either
/// equal to or greater than the the [value], otherwise if all items are lesser
/// than the [value], the length of the [list] is returned.
///
/// ## Parameters
///
/// * The [list] must be a sorted list of items, otherwise the behavior
/// of this method is not defined.
/// * The [value] must be comparable with the items on the list. Otherwise, [TypeError] is thrown.
/// * If [start] is given, search start there and go towards the end of the [list].
/// * If [start] is negative, search starts at [start] + [count] or 0, whichever is greater.
/// * If [start] is not below the length of the [list], the length is returned.
/// * If the [count] parameter is given, it will check up to [count] numbers of items.
/// * The [count] must not be negative. Otherwise, [RangeError] is thrown.
/// * [compare] is a custom comparator function between a list element and the value.
///   If it is null, `compareTo` method of [list] item is used.
///
/// ## Details
///
/// The search will begin with a range from [start] and consider at most [count]
/// number of items. In each iteration, the range will be narrowed down by half.
/// If the middle item of the range is less than the [value], the right half of
/// the range will be selected, otherwise the left half. After this process is
/// done, we are left with a singular range containing only one item.
///
/// -------------------------------------------------------------------------
/// Complexity: Time `O(log n)` | Space `O(1)`
int lowerBound<E, V>(
  List<E> list,
  V value, {
  int? start,
  int? count,
  EntryComparator<E, V>? compare,
}) {
  return _lowerBound<E, V>(
    list,
    value,
    start,
    count,
    compare,
  );
}

/// Returns the index of the _first_ occurance of the [value] in a sorted [list],
/// otherwise -1 if not found. It is ensured that the index is as lowest as possible.
///
/// ## Parameters
///
/// * The [list] must be a sorted list of items, otherwise the behavior of this
///   method is not defined.
/// * The [value] must be comparable with the list items. Otherwise, [TypeError] is thrown.
/// * If [start] is given, search start there and go towards the end of the [list].
/// * If [start] is not below the length of the [list], -1 is returned.
/// * If [start] is negative, search starts at [start] + [count] or 0, whichever is greater.
/// * If the [count] parameter is given, it will check up to [count] numbers of items.
/// * If [count] is negative, -1 is returned.
/// * [compare] is a custom comparator function between a list element and the value.
///   If it is null, `compareTo` method of [list] item is used.
///
/// ## Details
///
/// The search will begin with a range from [start] and consider at most [count]
/// number of items. In each iteration, the range will be narrowed down by half.
/// If the middle item of the range is less than the [value], the right half of
/// the range will be selected, otherwise the left half. After this process is
/// done, we are left with a singular range containing only one item.
///
/// If this item is equal to the [value], the index is returneds, otherwise -1.
///
/// -------------------------------------------------------------------------
/// Complexity: Time `O(log n)` | Space `O(1)`
int binarySearch<E, V>(
  List<E> list,
  V value, {
  int? start,
  int? count,
  EntryComparator<E, V>? compare,
}) {
  return _lowerBound<E, V>(
    list,
    value,
    start,
    count,
    compare,
    exactMatch: true,
  );
}

/// Internal function to calculate lower bound and binary search.
/// Pass [exactMatch] to true if you want to perform a binary search.
int _lowerBound<E, V>(
  List<E> list,
  V value,
  int? start,
  int? count,
  EntryComparator<E, V>? compare, {
  bool exactMatch = false,
}) {
  int b, e, l, h, m;
  int n = list.length;

  // determine range [i, j)
  b = start ?? 0;
  e = n;
  if (count != null) {
    if (count < 0) {
      if (exactMatch) return -1;
      throw RangeError("count can not be negative");
    }
    e = b + count;
    if (e > n) e = n;
  }
  if (b < 0) b = 0;

  l = b;
  h = e;
  if (compare == null) {
    // with default comparator
    while (l < h) {
      // the middle of the range
      m = l + ((h - l) >> 1);
      // compare middle item with value
      if ((list[m] as Comparable).compareTo(value) < 0) {
        // middle item is lesser, select right range
        l = m + 1;
      } else {
        // middle item is either equal or greater, select left range
        h = m;
      }
    }
  } else {
    // with custom comparator (slower)
    while (l < h) {
      // the middle of the range
      m = l + ((h - l) >> 1);
      // compare middle item with value
      if (compare(list[m], value) < 0) {
        // middle item is lesser, select right range
        l = m + 1;
      } else {
        // middle item is either equal or greater, select left range
        h = m;
      }
    }
  }
  if (l > e) l = e;

  if (!exactMatch) {
    // lower bound index
    return l;
  }

  // binary search result
  if (b <= l && l < e) {
    if (compare == null) {
      if (list[l] == value) return l;
    } else {
      if (compare(list[l], value) == 0) return l;
    }
  }
  return -1;
}
