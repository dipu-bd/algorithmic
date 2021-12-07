import 'package:benchmark/benchmark.dart';
import 'package:algorithmic/algorithmic.dart' as algorithmic;
import 'package:collection/src/algorithms.dart' as collection;
import 'package:collection/src/utils.dart' show identity, defaultCompare;

void main() {
  int times = 100 * 1000;
  int size = 500 * 1000 * 1000;
  final list = List<int>.generate(size, (i) => i);

  group(
    "Lower bound in a sorted list of $size numbers ($times times)",
    () {
      benchmark('collection.lowerBound()', () {
        for (int i = 1; i <= times; ++i) {
          collection.lowerBound(list, -i);
        }
      });
      benchmark('* algorithmic.lowerBound()', () {
        for (int i = 1; i <= times; ++i) {
          algorithmic.lowerBound(list, -i);
        }
      });
    },
  );

  group(
    "Lower bound in a sorted list of $size numbers with starting offset ($times times)",
    () {
      benchmark('collection.lowerBoundBy()', () {
        for (int i = 1; i <= times; ++i) {
          collection.lowerBoundBy(list, identity, defaultCompare, -1, 100);
        }
      });
      benchmark('* algorithmic.lowerBound()', () {
        for (int i = 1; i <= times; ++i) {
          algorithmic.lowerBound(list, -i, start: 100);
        }
      });
    },
  );

  group(
    "Lower bound in a sorted list of $size numbers with a custom comparator ($times times)",
    () {
      benchmark('collection.lowerBound()', () {
        for (int i = 1; i <= times; ++i) {
          collection.lowerBound(list, -1, compare: (int a, int b) => a - b);
        }
      });
      benchmark('* algorithmic.lowerBound', () {
        for (int i = 1; i <= times; ++i) {
          algorithmic.lowerBound(list, -i, compare: (int a, int b) => a - b);
        }
      });
    },
  );
}
