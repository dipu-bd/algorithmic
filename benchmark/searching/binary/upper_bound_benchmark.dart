// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:benchmark/benchmark.dart';
import 'package:algorithmic/algorithmic.dart' as algorithmic;
import '_config.dart';

void main() {
  group(
    "Upper bound in a sorted list of $size numbers ($times times)",
    () {
      benchmark('algorithmic.upperBound()', () {
        for (int i in vals) {
          algorithmic.upperBound(list, i);
        }
      });
    },
  );

  group(
    "Upper bound in a sorted list of $size numbers with a custom comparator ($times times)",
    () {
      benchmark('algorithmic.upperBound()', () {
        for (int i in vals) {
          algorithmic.upperBound(list, i, compare: (int a, int b) => a - b);
        }
      });
    },
  );

}
