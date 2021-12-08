import 'package:benchmark/benchmark.dart';
import 'package:algorithmic/algorithmic.dart' as algorithmic;
import '_config.dart';

void main() {
  final list = List<int>.generate(size, (i) => i);
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
    "Reversed linear search in a shuffled list of $size numbers with a start offset ($times times)",
    () {
      benchmark('list.lastIndexOf()', () {
        for (int i = 0; i < times; ++i) {
          list.lastIndexOf(-1, list.length - 100);
        }
      });
      benchmark('algorithmic.linearSearchReversed()', () {
        for (int i = 0; i < times; ++i) {
          algorithmic.linearSearchReversed(list, -1, start: list.length - 100);
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

  group(
    "Reversed Linear search in a shuffled list of $size numbers with start offset and custom comparator ($times times)",
    () {
      benchmark('list.lastIndexWhere()', () {
        for (int i = 0; i < times; ++i) {
          list.lastIndexWhere((e) => e == -1, list.length - 100);
        }
      });

      benchmark('algorithmic.linearSearchReversedBy()', () {
        for (int i = 0; i < times; ++i) {
          algorithmic.linearSearchReversedBy(list, (e) => e == -1,
              start: list.length - 100);
        }
      });
    },
  );
}
