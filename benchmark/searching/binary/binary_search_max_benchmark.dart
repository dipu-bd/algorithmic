// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:benchmark/benchmark.dart';
import 'package:algorithmic/algorithmic.dart' as algorithmic;
import '_config.dart';

void main() {
  group(
    "Binary search (maximum index) in a sorted list of $size numbers ($times times)",
    () {
      benchmark('algorithmic.binarySearchMax()', () {
        for (int i in vals) {
          algorithmic.binarySearchMax(list, i);
        }
      });
    },
  );

  group(
    "Binary search (maximum index) in a sorted list of $size numbers with a custom comparator ($times times)",
    () {
      benchmark('algorithmic.binarySearchMax()', () {
        for (int i in vals) {
          algorithmic.binarySearchMax(list, i,
              compare: (int a, int b) => a - b);
        }
      });
    },
  );
}
