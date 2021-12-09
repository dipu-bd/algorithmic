// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:benchmark/benchmark.dart';
import 'package:algorithmic/algorithmic.dart' as algorithmic;
import './_config.dart';

void main() {
  group("Bubble vs Selection sort", () {
    group("In a shuffled list of $size numbers", () {
      final list = List<int>.generate(size, (i) => (i / 10).floor());
      list.shuffle();

      final bubble = [...list];
      final selection = [...list];
      benchmark('algorithmic.bubbleSort()', () {
        algorithmic.bubbleSort(bubble);
      });
      benchmark('algorithmic.selectionSort()', () {
        algorithmic.selectionSort(selection);
      });
    });

    group("In an increasingly sorted list of $size numbers", () {
      final list = List<int>.generate(size, (i) => (i / 10).floor());

      final bubble = [...list];
      final selection = [...list];
      benchmark('algorithmic.bubbleSort()', () {
        algorithmic.bubbleSort(bubble);
      });
      benchmark('algorithmic.selectionSort()', () {
        algorithmic.selectionSort(selection);
      });
    });

    group("In a decreasingly sorted list of $size numbers", () {
      final list = List<int>.generate(size, (i) => -(i / 10).floor());

      final bubble = [...list];
      final selection = [...list];
      benchmark('algorithmic.bubbleSort()', () {
        algorithmic.bubbleSort(bubble);
      });
      benchmark('algorithmic.selectionSort()', () {
        algorithmic.selectionSort(selection);
      });
    });
  });
}
