// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:benchmark/benchmark.dart';
import 'package:algorithmic/algorithmic.dart' as algorithmic;

void main() {
  final int size = 32;
  final int times = 1000;

  group("Benchmark O(n^2) algorithms with small list of integers", () {
    group("In a shuffled list of $size numbers", () {
      var list = [];
      setUpEach(() {
        list = List<int>.generate(size, (i) => i);
        list.shuffle();
      });

      benchmark('list.sort()', () {
        list.sort();
      }, iterations: times);
      benchmark('algorithmic.gnomeSort()', () {
        algorithmic.gnomeSort(list);
      }, iterations: times);
      benchmark('algorithmic.insertionSort()', () {
        algorithmic.insertionSort(list);
      }, iterations: times);
      benchmark('algorithmic.bubbleSort()', () {
        algorithmic.bubbleSort(list);
      }, iterations: times);
      benchmark('algorithmic.selectionSort()', () {
        algorithmic.bubbleSort(list);
      }, iterations: times);
    });

    group("In an increasing list of $size numbers", () {
      var list = [];
      setUpEach(() {
        list = List<int>.generate(size, (i) => i);
      });

      benchmark('list.sort()', () {
        list.sort();
      }, iterations: times);
      benchmark('algorithmic.gnomeSort()', () {
        algorithmic.gnomeSort(list);
      }, iterations: times);
      benchmark('algorithmic.insertionSort()', () {
        algorithmic.insertionSort(list);
      }, iterations: times);
      benchmark('algorithmic.bubbleSort()', () {
        algorithmic.bubbleSort(list);
      }, iterations: times);
      benchmark('algorithmic.selectionSort()', () {
        algorithmic.bubbleSort(list);
      }, iterations: times);
    });

    group("In a decreasing list of $size numbers", () {
      var list = [];
      setUpEach(() {
        list = List<int>.generate(size, (i) => -i);
      });

      benchmark('list.sort()', () {
        list.sort();
      }, iterations: times);
      benchmark('algorithmic.gnomeSort()', () {
        algorithmic.gnomeSort(list);
      }, iterations: times);
      benchmark('algorithmic.insertionSort()', () {
        algorithmic.insertionSort(list);
      }, iterations: times);
      benchmark('algorithmic.bubbleSort()', () {
        algorithmic.bubbleSort(list);
      }, iterations: times);
      benchmark('algorithmic.selectionSort()', () {
        algorithmic.bubbleSort(list);
      }, iterations: times);
    });
  });
}
