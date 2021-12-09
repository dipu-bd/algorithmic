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
/// * The [value] must be comparable with the items on the list. Otherwise,
///  [TypeError] may be thrown.
/// * If [start] is given, search start there and go towards the end of the [list].
/// * If [start] is negative, search starts at [start] + [count] or 0, whichever is greater.
/// * If [start] is not below the length of the [list], the length is returned.
/// * If the [count] parameter is given, it will check up to [count] numbers of items.
/// * The [count] must not be negative. Otherwise, [RangeError] is thrown.
/// * [compare] is a custom comparator function between a list element and the value.
///   If it is null, `compareTo` method of [list] item is used. On [TypeError], -1 is returned.
/// * You can [exactMatch] to true if you want to perform a binary search.
///
/// ## Details
///
/// The search will begin with a range from [start] and consider at most [count]
/// number of items. In each iteration, the range will be narrowed down by half.
/// If the middle item of the range is less than the [value], the right half of
/// the range will be selected, otherwise the right half. After this process is
/// done, we are left with a singular range containing only one item.
///
/// if [exactMatch] is false, the index of this item will be returned at the end.
/// Otherwise, the if the item is equal to [value], the index will be returned or -1.
///
/// -------------------------------------------------------------------------
/// Complexity: Time `O(log n)` | Space `O(1)`
int lowerBound<E, V>(
  final List<E> list,
  final V value, {
  final int? start,
  final int? count,
  final EntryComparator<E, V>? compare,
  final bool exactMatch = false,
}) {
  int i, j, l, r, m, c;
  final int n = list.length;

  // determine range [i, j)
  i = start ?? 0;
  j = n;
  if (count != null) {
    if (count < 0) {
      throw RangeError("count can not be negative");
    }
    j = i + count;
    if (j > n) j = n;
  }
  if (i < 0) i = 0;

  l = i;
  r = j;
  if (compare == null) {
    while (l < r) {
      // the middle of the range
      m = l + ((r - l) >> 1);

      // compare middle item with value
      c = (list[m] as Comparable).compareTo(value);

      if (c < 0) {
        // middle item is lesser, select right range
        l = m + 1;
      } else {
        // middle item is either equal or greater, select left range
        r = m;
      }
    }
  } else {
    while (l < r) {
      // the middle of the range
      m = l + ((r - l) >> 1);

      // compare middle item with value
      c = compare(list[m], value);

      if (c < 0) {
        // middle item is lesser, select right range
        l = m + 1;
      } else {
        // middle item is either equal or greater, select left range
        r = m;
      }
    }
  }

  if (l > j) l = j;

  if (!exactMatch) {
    // lower bound index
    return l;
  }

  // prepare binary search result
  if (i <= l && l < j) {
    if (compare == null) {
      if (list[l] == value) return l;
    } else {
      if (compare(list[l], value) == 0) return l;
    }
  }
  return -1;
}

/// Returns the index of the _first_ occurance of the [value] in a sorted [list],
/// otherwise -1 if not found.
///
/// ## Parameters
///
/// * The [list] must be a sorted list of items, otherwise the behavior of this
///   method is not defined.
/// * The [value] must be comparable with the list items. Otherwise,  -1 is returned.
/// * If [start] is given, search start there and go towards the end of the [list].
/// * If [start] is not below the length of the [list], -1 is returned.
/// * If [start] is negative, search starts at [start] + [count] or 0, whichever is greater.
/// * If the [count] parameter is given, it will check up to [count] numbers of items.
/// * If [count] is negative, -1 is returned.
/// * [compare] is a custom comparator function between a list element and the value.
///   If it is null, `compareTo` method of [list] item is used. On [TypeError], -1 is returned.
///
/// ## Details
///
/// Internally it calls the [lowerBound] method, passing true to the `exactMatch` parameter.
///
/// -------------------------------------------------------------------------
/// Complexity: Time `O(log n)` | Space `O(1)`
int binarySearch<E, V>(
  final List<E> list,
  final V value, {
  final int? start,
  final int? count,
  final EntryComparator<E, V>? compare,
}) {
  return lowerBound<E, V>(
    list,
    value,
    start: start,
    count: count,
    compare: compare,
    exactMatch: true,
  );
}

