// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

/// Sorts the [list] of numbers using the
/// [insertion sort](https://en.wikipedia.org/wiki/Insertion_sort) algorithm.
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
/// The insertion sort algorithm sorts the [list] in an increasing order by virtually
/// splitting it into two parts. Left part is ordered, the right part is unordered.
/// In each iteration, it removes the first item from unordered part, and insert it
/// into the ordered part maintaining the increasing order.
///
/// ----------------------------------------------------------------
/// Complexity: Time `O(n^2)` | Space `O(1)`
void insertionSort<E>(
  final List<E> list, {
  final int? begin,
  final int? end,
  final Comparator<E>? compare,
}) {
  E el;
  int b, e, i, j;
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
    for (i = b + 1; i < e; ++i) {
      el = list[i];
      j = i;
      while (j > b) {
        if ((list[j - 1] as Comparable).compareTo(el) <= 0) break;
        list[j] = list[j - 1];
        j--;
      }
      list[j] = el;
    }
  } else {
    // compare items with custom comparator (slower)
    for (i = b + 1; i < e; ++i) {
      el = list[i];
      j = i;
      while (j > b) {
        if (compare(list[j - 1], el) <= 0) break;
        list[j] = list[j - 1];
        j--;
      }
      list[j] = el;
    }
  }
}
