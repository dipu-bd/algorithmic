// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:algorithmic/src/utils/comparators.dart';

/// Returns the first occurrence of the [value] in the sorted [list], otherwise
/// if no item is found, -1 is returned.
///
/// Internally, it calls the [lowerBound] method. You can check it for more
/// details.
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
///   - If it is null, `compareTo` method of [list] item is used. If the list item is
///     not a subtype of Comparable, -1 is returned.
///
/// -------------------------------------------------------------------------
/// Complexity: Time `O(log n)` | Space `O(1)`
int binarySearch<E, V>(
  final List<E> list,
  final V value, {
  final int? offset,
  final int? count,
  final EntryComparator<E, V>? compare,
}) {
  int i, j, m, c, x;
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

  x = lowerBound(
    list,
    value,
    start: i,
    end: j,
    compare: compare,
  );

  if (i <= x && x < j) {
    try {
      if (compare == null) {
        c = (list[x] as Comparable).compareTo(value);
      } else {
        c = compare(list[x], value);
      }
      if (c == 0) {
        return x;
      }
    } on TypeError {
      // ignore: empty_catches
    }
  }

  return -1;
}

/// Returns the last occurrence of the [value] in the sorted [list], otherwise
/// if no item is found, -1 is returned.
///
/// Internally, it calls the [upperBound] method. You can check it for more
/// details.
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
///   - If it is null, `compareTo` method of [list] item is used. If the list item is
///     not a subtype of Comparable, -1 is returned.
///
/// -------------------------------------------------------------------------
/// Complexity: Time `O(log n)` | Space `O(1)`
int binarySearchReversed<E, V>(
  final List<E> list,
  final V value, {
  final int? offset,
  final int? count,
  final EntryComparator<E, V>? compare,
}) {
  int i, j, m, c, x;
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

  x = upperBound(
    list,
    value,
    start: j + 1,
    end: i + 1,
    compare: compare,
  );

  x--;
  if (j < x && x <= i) {
    try {
      if (compare == null) {
        c = (list[x] as Comparable).compareTo(value);
      } else {
        c = compare(list[x], value);
      }
      if (c == 0) {
        return x;
      }
    } on TypeError {
      // ignore: empty_catches
    }
  }

  return -1;
}

/// Returns the index of the first item in a sorted [list] that is either equal
/// to or greater than the the [value].
///
/// -------------------------------------------------------------------------
///
/// * [list] represents a sorted of items.
/// * [value] is the item to search for.
/// * [start] is the start index where the search should begin.
/// * [end] is the final index where the search should stop.
/// * [compare] is a custom comparator function between a list element and the value.
///   If it is null, `compareTo` method of [list] item is used. If the list item is
///   not a subtype of Comparable, -1 is returned.
///
/// -------------------------------------------------------------------------
///
/// If [value] is less than all items on the list, -1 is returned.
/// If [value] is greater than all items on the list, the the length of the [list] is returned.
/// if [value] is in between some items on the sorted list, the index of the first item which
/// is equal to or greater than the [value] is returned.
///
/// -------------------------------------------------------------------------
///
/// The search will begin with a range from [start] to [end] (exclusive).
/// In each iteration, the range will be narrowed down by half. If [value] is less than
/// or equal to the item in the middle item of the range, left half of the range will
/// be selected, otherwise the right half. After this process is done, we are left with a singular range
/// containing only one item. The index of this item will be returned at the end.
///
///
/// The [list] must be a sorted list of items, otherwise the behavior of this
/// method is undefined.
///
/// -------------------------------------------------------------------------
/// Complexity: Time `O(log n)` | Space `O(1)`
int lowerBound<E, V>(
  final List<E> list,
  final V value, {
  final int? start,
  final int? end,
  final EntryComparator<E, V>? compare,
}) {
  int l, r, m, c;
  final int n = list.length;

  // Determine the lookup range [i, j)
  l = start ?? 0;
  if (l < 0) return -1;
  r = end ?? n;
  if (r > n) r = n;
  if (l >= r) return -1;

  try {
    if (compare != null) {
      while (l < r) {
        // the middle of the range
        m = l + ((r - l) >> 1);

        // compare middle item with value to select the next range
        c = compare(list[m], value);
        if (c < 0) {
          l = m + 1;
        } else {
          r = m;
        }
      }
    } else {
      while (l < r) {
        // the middle of the range
        m = l + ((r - l) >> 1);

        // compare middle item with value to select the next range
        c = (list[m] as Comparable).compareTo(value);
        if (c < 0) {
          l = m + 1;
        } else {
          r = m;
        }
      }
    }
  } on TypeError {
    return -1;
  }

  return l;
}

/// Returns the index of the last item in a sorted [list] that is not equal to
/// or greather than the [value].
///
/// -------------------------------------------------------------------------
///
/// * [list] represents a sorted of items.
/// * [value] is the item to search for.
/// * [start] is the start index where the search should begin.
/// * [end] is the final index where the search should stop.
/// * [compare] is a custom comparator function between a list element and the value.
///   If it is null, `compareTo` method of [list] item is used. If the list item is
///   not a subtype of Comparable, -1 is returned.
///
/// -------------------------------------------------------------------------
///
/// If [value] is less than all items on the list, -1 is returned.
/// If [value] is greater than all items on the list, last index of the [list] is returned.
/// if [value] is in between some items on the sorted list, the index of the last item which
/// is less than the [value] is returned.
///
/// -------------------------------------------------------------------------
///
/// The search will begin with a range from [start] to [end] (exclusive).
/// In each iteration, the range will be narrowed down by half. If [value] is less than
/// the middle item of the range, left half of the range will be selected, otherwise
/// the right half. After this process is done, we are left with a singular range
/// containing only one item. The index of this item will be returned at the end.
///
/// The [list] must be a sorted list of items, otherwise the behavior of this
/// method is undefined.
///
/// -------------------------------------------------------------------------
/// Complexity: Time `O(log n)` | Space `O(1)`
int upperBound<E, V>(
  final List<E> list,
  final V value, {
  final int? start,
  final int? end,
  final EntryComparator<E, V>? compare,
}) {
  int l, r, m, c;
  final int n = list.length;

  // Determine the lookup range [i, j)
  l = start ?? 0;
  if (l < 0) return -1;
  r = end ?? n;
  if (r > n) r = n;
  if (l >= r) return -1;

  try {
    if (compare != null) {
      while (l < r) {
        // the middle of the range
        m = l + ((r - l) >> 1);

        // compare middle item with value to select the next range
        c = compare(list[m], value);
        if (c <= 0) {
          l = m + 1;
        } else {
          r = m;
        }
      }
    } else {
      while (l < r) {
        // the middle of the range
        m = l + ((r - l) >> 1);

        // compare middle item with value to select the next range
        c = (list[m] as Comparable).compareTo(value);
        if (c <= 0) {
          l = m + 1;
        } else {
          r = m;
        }
      }
    }
  } on TypeError {
    return -1;
  }

  return l;
}
