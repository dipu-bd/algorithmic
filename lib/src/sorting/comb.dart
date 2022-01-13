// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

/// Sorts the [list] of numbers using the
/// [Comb sort](https://en.wikipedia.org/wiki/Comb_sort) algorithm.
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
/// * [shrinkFactor] is the gap shrink factor for comb sort. For small lists,
///   higher shrink factor works well.
/// * [compare] is a custom compare to order the list elements.
///   If it is null and [list] items are not [Comparable], [TypeError] is thrown.
///
/// ## Details
///
/// Comb sort improves bubble sort by eliminating small values near the end of the
/// list, since they slows down bubble sort.
///
/// This algorithm considers the index distance between two items (called gap).
/// Initially the gap is the length of the range to be sorted, and in each
/// iteration the gap is reduced by a [shrinkFactor] untill the gap reaches 1.
///
/// Since the implementation requires floating point operations, it performs poorly
/// compared to other variations of bubble sort (e.g. cocktail shaker sort).
///
/// ---------------------------------------------------------------------------
/// Complexity: Time `O(n^2)` | Space `O(1)`
void combSort<E>(
  List<E> list, {
  int? begin,
  int? end,
  double shrinkFactor = 2.2,
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
    combSortDefault(list, b, e, shrinkFactor);
  } else {
    combSortCustom(list, b, e, shrinkFactor, compare);
  }
}

/// sorts range `[b, e)`
void combSortDefault<E>(List<E> list, int b, int e, double k) {
  E tmp;
  int i;

  int n = e - b; // initial the gap size
  bool sorted = false;

  while (!sorted) {
    // Update the gap value for a next comb
    n = (n / k).floor();
    if (n <= 1) {
      n = 1;
      sorted = true; // If there are no swaps this pass, we are done
    }

    // A single "comb" over the input list
    for (i = b; i + n < e; i++) {
      if ((list[i] as Comparable).compareTo(list[i + n]) > 0) {
        tmp = list[i];
        list[i] = list[i + n];
        list[i + n] = tmp;

        // If this assignment never happens within the loop,
        // then there have been no swaps and the list is sorted.
        sorted = false;
      }
    }
  }
}

/// sorts range `[b, e)`
void combSortCustom<E>(
    List<E> list, int b, int e, double k, Comparator<E> compare) {
  E tmp;
  int i;

  int n = e - b; // initial the gap size
  bool sorted = false;

  while (!sorted) {
    // Update the gap value for a next comb
    n = (n / k).floor();
    if (n <= 1) {
      n = 1;
      sorted = true; // If there are no swaps this pass, we are done
    }

    // A single "comb" over the input list
    for (i = b; i + n < e; i++) {
      if (compare(list[i], list[i + n]) > 0) {
        tmp = list[i];
        list[i] = list[i + n];
        list[i + n] = tmp;

        // If this assignment never happens within the loop,
        // then there have been no swaps and the list is sorted.
        sorted = false;
      }
    }
  }
}
