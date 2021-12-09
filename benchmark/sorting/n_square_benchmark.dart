import 'package:benchmark/benchmark.dart';
import 'package:algorithmic/algorithmic.dart' as algorithmic;
import '_config.dart';

void main() {
  group("Algorithms with O(n^2) time complexity", () {
    group(
      "In a shuffled list of $size numbers",
      () {
        final list = List<int>.generate(size, (i) => i);
        list.shuffle();

        final bubble = [...list];
        final gnome = [...list];
        final insertion = [...list];
        final selection = [...list];
        benchmark('algorithmic.bubbleSort()', () {
          algorithmic.bubbleSort(bubble);
        });
        benchmark('algorithmic.gnomeSort()', () {
          algorithmic.gnomeSort(gnome);
        });
        benchmark('algorithmic.insertionSort()', () {
          algorithmic.insertionSort(insertion);
        });
        benchmark('algorithmic.selectionSort()', () {
          algorithmic.selectionSort(selection);
        });
      },
    );

    group(
      "In an increasingly sorted list of $size numbers",
      () {
        final list = List<int>.generate(size, (i) => i);

        final bubble = [...list];
        final gnome = [...list];
        final insertion = [...list];
        final selection = [...list];
        benchmark('algorithmic.bubbleSort()', () {
          algorithmic.bubbleSort(bubble);
        });
        benchmark('algorithmic.gnomeSort()', () {
          algorithmic.gnomeSort(gnome);
        });
        benchmark('algorithmic.insertionSort()', () {
          algorithmic.insertionSort(insertion);
        });
        benchmark('algorithmic.selectionSort()', () {
          algorithmic.selectionSort(selection);
        });
      },
    );

    group(
      "In a decreasingly sorted list of $size numbers",
      () {
        final list = List<int>.generate(size, (i) => size - i);

        final bubble = [...list];
        final gnome = [...list];
        final insertion = [...list];
        final selection = [...list];
        benchmark('algorithmic.bubbleSort()', () {
          algorithmic.bubbleSort(bubble);
        });
        benchmark('algorithmic.gnomeSort()', () {
          algorithmic.gnomeSort(gnome);
        });
        benchmark('algorithmic.insertionSort()', () {
          algorithmic.insertionSort(insertion);
        });
        benchmark('algorithmic.selectionSort()', () {
          algorithmic.selectionSort(selection);
        });
      },
    );
  });
}
