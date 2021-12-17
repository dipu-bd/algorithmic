// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

/// Sorts the [list] of numbers using the
/// [quicksort](https://en.wikipedia.org/wiki/Quicksort) algorithm following
/// [Hoare partition scheme](https://en.wikipedia.org/wiki/Quicksort#Hoare_partition_scheme)
/// with several optimizations.
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
///   insertion sort.
///
/// ## Optimizations
///
/// 1. Using iterative approach to avoid recursion. (function calls are slow)
/// 2. Keeping stack smaller by tail-call optimization. (reduces memory usage)
/// 3. Use insertion sort on smaller ranges. (configurable by [threshold] parameter)
/// 4. Exclude items equal to the pivot to avoid worst-case performance on list with
///   repeatitive items.
/// 5. Keeping separate logic for when compare function is provided or not.
///
/// ## Details
///
/// Quicksort is a type of divide and conquer algorithm for sorting an array,
/// based on a partitioning routine; the details of this partitioning can vary
/// somewhat, so that quicksort is really a family of closely related algorithms.
///
/// Haore partition scheme was proposed by the original developer of quicksort
/// Tony Haore. This scheme selects the item at the middle of the range as pivot,
/// then partitions the [list] into two parts using two pointers so that all items
/// on the left part is less or equal to the pivot, and all items on the other part
/// is greater or equal to the pivot.
///
/// Compared to Lomuto's scheme, this scheme uses less swap operations, which
/// actually helps to speed things up by a lot in dart. You can check the benchmarks
/// for a comparison between these two implementations.
///
/// --------------------------------------------------------------------------
/// Complexity: Time `O(n log n)` | Space `O(log n)` <br>
/// Worst-case: Time `O(n^2)` | Space `O(log n)`
void quickSortHaore<E>(
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

  // add the range to a stack.
  if (compare == null) {
    _quickSortDefault(list, b, e, threshold);
  } else {
    _quickSortCustom(list, b, e, threshold, compare);
  }
}

void _quickSortDefault<E>(List<E> list, int b, int e, int threshold) {
  E pivot;
  int l, h, p, q, r;

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
      // Choose the middle item as pivot
      pivot = list[(l + h) >> 1];

      // Optimization: if the range is short, sort using insertion sort and break
      if (l + threshold > h) {
        _insertionSortDefault(list, l, h);
        break;
      }

      // Partition list around pivot index
      p = _partitionRangeDefault(list, l, h);

      // Optimization for repeated values: exclude items equal to pivot
      // exclude the items from the left range that are equal to the pivot
      q = p;
      while (l < q && list[q] == pivot) {
        q--;
      }
      // exclude the items from the right range that are equal to the pivot
      r = p + 1;
      while (r < h && list[r] == pivot) {
        r++;
      }

      // take the left partition if it has more than one element
      if (l < q) {
        stack.add(l);
        stack.add(q);
      }

      // select the right partition to continue the inner loop
      l = r;
    }
  }
}

void _quickSortCustom<E>(
    List<E> list, int b, int e, int threshold, Comparator<E> compare) {
  E pivot;
  int l, h, p, q, r;

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
      // Choose the middle item as pivot
      pivot = list[(l + h) >> 1];

      // Optimization: if the range is short, sort using insertion sort and break
      if (l + threshold > h) {
        _insertionSortCustom(list, l, h, compare);
        break;
      }

      // Partition list around pivot index
      p = _partitionRangeCustom(list, l, h, compare);

      // Optimization for repeated values: exclude items equal to pivot
      // exclude the items from the left range that are equal to the pivot
      q = p;
      while (l < q && compare(list[q], pivot) == 0) {
        q--;
      }
      // exclude the items from the right range that are equal to the pivot
      r = p + 1;
      while (r < h && compare(list[r], pivot) == 0) {
        r++;
      }

      // take the left partition if it has more than one element
      if (l < q) {
        stack.add(l);
        stack.add(q);
      }

      // select the right partition to continue the inner loop
      l = r;
    }
  }
}

/// compare items with default comparision
void _insertionSortDefault<E>(List<E> list, int b, int e) {
  E el;
  int i, j;
  for (i = b + 1; i <= e; ++i) {
    for (j = i; j > b; --j) {
      if ((list[j - 1] as Comparable).compareTo(list[j]) <= 0) break;
      el = list[j - 1];
      list[j - 1] = list[j];
      list[j] = el;
    }
  }
}

/// compare items with custom comparator (slower)
void _insertionSortCustom<E>(
    List<E> list, int b, int e, Comparator<E> compare) {
  E el;
  int i, j;
  for (i = b + 1; i <= e; ++i) {
    for (j = i; j > b; --j) {
      if (compare(list[j - 1], list[j]) <= 0) break;
      el = list[j - 1];
      list[j - 1] = list[j];
      list[j] = el;
    }
  }
}

/// compare items with default comparision
int _partitionRangeDefault<E>(List<E> list, int l, int h) {
  E t;

  // Choose the middle item as pivot
  E pivot = list[(l + h) >> 1];

  for (;; l++, h--) {
    // Move the left index to the right at least once and while the element at
    // the left index is less than the pivot
    while ((list[l] as Comparable).compareTo(pivot) < 0) {
      l++;
    }

    // Move the right index to the left at least once and while the element at
    // the right index is greater than the pivot
    while ((list[h] as Comparable).compareTo(pivot) > 0) {
      h--;
    }

    // If the indices crossed, return
    if (l >= h) return h;

    // Swap the elements at the left and right indices
    t = list[h];
    list[h] = list[l];
    list[l] = t;
  }
}

/// compare items with custom comparator (slower)
int _partitionRangeCustom<E>(
    List<E> list, int l, int h, Comparator<E> compare) {
  E t;

  // Choose the middle item as pivot
  E pivot = list[(l + h) >> 1];

  for (;; l++, h--) {
    // Move the left index to the right at least once and while the element at
    // the left index is less than the pivot
    while (compare(list[l], pivot) < 0) {
      l++;
    }

    // Move the right index to the left at least once and while the element at
    // the right index is greater than the pivot
    while (compare(list[h], pivot) > 0) {
      h--;
    }

    // If the indices crossed, return
    if (l >= h) return h;

    // Swap the elements at the left and right indices
    t = list[h];
    list[h] = list[l];
    list[l] = t;
  }
}
