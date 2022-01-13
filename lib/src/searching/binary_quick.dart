// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:algorithmic/src/utils/templates.dart';

/// This function returns the index of the first occurence of a [value] in a
/// sorted [list]. Unlike [binarySearch], this does not ensure that the index of
/// the [value] is as minimum as possible.
///
/// ## Parameters
///
/// * The [list] must be a sorted list of items, otherwise the behavior of this
///   method is not defined.
/// * The [value] must be comparable with the list items. Otherwise, [TypeError] is returned.
/// * If [start] is given, search start there and go towards the end of the [list].
/// * If [start] is not below the length of the [list], -1 is returned.
/// * If [start] is negative, search starts at [start] + [count] or 0, whichever is greater.
/// * If the [count] parameter is given, it will check up to [count] numbers of items.
/// * If [count] is negative, -1 is returned.
/// * [compare] is a custom compare function between a list element and the value.
///   If it is null, `compareTo` method of [list] item is used.
///
/// ## Details
///
/// The search will begin with a range from [start] and consider at most [count]
/// number of items. In each iteration, the range will be narrowed down by half.
/// If the middle item of the range is equal to the [value], the index is returned
/// immediately. If middle item is less than the [value], right half of range will
/// be selected. Otherwise, the left half. After this process is complete, since
/// we did not find our [value], -1 is returned.
///
/// -------------------------------------------------------------------------
/// Complexity: Time `O(log n)` | Space `O(1)`
int binarySearchQuick<E, V>(
  List<E> list,
  V value, {
  int? start,
  int? count,
  EntryComparator<E, V>? compare,
}) {
  int i, j;
  int n = list.length;

  // determine range [i, j)
  i = start ?? 0;
  j = n;
  if (count != null) {
    if (count <= 0) return -1;
    j = i + count;
    if (j > n) j = n;
  }
  if (i < 0) i = 0;

  if (compare == null) {
    return binarySearchDefault(list, value, i, j);
  } else {
    return binarySearchCustom(list, value, i, j, compare);
  }
}

/// from range `[l, h)`
int binarySearchDefault<E, V>(List<E> list, V value, int l, int h) {
  int m;

  while (l < h) {
    // the middle of the range
    m = l + ((h - l) >> 1);

    // if item at the middle is equal return immediately
    if (list[m] == value) return m;

    // compare middle item with value
    if ((list[m] as Comparable).compareTo(value) < 0) {
      // middle item is lesser, select right range
      l = m + 1;
    } else {
      // middle item is greater, select left range
      h = m;
    }
  }

  return -1;
}

/// from range `[l, h)`
int binarySearchCustom<E, V>(
    List<E> list, V value, int l, int h, EntryComparator<E, V> compare) {
  int m, c;

  while (l < h) {
    // the middle of the range
    m = l + ((h - l) >> 1);

    // compare middle item with value
    c = compare(list[m], value);
    if (c == 0) {
      // if item at the middle is equal return immediately
      return m;
    } else if (c < 0) {
      // middle item is lesser, select right range
      l = m + 1;
    } else {
      // middle item is greater, select left range
      h = m;
    }
  }

  return -1;
}
