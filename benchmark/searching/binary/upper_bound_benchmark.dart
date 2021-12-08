import 'package:benchmark/benchmark.dart';
import 'package:algorithmic/algorithmic.dart' as algorithmic;
import '_config.dart';

void main() {
  final list = List<int>.generate(size, (i) => i);

  group(
    "Upper bound in a sorted list of $size numbers ($times times)",
    () {
      benchmark('algorithmic.upperBound()', () {
        for (int i = 1; i <= times; ++i) {
          algorithmic.upperBound(list, -i);
        }
      });
    },
  );

  group(
    "Upper bound in a sorted list of $size numbers with starting offset ($times times)",
    () {
      benchmark('algorithmic.upperBound()', () {
        for (int i = 1; i <= times; ++i) {
          algorithmic.upperBound(list, -i, start: 100);
        }
      });
    },
  );

  group(
    "Upper bound in a sorted list of $size numbers with a custom comparator ($times times)",
    () {
      benchmark('algorithmic.upperBound()', () {
        for (int i = 1; i <= times; ++i) {
          algorithmic.upperBound(list, -1, compare: (int a, int b) => a - b);
        }
      });
    },
  );

  group(
    "Upper bound in a sorted list of $size numbers with starting offset and custom comparator ($times times)",
    () {
      benchmark('algorithmic.upperBound()', () {
        for (int i = 1; i <= times; ++i) {
          algorithmic.upperBound(list, -1,
              compare: (int a, int b) => a - b, start: 100);
        }
      });
    },
  );
}
