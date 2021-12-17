// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

/// Sorts a [list] of integer numbers of small range using the
/// [counting sort](https://en.wikipedia.org/wiki/Counting_sort) algorithm.
///
/// ## Parameters
///
/// * [list] is any list of integers to be sorted.
/// * To perform partial sorting, you can specify the [begin] or [end].
/// * [begin] is the start index of the range to be sorted.
/// * If [begin] is negative, range starts at the 0
/// * If [begin] is not below the length of the [list], range will be empty.
/// * [end] is the final index if the range to be sorted. It is exclusive.
/// * If [end] is above the length of the [list], it will be ignored.
/// * If [end] is negative, the absolute value of it will be subtracted
/// from the length of the [list] to determine where the range ends.
/// * If [end] is not greater than the [begin], the range will be empty.
/// * Set [reversed] to `true` if you want to sort in descending order.
///
/// ## Details
///
/// This algorithm is used to sort small integers in linear time. It counts the
/// frequencies of the numbers appearing in an array, and then using this to
/// reconstruct a sorted list.
///
/// It assuumes that the numbers in the list will be in a small range `[low, high]`
/// of length `k` . An array of size `k` is initialized to count the frequencies
/// of numbers. Be aware that if `k` is too large it becomes greatly inefficient.
///
/// ---------------------------------------------------------------------------
/// Complexity: Time `O(n + k)` | Space `O(k)` (`k` is the range of the numbers)
void countingSort(
  List<int> list, {
  int? begin,
  int? end,
  bool reversed = false,
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

  if (b + 1 >= e) return;

  countingSortRange(list, b, e);

  if (reversed) {
    // reverse the order of the list
    int i, j, t;
    i = b;
    j = e - 1;
    for (; i < j; i++, j--) {
      t = list[i];
      list[i] = list[j];
      list[j] = t;
    }
  }
}

/// sorts range `[b, e)`
void countingSortRange(List<int> list, int b, int e) {
  int l, h, n, i, j, k;

  // Find the minimum and maximum numbers in range [b, e)
  l = list[b];
  h = list[b];
  for (i = b + 1; i < e; ++i) {
    if (list[i] < l) {
      l = list[i];
    }
    if (list[i] > h) {
      h = list[i];
    }
  }

  n = h - l + 1;
  List<int> count = List.filled(n, 0);

  // Count frequencies of the numbers
  for (i = b; i < e; ++i) {
    count[list[i] - l]++;
  }

  // Reconstruct a sorted list
  k = b;
  for (i = 0; i < n; ++i) {
    for (j = count[i]; j > 0; --j) {
      list[k++] = l + i;
    }
  }
}

/// Sorts any [list] of items using
/// [counting sort](https://en.wikipedia.org/wiki/Counting_sort) algorithm.
///
/// ## Parameters
///
/// * [list] is any list of integers to be sorted.
/// * [keyOf] is an additional function to get the integer value of the item.
/// * To perform partial sorting, you can specify the [begin] or [end].
/// * [begin] is the start index of the range to be sorted.
/// * If [begin] is negative, range starts at the 0
/// * If [begin] is not below the length of the [list], range will be empty.
/// * [end] is the final index if the range to be sorted. It is exclusive.
/// * If [end] is above the length of the [list], it will be ignored.
/// * If [end] is negative, the absolute value of it will be subtracted
/// from the length of the [list] to determine where the range ends.
/// * If [end] is not greater than the [begin], the range will be empty.
/// * Set [reversed] to `true` if you want to sort in descending order.
///
/// ## Details
///
/// This function wraps the [list] of items with the [keyOf] to generate a list of
/// numbers, which is then passed to [countingSort] for sorting.
///
/// ---------------------------------------------------------------------------
/// Complexity: Time `O(n + k)` | Space `O(n + k)`  (`k` is the range of the keys)
void countingSortOf<E>(
  List<E> list,
  int Function(E) keyOf, {
  int? begin,
  int? end,
  bool reversed = false,
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

  if (b + 1 >= e) return;

  int l, h, m, i, j, k;
  List<int> keys = List.generate(e, (i) => keyOf(list[i]));

  // Find the minimum and maximum numbers in range [b, e)
  l = keys[b];
  h = keys[b];
  for (i = b + 1; i < e; ++i) {
    if (keys[i] < l) {
      l = keys[i];
    }
    if (keys[i] > h) {
      h = keys[i];
    }
  }

  m = h - l + 1;
  List<int> count = List.filled(m, 0);
  List<E> values = List.filled(m, list[b]);

  // Count frequencies of the numbers
  for (i = b; i < e; ++i) {
    count[keys[i] - l]++;
    values[keys[i] - l] = list[i];
  }

  // Reconstruct a sorted list
  k = b;
  for (i = 0; i < m; ++i) {
    for (j = count[i]; j > 0; --j) {
      list[k++] = values[i];
    }
  }

  if (reversed) {
    // reverse the order of the list
    E t;
    i = b;
    j = e - 1;
    for (; i < j; i++, j--) {
      t = list[i];
      list[i] = list[j];
      list[j] = t;
    }
  }
}
