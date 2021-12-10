// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:benchmark/benchmark.dart';
import 'package:algorithmic/algorithmic.dart' as algorithmic;
import '_config.dart';

void main() {
  list.shuffle();

  group(
    "Linear search in a shuffled list of $size numbers ($times times)",
    () {
      benchmark('list.indexOf()', () {
        for (int i = 0; i < times; ++i) {
          list.indexOf(-1);
        }
      });
      benchmark('algorithmic.linearSearch()', () {
        for (int i = 0; i < times; ++i) {
          algorithmic.linearSearch(list, -1);
        }
      });
    },
  );

  group(
    "Linear search in a shuffled list of $size numbers with a tester ($times times)",
    () {
      benchmark('list.indexWhere()', () {
        for (int i = 0; i < times; ++i) {
          list.indexWhere((e) => e == -1);
        }
      });

      benchmark('algorithmic.linearSearchBy()', () {
        for (int i = 0; i < times; ++i) {
          algorithmic.linearSearchBy(list, (e) => e == -1);
        }
      });
    },
  );
}
