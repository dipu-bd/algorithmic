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
/// * To perform a binary search using this method, pass [exactMatch] to true.
///
/// ## Details
///
/// The search will begin with a range from [start] and consider at most [count]
/// number of items. In each iteration, the range will be narrowed down by half.
/// If the middle item of the range is less than the [value], the right half of
/// the range will be selected, otherwise the right half. After this process is
/// done, we are left with a singular range containing only one item.
/// The index of this item will be returned at the end.
///
/// -------------------------------------------------------------------------
/// Complexity: Time `O(log n)` | Space `O(1)`
int lowerBound<E, V>(
  final List<E> list,
  final V value, {
  final int? start,
  final int? count,
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

  if (l > j) l = j;

  if (!exactMatch) {
    // lower bound index
    return l;
  }

  // prepare binary search result
  if (i <= l && l < j && list[l] == value) {
    return l;
  }
  return -1;
}

/// Returns the index of the _first_ item from a sorted [list], for which the
/// [test] method return `false`, otherwise if it returns `true` for all items,
/// the length of the [list] is returned.
///
/// ## Parameters
///
/// * The [list] must be a sorted list of items, otherwise the behavior of this
///   method is not defined.
/// * If [test] method should be consitent for every items on the list. For exmaple,
///   if `list[i] == list[j]` is true, then `test(list[i]) == test(list[j])` must
///   also be true.
/// * If [start] is given, search start there and go towards the end of the [list].
/// * If [start] is not below the length of the [list], the length is returned.
/// * If [start] is negative, search starts at [start] + [count] or 0, whichever is greater.
/// * If the [count] parameter is given, it will check up to [count] numbers of items.
/// * The [count] must not be negative, otherwise [RangeError] is thrown.
/// * To perform a binary search using this method, pass the [testEqual] function.
///
/// ## Details
///
/// The search will begin with a range from [start] and consider at most [count]
/// number of items. In each iteration, the range will be narrowed down by half.
/// If [test] returns `true` for the item at the middle of the range, right half
/// of the range will be selected, otherwise the left half. After this process is
/// done, we are left with a singular range containing only one item.
/// The index of this item will be returned at the end.
///
/// -------------------------------------------------------------------------
/// Complexity: Time `O(log n)` | Space `O(1)`
int lowerBoundBy<E>(
  final List<E> list,
  final LessThanTest<E> test, {
  final int? start,
  final int? count,
  final EqualityTest<E>? testEqual,
}) {
  int i, j, l, r, m;
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
  while (l < r) {
    // the middle of the range
    m = l + ((r - l) >> 1);

    if (test(list[m])) {
      // middle item is lesser, select right range
      l = m + 1;
    } else {
      // middle item is either equal or greater, select left range
      r = m;
    }
  }

  if (l > j) l = j;

  if (testEqual == null) {
    // lower bound index
    return l;
  }

  // prepare binary search result
  if (i <= l && l < j && testEqual(list[l])) {
    return l;
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
/// If [compare] is null, the [lowerBound] is called with `exactMatch` as true, otherwise the
/// [lowerBoundBy] is called with a `testEqual` function to perform binary search.
/// On [TypeError] or [RangeError], -1 is returned.
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
  try {
    if (compare == null) {
      return lowerBound<E, V>(
        list,
        value,
        start: start,
        count: count,
        exactMatch: true,
      );
    } else {
      return lowerBoundBy<E>(
        list,
        (e) => compare(e, value) < 0,
        start: start,
        count: count,
        testEqual: (e) => compare(e, value) == 0,
      );
    }
  } on RangeError {
    // ignore: empty_catches
  } on TypeError {
    // ignore: empty_catches
  }
  return -1;
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
/// Internally the [lowerBoundBy] is called comparing whether the list item is less
/// than or equal to the value as [test] function.
///
/// -------------------------------------------------------------------------
/// Complexity: Time `O(log n)` | Space `O(1)`
int upperBound<E, V>(
  final List<E> list,
  final V value, {
  final int? start,
  final int? count,
  final EntryComparator<E, V>? compare,
}) {
  if (compare == null) {
    return lowerBoundBy<E>(
      list,
      (e) => (e as Comparable).compareTo(value) <= 0,
      start: start,
      count: count,
    );
  } else {
    return lowerBoundBy<E>(
      list,
      (e) => compare(e, value) <= 0,
      start: start,
      count: count,
    );
  }
}

/// Returns the index of the _last_ occurance of the [value] in a sorted [list],
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
///   If it is null, `compareTo` method of [list] item is used.
///
/// ## Details
///
/// Internally the [lowerBoundBy] is called comparing whether the list item is less
/// than or equal to the value as the `test` function, and with a `testEqual` function
/// to perform binrary search directly.
/// On [TypeError] or [RangeError], -1 is returned.
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
  try {
    int x;
    if (compare == null) {
      x = lowerBoundBy<E>(
        list,
        (e) => (e as Comparable).compareTo(value) <= 0,
        start: start,
        count: count,
      );
    } else {
      x = lowerBoundBy<E>(
        list,
        (e) => compare(e, value) <= 0,
        start: start,
        count: count,
      );
    }
    if (x > 0 && x > (start ?? 0)) {
      x--;
      if (compare == null) {
        if (list[x] == value) return x;
      } else {
        if (compare(list[x], value) == 0) return x;
      }
    }
  } on RangeError {
    // ignore: empty_catches
  } on TypeError {
    // ignore: empty_catches
  }
  return -1;
}