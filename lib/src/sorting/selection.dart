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
/// * If [begin] is not below the length of the [list], range will be empty.
/// * [end] is the final index if the range to be sorted. It is exclusive.
/// * If [end] is above the length of the [list], it will be ignored.
/// * If [end] is negative, the absolute value of it will be subtracted
/// from the length of the [list] to determine where the range ends.
/// * If [end] is not greater than the [begin], the range will be empty.
/// * [compare] is a custom compare to order the list elements.
///   If it is null and [list] items are not [Comparable], [TypeError] is thrown.
///
/// ## Details
///
/// The selection sort algorithm sorts the [list] in an increasing order by
/// finding the minimum element from the unordered range and putting it at
/// the beginning in each iteration.
///
/// Although, it is faster than bubble sort, it requires more comparisons than
/// other O(n^2) algorithms such as insertion sort. Therefore, it is not very
/// useful in practice.
///
/// ---------------------------------------------------------------------------
/// Complexity: Time `O(n^2)` | Space `O(1)`
void selectionSort<E>(
  List<E> list, {
  int? begin,
  int? end,
  Comparator<E>? compare,
}) {
  int b, e;
  int n = list.length;

  // Find the range given the parameters.
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
    selectorSortDefault(list, b, e);
  } else {
    selectorSortCustom(list, b, e, compare);
  }
}

/// sorts range `[b, e)`
void selectorSortDefault<E>(List<E> list, int b, int e) {
  E tmp;
  int m, i, j;
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
}

/// sorts range `[b, e)`
void selectorSortCustom<E>(List<E> list, int b, int e, Comparator<E> compare) {
  E tmp;
  int m, i, j;
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
