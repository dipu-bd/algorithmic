// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:benchmark/benchmark.dart';
import 'package:algorithmic/algorithmic.dart' as algorithmic;

void main() {
  final int size = 100 * 1000;
  final int times = 100;
  final duration = Duration(seconds: 2);

  final sortable = List<int>.generate(size, (i) => i);
  sortable.shuffle();

  group("Benchmark Lomuto Quicksort with different [threshold]", () {
    List<int> list = [];
    setUpEach(() {
      list = [...sortable];
    });

    benchmark('algorithmic.quickSortHaore(threshold = 0)', () {
      algorithmic.quickSortHaore(list, threshold: 0);
    }, iterations: times, duration: duration);

    benchmark('algorithmic.quickSortHaore(threshold = 4)', () {
      algorithmic.quickSortHaore(list, threshold: 4);
    }, iterations: times, duration: duration);

    benchmark('algorithmic.quickSortHaore(threshold = 8)', () {
      algorithmic.quickSortHaore(list, threshold: 8);
    }, iterations: times, duration: duration);

    // benchmark('algorithmic.quickSortHaore(threshold = 12)', () {
    //   algorithmic.quickSortHaore(list, threshold: 12);
    // }, iterations: times, duration: duration);

    benchmark('algorithmic.quickSortHaore(threshold = 16)', () {
      algorithmic.quickSortHaore(list, threshold: 16);
    }, iterations: times, duration: duration);

    // benchmark('algorithmic.quickSortHaore(threshold = 24)', () {
    //   algorithmic.quickSortHaore(list, threshold: 24);
    // }, iterations: times, duration: duration);

    benchmark('algorithmic.quickSortHaore(threshold = 32)', () {
      algorithmic.quickSortHaore(list, threshold: 32);
    }, iterations: times, duration: duration);

    // benchmark('algorithmic.quickSortHaore(threshold = 40)', () {
    //   algorithmic.quickSortHaore(list, threshold: 40);
    // }, iterations: times, duration: duration);

    benchmark('algorithmic.quickSortHaore(threshold = 48)', () {
      algorithmic.quickSortHaore(list, threshold: 48);
    }, iterations: times, duration: duration);

    benchmark('algorithmic.quickSortHaore(threshold = 64)', () {
      algorithmic.quickSortHaore(list, threshold: 64);
    }, iterations: times, duration: duration);
  });
}
