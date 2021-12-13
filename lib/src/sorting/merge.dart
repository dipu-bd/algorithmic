// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

/// Sorts the [list] of numbers using the
/// [merge sort](https://en.wikipedia.org/wiki/Merge_sort) algorithm
/// with a few optimizations.
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
/// * [threshold] is the maximum limit for which a range can be sorted using
///   gnome sort. It must be a power of 2, otherwise [ArgumentError] is thrown.
///
/// ## Optimizations
///
/// 1. Using iterative approach to avoid recursion. (function calls are slow)
/// 2. Use gnome sort on smaller ranges. (configurable by [threshold] parameter)
/// 4. Exclude items equal to the pivot to avoid worst-case performance on list with
///   repeatitive items.
/// 5. Keeping separate logic for when compare function is provided or not.
///
///
/// ## Details
///
/// Mergesort is a divide and conquer based algorithm, which can handle very
/// large arrays. Unlike quick sort, it promises `O(n log n)` performance in
/// worst case and provides stable sort. But it performs poorly in practice
/// due to high memory overhead, and frequent copy operations.
///
/// ---------------------------------------------------------------------------
/// Complexity: Time `O(n log n)` | Space `O(n)`
void mergeSort<E>(
  List<E> list, {
  int? begin,
  int? end,
  Comparator<E>? compare,
  int threshold = 8,
}) {
  int b, e, w, l, r, m, c;
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

  // Check the threshold
  w = threshold;
  if (w <= 1) {
    w = 1;
  } else if ((w & (w - 1)) != 0) {
    throw ArgumentError('Threshold must a power of two');
  } else {
    // Sort by threshold
    if (compare == null) {
      for (l = b; l < e; l = r) {
        r = l + w;
        if (r > e) r = e;
        _gnomeSortDefault(list, l, r);
      }
    } else {
      for (l = b; l < e; l = r) {
        r = l + w;
        if (r > e) r = e;
        _gnomeSortCustom(list, l, r, compare);
      }
    }
  }

  // If the range is already sorted
  if (b + w >= e) return;

  // Make a work copy of the range
  List<E> copy = [...list];
  List<E> tmp;

  for (c = 0; w < e; w <<= 1, c ^= 1) {
    if (compare == null) {
      _mergeDefault(list, copy, b, e, w);
    } else {
      _mergeCustom(list, copy, b, e, w, compare);
    }

    // swap lists
    tmp = copy;
    copy = list;
    list = tmp;
  }

  // copy items to original list
  if (c == 1) {
    for (m = b; m < e; m++) {
      copy[m] = list[m];
    }
  }
}

/// compare items with default comparision
void _gnomeSortDefault<E>(List<E> list, int l, int h) {
  E t;
  int i = l + 1;
  while (i < h) {
    if (i == l) {
      i++;
      continue;
    }
    if ((list[i - 1] as Comparable).compareTo(list[i]) <= 0) {
      i++;
      continue;
    }
    t = list[i - 1];
    list[i - 1] = list[i];
    list[i] = t;
    i--;
  }
}

/// compare items with custom comparator (slower)
void _gnomeSortCustom<E>(List<E> list, int l, int h, Comparator<E> compare) {
  E t;
  int i = l + 1;
  while (i < h) {
    if (i == l) {
      i++;
      continue;
    }
    if (compare(list[i - 1], list[i]) <= 0) {
      i++;
      continue;
    }
    t = list[i - 1];
    list[i - 1] = list[i];
    list[i] = t;
    i--;
  }
}

void _mergeDefault<E>(List<E> list, List<E> copy, int b, int e, int w) {
  int l, m, r, i, j, k;

  // first range
  l = b;
  m = l + w;
  r = m + w;

  // consider all subranges of length 2 * w in within [b, e)
  while (l < e) {
    if (m > e) m = e;
    if (r > e) r = e;

    i = l;
    j = m;
    k = l;

    // merge two ranges: [l..m) and [m..r)
    while (i < m && j < r) {
      if ((list[i] as Comparable).compareTo(list[j]) <= 0) {
        // item at i is less than or equal to the item at j
        copy[k++] = list[i++];
      } else {
        // item at i is greater than item at j
        copy[k++] = list[j++];
      }
    }

    // take remaining [i..m) or [j..h)
    // either one or both of the two ranges are empty here
    while (i < m) {
      copy[k++] = list[i++];
    }
    while (j < r) {
      copy[k++] = list[j++];
    }

    // next range
    l = r;
    m = l + w;
    r = m + w;
  }
}

void _mergeCustom<E>(
    List<E> list, List<E> copy, int b, int e, int w, Comparator<E> compare) {
  int l, m, r, i, j, k;

  // first range
  l = b;
  m = l + w;
  r = m + w;

  // consider all subranges of length 2 * w in within [b, e)
  while (l < e) {
    if (m > e) m = e;
    if (r > e) r = e;

    i = l;
    j = m;
    k = l;

    // merge two ranges: [l..m) and [m..r)
    while (i < m && j < r) {
      if (compare(list[i], list[j]) <= 0) {
        // item at i is less than or equal to the item at j
        copy[k++] = list[i++];
      } else {
        // item at i is greater than item at j
        copy[k++] = list[j++];
      }
    }

    // take remaining [i..m) or [j..h)
    // either one or both of the two ranges are empty here
    while (i < m) {
      copy[k++] = list[i++];
    }
    while (j < r) {
      copy[k++] = list[j++];
    }

    // next range
    l = r;
    m = l + w;
    r = m + w;
  }
}
