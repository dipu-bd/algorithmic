import 'package:benchmark/benchmark.dart';
import 'package:algorithmic/algorithmic.dart' as algorithmic;

void main() {
  final int size = 15 * 1000;

  group(
    "Selection sort in a shuffled list of $size numbers",
    () {
      final list = List<int>.generate(size, (i) => i);
      list.shuffle();
      benchmark('algorithmic.linearSearch()', () {
        algorithmic.selectionSort(list);
      });
    },
  );

  group(
    "Selection sort in an increasingly sorted list of $size numbers",
    () {
      final list = List<int>.generate(size, (i) => i);
      benchmark('algorithmic.linearSearch()', () {
        algorithmic.selectionSort(list);
      });
    },
  );

  group(
    "Selection sort in a decreasingly sorted list of $size numbers",
    () {
      final list = List<int>.generate(size, (i) => size - i);
      benchmark('algorithmic.linearSearch()', () {
        algorithmic.selectionSort(list);
      });
    },
  );
}
