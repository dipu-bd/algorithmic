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
    "Lower bound in a sorted list of $size numbers",
    () {
      benchmark('collection.lowerBound()', () {
        collection.lowerBound(list, 1);
      }, iterations: times);
      benchmark('algorithmic.lowerBound()', () {
        algorithmic.lowerBound(list, 1);
      }, iterations: times);
    },
  );

  group(
    "Lower bound in a sorted list of $size numbers with a custom comparator",
    () {
      final comp = ((int a, int b) => a - b);
      benchmark('collection.lowerBound()', () {
        collection.lowerBound(list, 1, compare: comp);
      }, iterations: times);
      benchmark('algorithmic.lowerBoundBy()', () {
        algorithmic.lowerBound(list, 1, compare: comp);
      }, iterations: times);
    },
  );
}
