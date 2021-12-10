// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:benchmark/benchmark.dart';
import 'package:algorithmic/algorithmic.dart' as algorithmic;
import 'package:collection/src/algorithms.dart' as collection;

void main() {
  final int times = 1000;
  final int size = 100 * 1000 * 1000;
  final list = List<int>.generate(size, (i) => i);

  group(
    "Binary search in a sorted list of $size numbers",
    () {
      benchmark('collection.binarySearch()', () {
        collection.binarySearch(list, 1);
      }, iterations: times);
      benchmark('algorithmic.quickBinarySearch()', () {
        algorithmic.binarySearchQuick(list, 1);
      }, iterations: times);
      benchmark('algorithmic.binarySearch()', () {
        algorithmic.binarySearch(list, 1);
      }, iterations: times);
    },
  );

  group(
    "Binary search in a sorted list of $size numbers with a custom comparator",
    () {
      final comp = ((int a, int b) => a - b);
      benchmark('collection.binarySearch()', () {
        collection.binarySearch(list, 1, compare: comp);
      }, iterations: times);
      benchmark('algorithmic.quickBinarySearch()', () {
        algorithmic.binarySearchQuick(list, 1, compare: comp);
      }, iterations: times);
      benchmark('algorithmic.binarySearch()', () {
        algorithmic.binarySearch(list, 1, compare: comp);
      }, iterations: times);
    },
  );
}
