// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:benchmark/benchmark.dart';
import 'package:algorithmic/algorithmic.dart' as algorithmic;

void main() {
  final int size = 1000 * 1000;
  final int times = 1;
  final duration = Duration(seconds: 2);

  final sortable = List<int>.generate(size, (i) => i);
  sortable.shuffle();

  group("Benchmark Lomuto Quicksort with different [minItemLimit]", () {
    List<int> list = [];
    setUpEach(() {
      list = [...sortable];
    });

    benchmark('algorithmic.quickSortLomuto(minItemLimit = 0)', () {
      algorithmic.quickSortLomuto(list, minItemLimit: 0);
    }, iterations: times, duration: duration);

    benchmark('algorithmic.quickSortLomuto(minItemLimit = 4)', () {
      algorithmic.quickSortLomuto(list, minItemLimit: 4);
    }, iterations: times, duration: duration);

    benchmark('algorithmic.quickSortLomuto(minItemLimit = 8)', () {
      algorithmic.quickSortLomuto(list, minItemLimit: 8);
    }, iterations: times, duration: duration);

    // benchmark('algorithmic.quickSortLomuto(minItemLimit = 12)', () {
    //   algorithmic.quickSortLomuto(list, minItemLimit: 12);
    // }, iterations: times, duration: duration);

    benchmark('algorithmic.quickSortLomuto(minItemLimit = 16)', () {
      algorithmic.quickSortLomuto(list, minItemLimit: 16);
    }, iterations: times, duration: duration);

    // benchmark('algorithmic.quickSortLomuto(minItemLimit = 24)', () {
    //   algorithmic.quickSortLomuto(list, minItemLimit: 24);
    // }, iterations: times, duration: duration);

    benchmark('algorithmic.quickSortLomuto(minItemLimit = 32)', () {
      algorithmic.quickSortLomuto(list, minItemLimit: 32);
    }, iterations: times, duration: duration);

    // benchmark('algorithmic.quickSortLomuto(minItemLimit = 40)', () {
    //   algorithmic.quickSortLomuto(list, minItemLimit: 40);
    // }, iterations: times, duration: duration);

    // benchmark('algorithmic.quickSortLomuto(minItemLimit = 48)', () {
    //   algorithmic.quickSortLomuto(list, minItemLimit: 48);
    // }, iterations: times, duration: duration);

    benchmark('algorithmic.quickSortLomuto(minItemLimit = 64)', () {
      algorithmic.quickSortLomuto(list, minItemLimit: 64);
    }, iterations: times, duration: duration);
  });
}
