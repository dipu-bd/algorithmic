// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'dart:math';

import '../utils/templates.dart';
import '../utils/list.dart';

/// Sorts a [list] of integer numbers using the
/// [radix sort](https://en.wikipedia.org/wiki/Radix_sort) algorithm
/// with a radix value of `2^p`.
///
/// ## Parameters
///
/// * [list] is any list of integers to be sorted.
/// * [radixPower] is the value of `p` in `2^p` which is used as the radix.
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
/// This algorithm can sort a range of integers without using any comparisons.
/// It is a special form of bucket sort, which distribute elements into buckets
/// according to their radix.
///
/// In this implementation, the value of `2^p` is used as the radix. You can
/// pass a custom value of `p` using [radixPower] parameter. If radix power is 4,
/// the radix would be `2^4`, and there would be 16 buckets in which the numbers
/// can be distributed.
///
/// By default, the [radixPower] is `ceil(log_2(n) / 2)`.
///
/// It starts from the least significant digit, and bit shifts the items according
/// to the current number of iterations and apply a mask of `2^p - 1` to each items
/// to get the bin number they will go into. The list is reconstructed taking the
/// items placed inside the bins one by one from bin 0 to `2^p - 1`.
///
/// ---------------------------------------------------------------------------
/// Complexity: Time `O(n * log_b n)` | Space `O(n * log_b n)` (`b` is the radix)
void radixSort(
  List<int> list, {
  int? begin,
  int? end,
  bool reversed = false,
  int? radixPower,
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

  int p = radixPower ?? (0.5 * log(n) / log(2)).ceil();
  if (p < 1) {
    throw RangeError("Radix power should be at least 2 or above");
  }

  // sorts range `[b, e)` with radix 2^p
  int l, h, i, j, k, m;

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

  int mask = (1 << p) - 1;
  List<List<int>> bin =
      List<List<int>>.generate(mask + 1, (i) => <int>[], growable: false);

  // Put items inside the bin
  for (k = 0; ((h - l) >> k) != 0; k += p) {
    // Put items to bin using the mask
    for (i = b; i < e; i++) {
      m = ((list[i] - l) >> k) & mask;
      bin[m].add(list[i]);
    }

    // Reconstruct the list from bin
    i = b;
    for (m = 0; m <= mask; m++) {
      for (j in bin[m]) {
        list[i++] = j;
      }
      bin[m].clear();
    }
  }

  if (reversed) {
    // reverse the order of the list
    reverseList(list, b, e);
  }
}

/// Sorts any [list] of items using
/// [radix sort](https://en.wikipedia.org/wiki/Radix_sort) algorithm
/// with a radix value of `2^p`.
///
/// ## Parameters
///
/// * [list] is any list of integers to be sorted.
/// * [radixPower] is the value of `p` in `2^p` that is used as the radix.
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
/// This function maps the [list] of items with the [keyOf] to generate a list
/// of numbers. [radixSort] is applied to this list of numbers, and a sorted
/// list is reconstructed with the mapped values from these numbers.
///
/// ---------------------------------------------------------------------------
/// Complexity: Time `O(n * log_b n)` | Space `O(n)` (where, `b` is the radix)
void radixSortOf<E>(
  List<E> list,
  KeyOf<E, int> keyOf, {
  int? begin,
  int? end,
  bool reversed = false,
  int? radixPower,
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

  int p = radixPower ?? (0.5 * log(n) / log(2)).ceil();
  if (p < 1) {
    throw RangeError("Radix power should be at least 2 or above");
  }

  // sorts range `[b, e)` with radix 2^p
  int l, h, i, j, k, m;
  List<int> keys =
      List<int>.generate(e, (i) => keyOf(list[i]), growable: false);

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

  int mask = (1 << p) - 1;
  List<List<E>> valueBins =
      List<List<E>>.generate(mask + 1, (i) => <E>[], growable: false);
  List<List<int>> keyBins =
      List<List<int>>.generate(mask + 1, (i) => <int>[], growable: false);

  // Put items inside the bin
  for (k = 0; ((h - l) >> k) != 0; k += p) {
    // Put items to bin using the mask
    for (i = b; i < e; i++) {
      m = ((keys[i] - l) >> k) & mask;
      keyBins[m].add(keys[i]);
      valueBins[m].add(list[i]);
    }

    // Reconstruct the list from bin
    i = b;
    for (m = 0; m <= mask; m++) {
      for (j = 0; j < keyBins[m].length; ++j) {
        keys[i] = keyBins[m][j];
        list[i] = valueBins[m][j];
        i++;
      }
      keyBins[m].clear();
      valueBins[m].clear();
    }
  }

  if (reversed) {
    // reverse the order of the list
    reverseList(list, b, e);
  }
}
