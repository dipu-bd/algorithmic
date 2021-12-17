// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

/// Sorts the [list] of numbers using the
/// [Cocktail shaker sort](https://en.wikipedia.org/wiki/Cocktail_shaker_sort)
/// with a few improvements over the base algorithm.
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
/// This algorithm is known by many other names, e.g.: bidirectional bubble sort,
/// cocktail sort, shaker sort, ripple sort, shuffle sort, shuttle sort etc.
/// It extends bubble sort by operating in two directions.
///
/// Although the original cocktail shaker sort is very slow, with a few optimization,
/// it can work rather well. It can run in `O(n)` time in best case for already
/// or partially sorted lists.
///
/// ## Optimizations
///
/// Here are the list of optimizations done in this implementation:
/// 1. Excludes the first and last end of the range after each iteration.
/// (since they are already in proper place, no need to include them.)
/// 2. Keeping separate logic for when compare function is provided or not.
///
/// ---------------------------------------------------------------------------
/// Complexity: Time `O(n^2)` | Space `O(1)` <br>
/// Best Case: Time `O(n)` | Space `O(1)`
void cocktailShakerSort<E>(
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
    cocktailSortDefault(list, b, e);
  } else {
    cocktailSortCustom(list, b, e, compare);
  }
}

/// sorts range `[b, e)`
void cocktailSortDefault<E>(List<E> list, int b, int e) {
  E el;
  int t, i;

  // make range inclusive
  e--;

  // compare items with default comparision
  while (b <= e) {
    // forward loop: moves maximum item at the end
    t = b;
    for (i = b + 1; i <= e; ++i) {
      if ((list[i] as Comparable).compareTo(list[i - 1]) < 0) {
        el = list[i - 1];
        list[i - 1] = list[i];
        list[i] = el;
        t = i;
      }
    }
    e = t - 1;

    // reverse loop: move minimum item at the start
    t = e;
    for (i = e - 1; i >= b; --i) {
      if ((list[i] as Comparable).compareTo(list[i + 1]) > 0) {
        el = list[i];
        list[i] = list[i + 1];
        list[i + 1] = el;
        t = i;
      }
    }
    b = t + 1;
  }
}

/// sorts range `[b, e)`
void cocktailSortCustom<E>(List<E> list, int b, int e, Comparator<E> compare) {
  E el;
  int t, i;

  // make range inclusive
  e--;

  // compare items with default comparision
  while (b <= e) {
    // forward loop: moves maximum item at the end
    t = b;
    for (i = b + 1; i <= e; ++i) {
      if (compare(list[i], list[i - 1]) < 0) {
        el = list[i - 1];
        list[i - 1] = list[i];
        list[i] = el;
        t = i;
      }
    }
    e = t - 1;

    // reverse loop: move minimum item at the start
    t = e;
    for (i = e - 1; i >= b; --i) {
      if (compare(list[i], list[i + 1]) > 0) {
        el = list[i];
        list[i] = list[i + 1];
        list[i + 1] = el;
        t = i;
      }
    }
    b = t + 1;
  }
}
