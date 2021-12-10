// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:benchmark/benchmark.dart';
import 'package:algorithmic/algorithmic.dart' as algorithmic;
import 'package:collection/src/algorithms.dart' as collection;
import '_config.dart';

void main() {
  group(
    "Lower bound in a sorted list of $size numbers ($times times)",
    () {
      benchmark('collection.lowerBound()', () {
        for (int i in vals) {
          collection.lowerBound(list, i);
        }
      });
      benchmark('algorithmic.lowerBound()', () {
        for (int i in vals) {
          algorithmic.lowerBound(list, i);
        }
      });
    },
  );

  group(
    "Lower bound in a sorted list of $size numbers with a custom comparator ($times times)",
    () {
      benchmark('collection.lowerBound()', () {
        for (int i in vals) {
          collection.lowerBound(list, i, compare: (int a, int b) => a - b);
        }
      });
      benchmark('algorithmic.lowerBoundBy()', () {
        for (int i in vals) {
          algorithmic.lowerBound(list, i, compare: (int a, int b) => a - b);
        }
      });
    },
  );
}
