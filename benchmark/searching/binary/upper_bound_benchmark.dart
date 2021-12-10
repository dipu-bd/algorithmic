// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:benchmark/benchmark.dart';
import 'package:algorithmic/algorithmic.dart' as algorithmic;

void main() {
  final int times = 2000;
  final int size = 100 * 1000 * 1000;
  final comp = ((int a, int b) => a - b);

  group("Benchmark upper bound", () {
    group("In a sorted list of $size numbers", () {
      List<int> list = [];
      setUp(() {
        list = List<int>.generate(size, (i) => i);
      });

      benchmark('algorithmic.upperBound()', () {
        algorithmic.upperBound(list, 1);
      }, iterations: times);
    });

    group("In a sorted list of $size numbers with repeated items", () {
      List<int> list = [];
      setUp(() {
        list = List<int>.generate(size, (i) => (i * 1000 / size).floor());
      });

      benchmark('algorithmic.upperBound()', () {
        algorithmic.upperBound(list, 1, compare: comp);
      }, iterations: times);
    });

    group("In a sorted list of $size numbers with a custom comparator", () {
      List<int> list = [];
      setUp(() {
        list = List<int>.generate(size, (i) => i);
      });

      benchmark('algorithmic.upperBound()', () {
        algorithmic.upperBound(list, 1);
      }, iterations: times);
    });
  });
}
