// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:benchmark/benchmark.dart';
import 'package:algorithmic/algorithmic.dart' as algorithmic;

void main() {
  group("In a decreasing list of 32 numbers", () {
    final int size = 32;
    final int times = 800;
    List<int> list = [];
    setUpEach(() {
      list = List<int>.generate(size, (i) => -i);
    });

    benchmark('algorithmic.combSort(shrinkFactor: 1.3)', () {
      algorithmic.combSort(list, shrinkFactor: 1.3);
    }, iterations: times);
    benchmark('algorithmic.combSort(shrinkFactor: 1.4)', () {
      algorithmic.combSort(list, shrinkFactor: 1.4);
    }, iterations: times);
    benchmark('algorithmic.combSort(shrinkFactor: 1.6)', () {
      algorithmic.combSort(list, shrinkFactor: 1.6);
    }, iterations: times);
    benchmark('algorithmic.combSort(shrinkFactor: 1.8)', () {
      algorithmic.combSort(list, shrinkFactor: 1.8);
    }, iterations: times);
    benchmark('algorithmic.combSort(shrinkFactor: 2.2)', () {
      algorithmic.combSort(list, shrinkFactor: 2.2);
    }, iterations: times);
    benchmark('algorithmic.combSort(shrinkFactor: 3.2)', () {
      algorithmic.combSort(list, shrinkFactor: 3.2);
    }, iterations: times);
    benchmark('algorithmic.combSort(shrinkFactor: 4)', () {
      algorithmic.combSort(list, shrinkFactor: 4);
    }, iterations: times);
    benchmark('algorithmic.combSort(shrinkFactor: 5)', () {
      algorithmic.combSort(list, shrinkFactor: 5);
    }, iterations: times);
    benchmark('algorithmic.combSort(shrinkFactor: 5.5)', () {
      algorithmic.combSort(list, shrinkFactor: 5.5);
    }, iterations: times);
    benchmark('algorithmic.combSort(shrinkFactor: 6)', () {
      algorithmic.combSort(list, shrinkFactor: 6);
    }, iterations: times);
    benchmark('algorithmic.combSort(shrinkFactor: 8)', () {
      algorithmic.combSort(list, shrinkFactor: 8);
    }, iterations: times);
  });

  group("In a decreasing list of 1000 numbers", () {
    final int size = 1000;
    final int times = 500;
    List<int> list = [];
    setUpEach(() {
      list = List<int>.generate(size, (i) => -i);
    });

    benchmark('algorithmic.combSort(shrinkFactor: 1.3)', () {
      algorithmic.combSort(list, shrinkFactor: 1.3);
    }, iterations: times);
    benchmark('algorithmic.combSort(shrinkFactor: 1.4)', () {
      algorithmic.combSort(list, shrinkFactor: 1.4);
    }, iterations: times);
    benchmark('algorithmic.combSort(shrinkFactor: 1.6)', () {
      algorithmic.combSort(list, shrinkFactor: 1.6);
    }, iterations: times);
    benchmark('algorithmic.combSort(shrinkFactor: 1.8)', () {
      algorithmic.combSort(list, shrinkFactor: 1.8);
    }, iterations: times);
    benchmark('algorithmic.combSort(shrinkFactor: 2.2)', () {
      algorithmic.combSort(list, shrinkFactor: 2.2);
    }, iterations: times);
    benchmark('algorithmic.combSort(shrinkFactor: 3.2)', () {
      algorithmic.combSort(list, shrinkFactor: 3.2);
    }, iterations: times);
    benchmark('algorithmic.combSort(shrinkFactor: 4)', () {
      algorithmic.combSort(list, shrinkFactor: 4);
    }, iterations: times);
    benchmark('algorithmic.combSort(shrinkFactor: 5)', () {
      algorithmic.combSort(list, shrinkFactor: 5);
    }, iterations: times);
    benchmark('algorithmic.combSort(shrinkFactor: 8)', () {
      algorithmic.combSort(list, shrinkFactor: 8);
    }, iterations: times);
  });

  group("In a decreasing list of 3000 numbers", () {
    final int size = 3000;
    final int times = 250;
    List<int> list = [];
    setUpEach(() {
      list = List<int>.generate(size, (i) => -i);
    });

    benchmark('algorithmic.combSort(shrinkFactor: 1.3)', () {
      algorithmic.combSort(list, shrinkFactor: 1.3);
    }, iterations: times);
    benchmark('algorithmic.combSort(shrinkFactor: 1.4)', () {
      algorithmic.combSort(list, shrinkFactor: 1.4);
    }, iterations: times);
    benchmark('algorithmic.combSort(shrinkFactor: 1.6)', () {
      algorithmic.combSort(list, shrinkFactor: 1.6);
    }, iterations: times);
    benchmark('algorithmic.combSort(shrinkFactor: 1.8)', () {
      algorithmic.combSort(list, shrinkFactor: 1.8);
    }, iterations: times);
    benchmark('algorithmic.combSort(shrinkFactor: 2.2)', () {
      algorithmic.combSort(list, shrinkFactor: 2.2);
    }, iterations: times);
    benchmark('algorithmic.combSort(shrinkFactor: 3.2)', () {
      algorithmic.combSort(list, shrinkFactor: 3.2);
    }, iterations: times);
    benchmark('algorithmic.combSort(shrinkFactor: 4)', () {
      algorithmic.combSort(list, shrinkFactor: 4);
    }, iterations: times);
    benchmark('algorithmic.combSort(shrinkFactor: 5)', () {
      algorithmic.combSort(list, shrinkFactor: 5);
    }, iterations: times);
    benchmark('algorithmic.combSort(shrinkFactor: 8)', () {
      algorithmic.combSort(list, shrinkFactor: 8);
    }, iterations: times);
  });
}
