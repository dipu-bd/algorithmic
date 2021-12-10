// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:benchmark/benchmark.dart';
import 'package:algorithmic/algorithmic.dart' as algorithmic;

void main() {
  final int times = 1000;
  final int size = 100 * 1000 * 1000;
  final list = List<int>.generate(size, (i) => i);

  group(
    "Binary search (upper) in a sorted list of $size numbers",
    () {
      benchmark('algorithmic.binarySearchUpper()', () {
        algorithmic.binarySearchUpper(list, 1);
      }, iterations: times);
    },
  );

  group(
    "Binary search (upper) in a sorted list of $size numbers with a custom comparator",
    () {
      final comp = ((int a, int b) => a - b);
      benchmark('algorithmic.binarySearchUpper()', () {
        algorithmic.binarySearchUpper(list, 1, compare: comp);
      }, iterations: times);
    },
  );

  group(
    "Binary search (quick) in a sorted list of $size numbers",
    () {
      benchmark('algorithmic.binarySearchQuick()', () {
        algorithmic.binarySearchQuick(list, 1);
      }, iterations: times);
    },
  );

  group(
    "Binary search (quick) in a sorted list of $size numbers with a custom comparator",
    () {
      final comp = ((int a, int b) => a - b);
      benchmark('algorithmic.binarySearchQuick()', () {
        algorithmic.binarySearchQuick(list, 1, compare: comp);
      }, iterations: times);
    },
  );
}
