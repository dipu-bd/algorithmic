// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:benchmark/benchmark.dart';
import 'package:algorithmic/algorithmic.dart' as algorithmic;

void main() {
  final int times = 300;
  final int size = 1000;

  group(
    "Linear search in a list of $size numbers",
    () {
      var list = [];
      setUpEach(() {
        list = List<int>.generate(size, (i) => i);
      });

      benchmark('list.indexOf()', () {
        list.indexOf(-1);
      }, iterations: times);
      benchmark('algorithmic.linearSearch()', () {
        algorithmic.linearSearch(list, -1);
      }, iterations: times);
    },
  );

  group(
    "Linear search in a list of $size numbers with a tester",
    () {
      var list = [];
      setUpEach(() {
        list = List<int>.generate(size, (i) => i);
      });

      benchmark('list.indexWhere()', () {
        list.indexWhere((e) => e == -1);
      }, iterations: times);
      benchmark('algorithmic.linearSearchBy()', () {
        algorithmic.linearSearchBy(list, (e) => e == -1);
      }, iterations: times);
    },
  );
}
