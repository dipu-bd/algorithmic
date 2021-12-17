// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'cocktail_shaker.dart';

/// Sorts the [list] of numbers using the
/// [quicksort](https://en.wikipedia.org/wiki/Quicksort) algorithm following
/// [Lomuto partition scheme](https://en.wikipedia.org/wiki/Quicksort#Lomuto_partition_scheme)
/// with several optimizations.
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
/// * [threshold] is the maximum limit for which a range can be sorted using
///   insertion sort.
///
/// ## Optimizations
///
/// 1. Using iterative approach to avoid recursion. (function calls are slow)
/// 2. Keeping stack smaller by tail-call optimization. (reduces memory usage)
/// 3. Use insertion sort on smaller ranges. (configurable by [threshold] parameter)
/// 4. Following Sedwick's optimization and using median-of-3 to choose the pivot.
///   (avoiding worst-case performance on already sorted list)
/// 5. Exclude items equal to the pivot to avoid worst-case performance on list with
///   repeatitive items.
/// 6. Keeping separate logic for when compare function is provided or not.
///
/// ## Details
///
/// Quicksort is a type of divide and conquer algorithm for sorting an array,
/// based on a partitioning routine; the details of this partitioning can vary
/// somewhat, so that quicksort is really a family of closely related algorithms.
///
/// Lomuto scheme is attributed to Nico Lomuto. This scheme chooses a pivot that
/// is typically the last element in the array. The algorithm maintains a temporary
/// pivot index `p` as it scans the array using another index `i` such that the elements
/// at `l` through `i-1` (inclusive) are less than the pivot, and the elements at
/// `i` through `p` (inclusive) are equal to or greater than the pivot.
///
/// This scheme degrades to O(n^2) when the [list] is already sorted, or items are repetitive,
/// but some optimizations can be done to overcome that. Still this is less efficient than
/// Haore's original scheme implemented in [quickSortHaore].
///
/// --------------------------------------------------------------------------
/// Complexity: Time `O(n log n)` | Space `O(log n)` <br>
/// Worst-case: Time `O(n^2)` | Space `O(log n)`
void quickSortLomuto<E>(
  List<E> list, {
  int? begin,
  int? end,
  Comparator<E>? compare,
  int threshold = 32,
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

  // If the range has less than two items, returns immediately.
  if (b + 1 >= e) return;

  if (compare == null) {
    quickSortDefault(list, b, e, threshold);
  } else {
    quickSortCustom(list, b, e, threshold, compare);
  }
}

/// sorts range `[b, e)`
void quickSortDefault<E>(List<E> list, int b, int e, int threshold) {
  int l, h, p, q;

  // add the range to a stack.
  var stack = <int>[];
  stack.add(b);
  stack.add(e - 1);

  // While the stack is not empty
  while (stack.isNotEmpty) {
    // pop last range from the stack
    h = stack.removeLast();
    l = stack.removeLast();

    // To keep the stack smaller by simulating the tail-call optimization
    while (l < h) {
      // If there are few elements, sort them using insertion sort and break the loop
      if (l + threshold > h) {
        cocktailSortDefault(list, l, h + 1);
        break;
      }

      // To avoid worst-case pitfall of already sorted list
      _sortByMedianDefault(list, l, h);

      // Partition list around pivot index
      p = _partitionRangeDefault(list, l, h);

      // Optimization for repeated values on left partition.
      // exclude the items from the left range that are equal to the pivot
      q = p + 1;
      while (q < h && list[q] == list[p]) {
        q++;
      }

      // take the left partition if it has more than one element
      if (l < p - 1) {
        stack.add(l);
        stack.add(p - 1);
      }

      // select the right partition to continue the inner loop
      l = q;
    }
  }
}

/// sorts range `[b, e)`
void quickSortCustom<E>(
    List<E> list, int b, int e, int threshold, Comparator<E> compare) {
  int l, h, p, q;

  // add the range to a stack.
  var stack = <int>[];
  stack.add(b);
  stack.add(e - 1);

  // While the stack is not empty
  while (stack.isNotEmpty) {
    // pop last range from the stack
    h = stack.removeLast();
    l = stack.removeLast();

    // To keep the stack smaller by simulating the tail-call optimization
    while (l < h) {
      // If there are few elements, sort them using insertion sort and break the loop
      if (l + threshold > h) {
        cocktailSortCustom(list, l, h + 1, compare);
        break;
      }

      // To avoid worst-case pitfall of already sorted list
      _sortByMedianCustom(list, l, h, compare);

      // Partition list around pivot index
      p = _partitionRangeCustom(list, l, h, compare);

      // Optimization for repeated values on left partition.
      // exclude the items from the left range that are equal to the pivot
      q = p + 1;
      while (q < h && compare(list[q], list[p]) == 0) {
        q++;
      }

      // take the left partition if it has more than one element
      if (l < p - 1) {
        stack.add(l);
        stack.add(p - 1);
      }

      // select the right partition to continue the inner loop
      l = q;
    }
  }
}

/// compare with default comparator
void _sortByMedianDefault<E>(List<E> list, int l, int h) {
  // median of the two bounds
  int m = (l + h) >> 1;

  E tmp;
  E el = list[l];
  E em = list[m];
  E eh = list[h];

  if (l == m) {
    // if there are only two items, sort them and return
    if ((eh as Comparable).compareTo(el) < 0) {
      list[l] = eh;
      list[h] = el;
    }
    return;
  }

  // Sedgewick's optimization: el < eh < em
  // el < em | el < eh | eh < em
  if ((em as Comparable).compareTo(el) < 0) {
    tmp = em;
    em = el;
    el = tmp;
  }
  if ((eh as Comparable).compareTo(el) < 0) {
    tmp = eh;
    eh = el;
    el = tmp;
  }
  if ((em as Comparable).compareTo(eh) < 0) {
    tmp = em;
    em = eh;
    eh = tmp;
  }

  list[l] = el;
  list[m] = em;
  list[h] = eh;
}

/// compare with custom compare (slower)
void _sortByMedianCustom<E>(List<E> list, int l, int h, Comparator<E> compare) {
  // median of the two bounds
  int m = (l + h) >> 1;

  E tmp;
  E el = list[l];
  E em = list[m];
  E eh = list[h];

  if (l == m) {
    // if there are only two items, sort them and return
    if (compare(eh, el) < 0) {
      list[l] = eh;
      list[h] = el;
    }
    return;
  }

  // Sedgewick's optimization: el < eh < em
  // el < em | el < eh | eh < em
  if (compare(em, el) < 0) {
    tmp = em;
    em = el;
    el = tmp;
  }
  if (compare(eh, el) < 0) {
    tmp = eh;
    eh = el;
    el = tmp;
  }
  if (compare(em, eh) < 0) {
    tmp = em;
    em = eh;
    eh = tmp;
  }

  list[l] = el;
  list[m] = em;
  list[h] = eh;
}

/// compare with default comparator
int _partitionRangeDefault<E>(List<E> list, int l, int h) {
  E tmp;

  // choose the last element as the pivot
  E pivot = list[h];

  // Temporary pivot index
  int p = l;

  for (; l < h; ++l) {
    // if the item is less or equal to the pivot
    if ((list[l] as Comparable).compareTo(pivot) < 0) {
      // swap the current item with the item at the temporary pivot index
      tmp = list[p];
      list[p] = list[l];
      list[l] = tmp;
      // move the temporary pivot index forward
      p++;
    }
  }

  // move the pivot item at the pivot index
  list[h] = list[p];
  list[p] = pivot;

  return p;
}

/// compare with custom compare (slower)
int _partitionRangeCustom<E>(
    List<E> list, int l, int h, Comparator<E> compare) {
  E tmp;

  // choose the last element as the pivot
  E pivot = list[h];

  // Temporary pivot index
  int p = l;

  for (; l < h; ++l) {
    // if the item is less or equal to the pivot
    if (compare(list[l], pivot) < 0) {
      // swap the current item with the item at the temporary pivot index
      tmp = list[p];
      list[p] = list[l];
      list[l] = tmp;
      // move the temporary pivot index forward
      p++;
    }
  }

  // move the pivot item at the pivot index
  list[h] = list[p];
  list[p] = pivot;

  return p;
}
