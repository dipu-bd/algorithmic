// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:benchmark/benchmark.dart';
import 'package:algorithmic/algorithmic.dart' as algorithmic;

void main() {
  final int size = 777 * 1000;
  final int times = 7;

  group("Mergesort algorithms benchmark", () {
    group("In a shuffled list of $size numbers", () {
      List<List<int>> general = [];
      List<List<int>> merge = [];
      setUpAll(() {
        for (int i = 0; i < times; ++i) {
          var list = List<int>.generate(size, (i) => i);
          list.shuffle();
          general.add([...list]);
          merge.add([...list]);
        }
      });

      benchmark('list.sort()', () {
        for (var list in general) {
          list.sort();
        }
      }, iterations: 1);
      benchmark('algorithmic.mergeSort()', () {
        for (var list in merge) {
          algorithmic.mergeSort(list);
        }
      }, iterations: 1);
    });

    group("In an increasing list of $size numbers", () {
      List<int> list = [];
      setUpEach(() {
        list = List<int>.generate(size, (i) => i);
      });

      benchmark('list.sort()', () {
        list.sort();
      }, iterations: times);
      benchmark('algorithmic.mergeSort()', () {
        algorithmic.mergeSort(list);
      }, iterations: times);
    });

    group("In a decreasing list of $size numbers", () {
      List<int> list = [];
      setUpEach(() {
        list = List<int>.generate(size, (i) => -i);
      });

      benchmark('list.sort()', () {
        list.sort();
      }, iterations: times);
      benchmark('algorithmic.mergeSort()', () {
        algorithmic.mergeSort(list);
      }, iterations: times);
    });

    group("In a list of $size numbers with 1000 repetead elements", () {
      List<int> list = [];
      setUpEach(() {
        list = List<int>.generate(size, (i) => (i * 1000 / size).floor());
      });

      benchmark('list.sort()', () {
        list.sort();
      }, iterations: times);
      benchmark('algorithmic.mergeSort()', () {
        algorithmic.mergeSort(list);
      }, iterations: times);
    });

    group("In an increasing list of $size numbers with a custom compare", () {
      List<int> list = [];
      setUpEach(() {
        list = List<int>.generate(size, (i) => i);
      });
      final comp = ((int a, int b) => b - a);

      benchmark('list.sort()', () {
        list.sort(comp);
      }, iterations: times);
      benchmark('algorithmic.mergeSort()', () {
        algorithmic.mergeSort(list, compare: comp);
      }, iterations: times);
    });
  });
}
