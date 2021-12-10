// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:benchmark/benchmark.dart';
import 'package:algorithmic/algorithmic.dart' as algorithmic;

void main() {
  final int times = 250;
  final int size = 1000;

  group(
    "Reversed linear search in a list of $size numbers",
    () {
      var list = [];
      setUpEach(() {
        list = List<int>.generate(size, (i) => i);
      });

      benchmark('list.lastIndexOf()', () {
        list.lastIndexOf(-1);
      }, iterations: times);
      benchmark('algorithmic.linearSearchReversed()', () {
        algorithmic.linearSearchReversed(list, -1);
      }, iterations: times);
    },
  );

  group(
    "Reversed Linear search in a list of $size numbers with a tester",
    () {
      var list = [];
      setUpEach(() {
        list = List<int>.generate(size, (i) => i);
      });

      benchmark('list.lastIndexWhere()', () {
        list.lastIndexWhere((e) => e == -1);
      }, iterations: times);
      benchmark('algorithmic.linearSearchReversedBy()', () {
        algorithmic.linearSearchReversedBy(list, (e) => e == -1);
      }, iterations: times);
    },
  );
}
