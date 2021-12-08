import 'package:benchmark/benchmark.dart';
import 'package:algorithmic/algorithmic.dart' as algorithmic;
import '_config.dart';

void main() {
  final list = List<int>.generate(size, (i) => i);
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
    "Linear search in a shuffled list of $size numbers with a start offset ($times times)",
    () {
      benchmark('list.indexOf()', () {
        for (int i = 0; i < times; ++i) {
          list.indexOf(-1, 100);
        }
      });
      benchmark('algorithmic.linearSearch()', () {
        for (int i = 0; i < times; ++i) {
          algorithmic.linearSearch(list, -1, start: 100);
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

  group(
    "Linear search in a shuffled list of $size numbers with a start offset and tester ($times times)",
    () {
      benchmark('list.indexWhere()', () {
        for (int i = 0; i < times; ++i) {
          list.indexWhere((e) => e == -1, 100);
        }
      });

      benchmark('algorithmic.linearSearchBy()', () {
        for (int i = 0; i < times; ++i) {
          algorithmic.linearSearchBy(list, (e) => e == -1, start: 100);
        }
      });
    },
  );
}
