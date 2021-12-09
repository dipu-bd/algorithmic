// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:benchmark/benchmark.dart';
import 'package:algorithmic/algorithmic.dart' as algorithmic;
import '_config.dart';

void main() {
  list.shuffle();
  
  group(
    "Reversed linear search in a shuffled list of $size numbers ($times times)",
    () {
      benchmark('list.lastIndexOf()', () {
        for (int i = 0; i < times; ++i) {
          list.lastIndexOf(-1);
        }
      });
      benchmark('algorithmic.linearSearchReversed()', () {
        for (int i = 0; i < times; ++i) {
          algorithmic.linearSearchReversed(list, -1);
        }
      });
    },
  );

  group(
    "Reversed Linear search in a shuffled list of $size numbers with a custom comparator ($times times)",
    () {
      benchmark('list.lastIndexWhere()', () {
        for (int i = 0; i < times; ++i) {
          list.lastIndexWhere((e) => e == -1);
        }
      });

      benchmark('algorithmic.linearSearchReversedBy()', () {
        for (int i = 0; i < times; ++i) {
          algorithmic.linearSearchReversedBy(list, (e) => e == -1);
        }
      });
    },
  );

}
