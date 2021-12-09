import 'package:benchmark/benchmark.dart';
import 'package:algorithmic/algorithmic.dart' as algorithmic;
import '_config.dart';

void main() {
  final list = List<int>.generate(size, (i) => i);

  group(
    "Binary search (maximum index) in a sorted list of $size numbers ($times times)",
    () {
      benchmark('algorithmic.binarySearchMax()', () {
        for (int i = 1; i <= times; ++i) {
          algorithmic.binarySearchMax(list, -i);
        }
      });
    },
  );

  group(
    "Binary search (maximum index) in a sorted list of $size numbers with starting offset ($times times)",
    () {
      benchmark('algorithmic.binarySearchMax()', () {
        for (int i = 1; i <= times; ++i) {
          algorithmic.binarySearchMax(list, -i, start: 100);
        }
      });
    },
  );

  group(
    "Binary search (maximum index) in a sorted list of $size numbers with a custom comparator ($times times)",
    () {
      benchmark('algorithmic.binarySearchMax()', () {
        for (int i = 1; i <= times; ++i) {
          algorithmic.binarySearchMax(list, -1, compare: (int a, int b) => a - b);
        }
      });
    },
  );

  group(
    "Binary search (maximum index) in a sorted list of $size numbers with starting offset and custom comparator ($times times)",
    () {
      benchmark('algorithmic.binarySearchMax()', () {
        for (int i = 1; i <= times; ++i) {
          algorithmic.binarySearchMax(list, -1,
              compare: (int a, int b) => a - b, start: 100);
        }
      });
    },
  );
}
