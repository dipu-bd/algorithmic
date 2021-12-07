import 'package:benchmark/benchmark.dart';
import 'package:algorithmic/algorithmic.dart' as algorithmic;

void main() {
  int size = 10 * 1000 * 1000;
  final list = List<int>.generate(size, (i) => i);
  list.shuffle();

  group(
    "Linear search in a shuffled list of $size numbers",
    () {
      benchmark('list.indexOf()', () {
        list.indexOf(-1);
      });
      benchmark('* algorithmic.linearSearch()', () {
        algorithmic.linearSearch(list, -1);
      });
    },
  );

  group(
    "Linear search in a shuffled list of $size numbers with a start offset",
    () {
      benchmark('list.indexOf()', () {
        list.indexOf(-1, 100);
      });
      benchmark('* algorithmic.linearSearch()', () {
        algorithmic.linearSearch(list, -1, offset: 100);
      });
    },
  );

  group(
    "Linear search in a shuffled list of $size numbers with a custom comparator",
    () {
      benchmark('list.indexWhere()', () {
        list.indexWhere((e) => e == -1);
      });

      benchmark('* algorithmic.linearSearch()', () {
        algorithmic.linearSearch(list, -1, compare: (int a, int b) => a - b);
      });
    },
  );
}