/// Returns the index of the _first_ item from a sorted [list] that is strictly
/// greater than the [value], otherwise if all items are less than or equal to
/// the [value] the length of the [list] is returned.
///
/// ## Parameters
///
/// * The [list] must be a sorted list of items, otherwise the behavior of this
///   method is not defined.
/// * The [value] must be comparable with the items on the list. Otherwise,
///   [TypeError] may be thrown.
/// * If [start] is given, search start there and go towards the end of the [list].
/// * If [start] is not below the length of the [list], the length is returned.
/// * If [start] is negative, search starts at [start] + [count] or 0, whichever is greater.
/// * If the [count] parameter is given, it will check up to [count] numbers of items.
/// * The [count] must not be negative. Otherwise, [RangeError] is thrown.
/// * To use custom comparison between the [list] items and the [value], pass the
///   [compare] function.
/// * To perform a binary search using this method, pass [exactMatch] to true.
///
/// ## Details
///
/// The search will begin with a range from [start] and consider at most [count]
/// number of items. In each iteration, the range will be narrowed down by half.
/// If the middle item of the range is less or equal to the [value], right half
/// of the range will be selected, otherwise the right half. After this process
/// is done, we are left with a singular range containing only one item.
///
/// if [exactMatch] is false, the index of this item will be returned at the end.
/// Otherwise, the if the item is equal to [value], the index will be returned or -1.
///
/// -------------------------------------------------------------------------
/// Complexity: Time `O(log n)` | Space `O(1)`
int upperBound<E, V>(
  final List<E> list,
  final V value, {
  final int? start,
  final int? count,
  final EntryComparator<E, V>? compare,
  final bool exactMatch = false,
}) {
  int i, j, l, r, m, c;
  final int n = list.length;

  // determine range [i, j)
  i = start ?? 0;
  j = n;
  if (count != null) {
    if (count < 0) {
      throw RangeError("count can not be negative");
    }
    j = i + count;
    if (j > n) j = n;
  }
  if (i < 0) i = 0;

  l = i;
  r = j;
  if (compare == null) {
    while (l < r) {
      // the middle of the range
      m = l + ((r - l) >> 1);

      // compare middle item with value
      c = (list[m] as Comparable).compareTo(value);

      if (c <= 0) {
        // middle item is lesser, select right range
        l = m + 1;
      } else {
        // middle item is either equal or greater, select left range
        r = m;
      }
    }
  } else {
    while (l < r) {
      // the middle of the range
      m = l + ((r - l) >> 1);

      // compare middle item with value
      c = compare(list[m], value);

      if (c <= 0) {
        // middle item is lesser, select right range
        l = m + 1;
      } else {
        // middle item is either equal or greater, select left range
        r = m;
      }
    }
  }

  if (l > j) l = j;

  if (!exactMatch) {
    // lower bound index
    return l;
  }

  // prepare binary search result
  l--;
  if (i <= l) {
    if (compare == null) {
      if (list[l] == value) return l;
    } else {
      if (compare(list[l], value) == 0) return l;
    }
  }
  return -1;
}

/// Returns the index of the _last_ occurance of the [value] in a sorted [list],
/// otherwise -1 if not found.
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
/// * If [count] is negative, [RangeError] is thrown.
/// * [compare] is a custom comparator function between a list element and the value.
///   If it is null, `compareTo` method of [list] item is used.
///
/// ## Details
///
/// Internally it calls the [upperBound] method, passing true to the `exactMatch` parameter.
///
/// -------------------------------------------------------------------------
/// Complexity: Time `O(log n)` | Space `O(1)`
int binarySearchMax<E, V>(
  final List<E> list,
  final V value, {
  final int? start,
  final int? count,
  final EntryComparator<E, V>? compare,
}) {
  return upperBound<E, V>(
    list,
    value,
    start: start,
    count: count,
    compare: compare,
    exactMatch: true,
  );
}
