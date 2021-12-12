// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

/// Sorts the [list] of numbers using the
/// [selection sort](https://en.wikipedia.org/wiki/Selection_sort) algorithm.
///
/// ## Parameters
///
/// * [list] is any list of items to be sorted.
/// * To perform partial sorting, you can specify the [begin] or [end].
/// * [begin] is the start index of the range to be sorted.
/// * If [begin] is negative, range starts at the 0
/// * if [begin] is not below the length of the [list], range will be empty.
/// * [end] is the final index if the range to be sorted. It is exclusive.
/// * If [end] is above the length of the [list], it will be ignored.
/// * if [end] is negative, the absolute value of it will be subtracted
/// from the length of the [list] to determine where the range ends.
/// * if [end] is not greater than the [begin], the range will be empty.
/// * [compare] is a custom comparator to order the list elements.
///   If it is null and [list] items are not [Comparable], [TypeError] is thrown.
///
/// ## Details
///
/// The selection sort algorithm sorts the [list] in an increasing order by finding
/// the minimum element from the unordered range and putting it at the beginning in
/// each iteration.
///
/// ----------------------------------------------------------------
/// Complexity: Time `O(n^2)` | Space `O(1)`
void selectionSort<E>(
  final List<E> list, {
  final int? begin,
  final int? end,
  final Comparator<E>? compare,
}) {
  E tmp;
  int b, e, m, i, j;
  int n = list.length;

  b = 0;
  e = n;
  if (begin != null && b < begin) {
    b = begin;
  }
  if (end != null && end < e) {
    e = end;
    if (e < 0) e += n;
  }

  if (compare == null) {
    // compare items with default comparision
    for (i = b; i < e; ++i) {
      m = i;
      for (j = i + 1; j < e; ++j) {
        if ((list[j] as Comparable).compareTo(list[m]) < 0) {
          m = j;
        }
      }
      if (m != i) {
        tmp = list[m];
        list[m] = list[i];
        list[i] = tmp;
      }
    }
  } else {
    // compare items with custom comparator (slower)
    for (i = b; i < e; ++i) {
      m = i;
      for (j = i + 1; j < e; ++j) {
        if (compare(list[j], list[m]) < 0) {
          m = j;
        }
      }
      if (m != i) {
        tmp = list[m];
        list[m] = list[i];
        list[i] = tmp;
      }
    }
  }
}
