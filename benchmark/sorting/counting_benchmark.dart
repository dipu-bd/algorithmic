// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:benchmark/benchmark.dart';
import 'package:algorithmic/algorithmic.dart' as algorithmic;

void main() {
  final int size = 777 * 1000;
  final int times = 7;

  group("Counting sort algorithms benchmark", () {
    group("In a shuffled list of $size numbers", () {
      List<List<int>> general = [];
      List<List<int>> counting = [];
      List<List<int>> countingOf = [];
      setUpAll(() {
        for (int i = 0; i < times; ++i) {
          var list = List<int>.generate(size, (i) => i);
          list.shuffle();
          general.add([...list]);
          counting.add([...list]);
          countingOf.add([...list]);
        }
      });

      benchmark('list.sort()', () {
        for (var list in general) {
          list.sort();
        }
      }, iterations: 1);
      benchmark('algorithmic.countingSort()', () {
        for (var list in counting) {
          algorithmic.countingSort(list);
        }
      }, iterations: 1);
      benchmark('algorithmic.countingSortOf()', () {
        for (var list in counting) {
          algorithmic.countingSortOf<int>(list, (i) => i);
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
      benchmark('algorithmic.countingSort()', () {
        algorithmic.countingSort(list);
      }, iterations: times);
      benchmark('algorithmic.countingSortOf()', () {
        algorithmic.countingSortOf<int>(list, (i) => i);
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
      benchmark('algorithmic.countingSort()', () {
        algorithmic.countingSort(list);
      }, iterations: times);
      benchmark('algorithmic.countingSortOf()', () {
        algorithmic.countingSortOf<int>(list, (i) => i);
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
      benchmark('algorithmic.countingSort()', () {
        algorithmic.countingSort(list);
      }, iterations: times);
      benchmark('algorithmic.countingSortOf()', () {
        algorithmic.countingSortOf<int>(list, (i) => i);
      }, iterations: times);
    });

    group("In an increasing list of $size numbers in reverse order", () {
      List<int> list = [];
      setUpEach(() {
        list = List<int>.generate(size, (i) => i);
      });
      final comp = ((int a, int b) => b - a);

      benchmark('list.sort()', () {
        list.sort(comp);
      }, iterations: times);
      benchmark('algorithmic.countingSort()', () {
        algorithmic.countingSort(list, reversed: true);
      }, iterations: times);
      benchmark('algorithmic.countingSortOf()', () {
        algorithmic.countingSortOf<int>(list, (i) => i, reversed: true);
      }, iterations: times);
    });
  });
}
