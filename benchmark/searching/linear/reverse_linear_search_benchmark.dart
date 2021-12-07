import 'package:benchmark/benchmark.dart';
import 'package:algorithmic/algorithmic.dart' as algorithmic;

void main() {
  int size = 10 * 1000 * 1000;
  final list = List<int>.generate(size, (i) => i);
  list.shuffle();

  group(
    "Reversed linear search in a shuffled list of $size numbers",
    () {
      benchmark('list.lastIndexOf()', () {
        list.lastIndexOf(-1);
      });
      benchmark('* algorithmic.linearSearchReversed()', () {
        algorithmic.linearSearchReversed(list, -1);
      });
    },
  );

  group(
    "Reversed linear search in a shuffled list of $size numbers with a start offset",
    () {
      benchmark('list.lastIndexOf()', () {
        list.lastIndexOf(-1, list.length - 100);
      });
      benchmark('* algorithmic.linearSearchReversed()', () {
        algorithmic.linearSearchReversed(list, -1, offset: list.length - 100);
      });
    },
  );

  group(
    "Reversed Linear search in a shuffled list of $size numbers with a custom comparator",
    () {
      benchmark('list.lastIndexWhere()', () {
        list.lastIndexWhere((e) => e == -1);
      });

      benchmark('* algorithmic.linearSearchReversed()', () {
        algorithmic.linearSearchReversed(
          list,
          -1,
          compare: (int a, int b) => a - b,
        );
      });
    },
  );
}
