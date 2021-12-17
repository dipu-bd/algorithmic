// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

/// Sorts the [list] of numbers using the
/// [bubble sort](https://en.wikipedia.org/wiki/Bubble_sort) algorithm.
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
/// The bubble sort algorithm sorts the [list] in an increasing order by swapping
/// unordered items repeteadly until the end of the list. It is very similar to
/// selection sort, except that the swap operation is happening all the time here.
/// Therefore, it is comparatively slower than selection sort and not very usefull
/// in practice.
///
/// ---------------------------------------------------------------------------
/// Complexity: Time `O(n^2)` | Space `O(1)`
void bubbleSort<E>(
  final List<E> list, {
  final int? begin,
  final int? end,
  final Comparator<E>? compare,
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
    bubbleSortDefault(list, b, e);
  } else {
    bubbleSortCustom(list, b, e, compare);
  }
}

/// sorts range `[b, e)`
void bubbleSortDefault<E>(List<E> list, int b, int e) {
  E tmp;
  int i, j, t;
  for (i = b + 1; i < e; ++i) {
    t = e - (i - b) + 1;
    for (j = b + 1; j < t; ++j) {
      if ((list[j] as Comparable).compareTo(list[j - 1]) < 0) {
        tmp = list[j - 1];
        list[j - 1] = list[j];
        list[j] = tmp;
      }
    }
  }
}

/// sorts range `[b, e)`
void bubbleSortCustom<E>(List<E> list, int b, int e, Comparator<E> compare) {
  E tmp;
  int i, j, t;
  for (i = b + 1; i < e; ++i) {
    t = e - (i - b) + 1;
    for (j = b + 1; j < t; ++j) {
      if (compare(list[j], list[j - 1]) < 0) {
        tmp = list[j - 1];
        list[j - 1] = list[j];
        list[j] = tmp;
      }
    }
  }
}
