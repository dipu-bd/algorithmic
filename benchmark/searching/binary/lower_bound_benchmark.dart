// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:benchmark/benchmark.dart';
import 'package:algorithmic/algorithmic.dart' as algorithmic;
import 'package:collection/src/algorithms.dart' as collection;

void main() {
  final int times = 777 * 1000;
  final int size = 1000 * 1000 * 1000;
  final comp = ((int a, int b) => a - b);
  final original = List<int>.generate(size, (i) => i);

  group("Benchmark lower bound", () {
    group("In a sorted list of $size numbers", () {
      List<int> list = [];
      setUp(() {
        list = original;
      });

      benchmark('collection.lowerBound()', () {
        collection.lowerBound(list, 1);
      }, iterations: times);
      benchmark('algorithmic.lowerBound()', () {
        algorithmic.lowerBound(list, 1);
      }, iterations: times);
    });

    group("In a sorted list of $size numbers with repeated items", () {
      List<int> list = [];
      setUp(() {
        list = original.map((i) => (i * 1000 / size).floor()).toList();
      });

      benchmark('collection.lowerBound()', () {
        collection.lowerBound(list, 1);
      }, iterations: times);
      benchmark('algorithmic.lowerBound()', () {
        algorithmic.lowerBound(list, 1);
      }, iterations: times);
    });

    group("In a sorted list of $size numbers with a custom comparator", () {
      List<int> list = [];
      setUp(() {
        list = original;
      });

      benchmark('collection.lowerBound()', () {
        collection.lowerBound(list, 1, compare: comp);
      }, iterations: times);
      benchmark('algorithmic.lowerBoundBy()', () {
        algorithmic.lowerBound(list, 1, compare: comp);
      }, iterations: times);
    });
  });
}
