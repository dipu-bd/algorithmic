// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

/// Sorts the [list] of numbers using the
/// [gnome sort](https://en.wikipedia.org/wiki/Gnome_sort) algorithm.
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
/// In this sort, in each iteration, if the item at the current index is less than
/// the previous item, they are swapped, and `index` decreases by 1. Otherwise, the
/// index increases by one. If index is at 0, it increases by 1. If index reaches the
/// end of the range, the sort is done.
///
/// This is a variation of the insertion sort with a simpler implementation, which
/// performs better if the array is already or partially sorted.
///
/// ----------------------------------------------------------------
/// Complexity: Time `O(n^2)` | Space `O(1)`
void gnomeSort<E>(
  final List<E> list, {
  final int? begin,
  final int? end,
  final Comparator<E>? compare,
}) {
  int b, e, c;
  final int n = list.length;

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
    for (int i = b + 1; i < e;) {
      if (i == b) {
        i++;
        continue;
      }
      c = (list[i - 1] as Comparable).compareTo(list[i]);
      if (c <= 0) {
        i++;
        continue;
      }
      final E t = list[i - 1];
      list[i - 1] = list[i];
      list[i] = t;
      i--;
    }
  } else {
    // compare items with custom comparator (slower)
    for (int i = b + 1; i < e;) {
      if (i == b) {
        i++;
        continue;
      }
      c = compare(list[i - 1], list[i]);
      if (c <= 0) {
        i++;
        continue;
      }
      final E t = list[i - 1];
      list[i - 1] = list[i];
      list[i] = t;
      i--;
    }
  }
}
