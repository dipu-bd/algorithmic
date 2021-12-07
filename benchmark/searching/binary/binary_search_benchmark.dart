import 'package:benchmark/benchmark.dart';
import 'package:algorithmic/algorithmic.dart' as algorithmic;
import 'package:collection/src/algorithms.dart' as collection;
import 'package:collection/src/utils.dart' show identity, defaultCompare;

void main() {
  int times = 100 * 1000;
  int size = 500 * 1000 * 1000;
  final list = List<int>.generate(size, (i) => i);

  group(
    "Binary search in a sorted list of $size numbers ($times times)",
    () {
      benchmark('collection.binarySearch()', () {
        for (int i = 1; i <= times; ++i) {
          collection.binarySearch(list, -i);
        }
      });
      benchmark('* algorithmic.binarySearch()', () {
        for (int i = 1; i <= times; ++i) {
          algorithmic.binarySearch(list, -i);
        }
      });
    },
  );

  group(
    "Binary search in a sorted list of $size numbers with starting offset ($times times)",
    () {
      benchmark('collection.binarySearchBy()', () {
        for (int i = 1; i <= times; ++i) {
          collection.binarySearchBy(list, identity, defaultCompare, -1, 100);
        }
      });
      benchmark('* algorithmic.binarySearch()', () {
        for (int i = 1; i <= times; ++i) {
          algorithmic.binarySearch(list, -i, offset: 100);
        }
      });
    },
  );

  group(
    "Binary search in a sorted list of $size numbers with a custom comparator ($times times)",
    () {
      benchmark('collection.binarySearch()', () {
        for (int i = 1; i <= times; ++i) {
          collection.binarySearch(list, -1, compare: (int a, int b) => a - b);
        }
      });
      benchmark('* algorithmic.binarySearch', () {
        for (int i = 1; i <= times; ++i) {
          algorithmic.binarySearch(list, -i, compare: (int a, int b) => a - b);
        }
      });
    },
  );
}
