import 'package:benchmark/benchmark.dart';
import 'package:algorithmic/algorithmic.dart' as algorithmic;

void main() {
  final int size = 10 * 1000;

  group(
    "Selection vs bubble sort in a shuffled list of $size numbers",
    () {
      final list = List<int>.generate(size, (i) => i);
      list.shuffle();
      final selection = [...list];
      final bubble = [...list];
      benchmark('algorithmic.selectionSort()', () {
        algorithmic.selectionSort(selection);
      });
      benchmark('algorithmic.bubbleSort()', () {
        algorithmic.bubbleSort(bubble);
      });
    },
  );

  group(
    "Selection vs bubble sort in an increasingly sorted list of $size numbers",
    () {
      final list = List<int>.generate(size, (i) => i);
      final selection = [...list];
      final bubble = [...list];
      benchmark('algorithmic.selectionSort()', () {
        algorithmic.selectionSort(selection);
      });
      benchmark('algorithmic.bubbleSort()', () {
        algorithmic.bubbleSort(bubble);
      });
    },
  );

  group(
    "Selection vs bubble sort in a decreasingly sorted list of $size numbers",
    () {
      final list = List<int>.generate(size, (i) => size - i);
      final selection = [...list];
      final bubble = [...list];
      benchmark('algorithmic.selectionSort()', () {
        algorithmic.selectionSort(selection);
      });
      benchmark('algorithmic.bubbleSort()', () {
        algorithmic.bubbleSort(bubble);
      });
    },
  );
}
