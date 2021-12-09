// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:benchmark/benchmark.dart';
import 'package:algorithmic/algorithmic.dart' as algorithmic;
import 'package:collection/src/algorithms.dart' as collection;
import '_config.dart';

void main() {
  group(
    "Binary search in a sorted list of $size numbers ($times times)",
    () {
      benchmark('collection.binarySearch()', () {
        for (int i in vals) {
          collection.binarySearch(list, i);
        }
      });
      benchmark('algorithmic.quickBinarySearch()', () {
        for (int i in vals) {
          algorithmic.quickBinarySearch(list, i);
        }
      });
      benchmark('algorithmic.binarySearch()', () {
        for (int i in vals) {
          algorithmic.binarySearch(list, i);
        }
      });
    },
  );

  group(
    "Binary search in a sorted list of $size numbers with a custom comparator ($times times)",
    () {
      final comp = ((int a, int b) => a - b);
      benchmark('collection.binarySearch()', () {
        for (int i in vals) {
          collection.binarySearch(list, i, compare: comp);
        }
      });
      benchmark('algorithmic.quickBinarySearch()', () {
        for (int i in vals) {
          algorithmic.quickBinarySearch(list, i, compare: comp);
        }
      });
      benchmark('algorithmic.binarySearch()', () {
        for (int i in vals) {
          algorithmic.binarySearch(list, i, compare: comp);
        }
      });
    },
  );

}
