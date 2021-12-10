// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import './gnome.dart';

/// Sorts the [list] of numbers using the
/// [quicksort](https://en.wikipedia.org/wiki/Quicksort) algorithm with
/// [Lomuto partition scheme](https://en.wikipedia.org/wiki/Quicksort#Lomuto_partition_scheme),
/// with several optimizations.
///
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
/// * [minItemLimit] is the maximum limit for which a range can be sorted using
///   gnome sort.
///
/// ## Optimizations
///
/// 1. Using iterative approach to avoid recursive calls. (dart functions are slow as a sloth!)
/// 2. Keeping stack smaller by tail-call optimization. (reduces memory usage)
/// 3. Use gnome sort on smaller ranges. (configurable by [minItemLimit] parameter)
/// 4. Following Sedwick's optimization and using median-of-3 to choose the pivot.
///   (avoiding worst-case performance on already sorted list)
/// 5. Exclude items equal to the pivot to avoid worst-case performance on list with
///   repeatitive items.
/// 6. Keeping separate logic for when compare function is provided or not.
///    (again, dart functions are slow as a turtle!)
///
/// ## Algorithm Details
///
/// - If the range has less than two items, returns immediately.
/// - Otherwise, add the range to a stack.
/// - While the stack is not empty:
///   - Pop last range from the stack.
///   - Set the left index of the range as a temporary pivot index.
///   - To simulate the tail-call optimization and keep the stack smaller,
///     while temporary pivot index is less than the right index:
///     - if range has less than or equal to [minItemLimit] items, apply
///       [gnomeSort] on the range, and break current iteration.
///     - Otherwise, calculate the median of the range.
///     - The items at left, median, and right index are swapped in a way so that
///       the left item is less than both right and median items, and the right item
///       is less than the median item.
///     - Select the right item as the  pivot.
///     - Partitions the range by moving the temporary pivot index is moved to
///       a location where the pivot index holds the pivot, left part holds all
///       items less than or equal to the pivot, and right part has all items greater
///       than the pivot.
///      - If left part has more than one item, push the range to the stack.
///      - set the left index to the current temporary pivot index, and continue
///        this inner loop.
///
/// --------------------------------------------------------------------------
/// Complexity: Time `O(n log n)` | Space `O(log n)` <br>
/// Worst-case: Time `O(n^2)` | Space `O(log n)`
void quickSortLomuto<E>(
  List<E> list, {
  int? begin,
  int? end,
  Comparator<E>? compare,
  int minItemLimit = 32,
}) {
  int b, e;
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

  // If the range has less than two items, returns immediately.
  if (b + 1 >= e) return;

  // add the range to a stack.
  var queue = <int>[];
  queue.add(b);
  queue.add(e - 1);

  // While the stack is not empty
  int l, h, p, q;
  while (queue.isNotEmpty) {
    // pop last range from the stack
    h = queue.removeLast();
    l = queue.removeLast();

    // Temporary pivot index
    p = l;

    // To keep the stack smaller by simulating the tail-call optimization
    while (l < h) {
      // If there are few elements, sort them using gnome sort and break the loop
      if (l + minItemLimit > h) {
        gnomeSort(list, begin: l, end: h + 1, compare: compare);
        break;
      }

      // To avoid worst-case pitfall of already sorted list
      _sortByMedian(list, l, h, compare);

      // Partition list around pivot index
      p = _partitionRange(list, l, h, compare);

      // Optimization for repeated values on left partition.
      // exclude the items from the left range that are equal to the pivot
      q = p - 1;
      if (compare == null) {
        while (q > l && list[q] == list[p]) {
          q--;
        }
      } else {
        while (q > l && compare(list[q], list[p]) == 0) {
          q--;
        }
      }

      // take the left partition if it has more than one element
      if (l < q) {
        queue.add(l);
        queue.add(q);
      }

      // select the right partition to continue the inner loop
      l = p + 1;
    }
  }
}

void _sortByMedian<E>(List<E> list, int l, int h, Comparator<E>? compare) {
  // median of the two bounds
  int m = (l + h) >> 1;
  E el = list[l];
  E em = list[m];
  E eh = list[h];

  // Sedgewick's optimization: el < eh < em
  // el < em | el < eh | eh < em
  if (compare == null) {
    // compare with default comparator

    if (l + 2 > h) {
      // if there are only two items, sort them and return
      if ((eh as Comparable).compareTo(el) < 0) {
        list[l] = eh;
        list[h] = el;
      }
      return;
    }

    if ((em as Comparable).compareTo(el) < 0) {
      E t = em;
      em = el;
      el = t;
    }
    if ((eh as Comparable).compareTo(el) < 0) {
      E t = eh;
      eh = el;
      el = t;
    }
    if ((em as Comparable).compareTo(eh) < 0) {
      E t = em;
      em = eh;
      eh = t;
    }
  } else {
    // compare with custom comparator (slower)

    if (l + 2 > h) {
      // if there are only two items, sort them and return
      if (compare(eh, el) < 0) {
        list[l] = eh;
        list[h] = el;
      }
      return;
    }

    if (compare(em, el) < 0) {
      E t = em;
      em = el;
      el = t;
    }
    if (compare(eh, el) < 0) {
      E t = eh;
      eh = el;
      el = t;
    }
    if (compare(em, eh) < 0) {
      E t = em;
      em = eh;
      eh = t;
    }
  }

  list[l] = el;
  list[m] = em;
  list[h] = eh;
}

int _partitionRange<E>(List<E> list, int l, int h, Comparator<E>? compare) {
  // choose the last element as the pivot
  E pivot = list[h];

  // Temporary pivot index
  int p = l;

  // PARTITIONING: Move the pivot index to the right position, where all
  // items on the left are less or equal to the pivot, and all items on
  // the right are greater than pivot.
  if (compare == null) {
    // compare with default comparator
    for (int i = l; i < h; ++i) {
      // if the item is less or equal to the pivot
      if ((list[i] as Comparable).compareTo(pivot) <= 0) {
        // swap the current item with the item at the temporary pivot index
        E t = list[p];
        list[p] = list[i];
        list[i] = t;
        // move the temporary pivot index forward
        p++;
      }
    }
  } else {
    // compare with custom comparator (slower)
    for (int i = l; i < h; ++i) {
      // if the item is less or equal to the pivot
      if (compare(list[i], pivot) <= 0) {
        // swap the current item with the item at the temporary pivot index
        E t = list[p];
        list[p] = list[i];
        list[i] = t;
        // move the temporary pivot index forward
        p++;
      }
    }
  }

  // move the pivot item at the pivot index
  list[h] = list[p];
  list[p] = pivot;

  return p;
}
