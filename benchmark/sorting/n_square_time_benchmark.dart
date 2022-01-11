// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:algorithmic/algorithmic.dart' as algorithmic;
import 'package:benchmark/benchmark.dart';

void main() {
  final int size = 32;
  final int times = 777;

  group("Benchmark sort algorithms with small list of integers", () {
    group("In a shuffled list of $size numbers", () {
      List<List<int>> general = [];
      List<List<int>> gnome = [];
      List<List<int>> insertion = [];
      List<List<int>> bubble = [];
      List<List<int>> selection = [];
      List<List<int>> cocktail = [];
      List<List<int>> comb = [];
      setUpAll(() {
        for (int i = 0; i < times; ++i) {
          var list = List<int>.generate(size, (i) => i);
          list.shuffle();
          general.add([...list]);
          gnome.add([...list]);
          insertion.add([...list]);
          bubble.add([...list]);
          selection.add([...list]);
          cocktail.add([...list]);
          comb.add([...list]);
        }
      });

      benchmark('list.sort()', () {
        for (var list in general) {
          list.sort();
        }
      }, iterations: 1);
      benchmark('algorithmic.cocktailShakerSort()', () {
        for (var list in selection) {
          algorithmic.cocktailShakerSort(list);
        }
      }, iterations: 1);
      benchmark('algorithmic.gnomeSort()', () {
        for (var list in gnome) {
          algorithmic.gnomeSort(list);
        }
      }, iterations: 1);
      benchmark('algorithmic.insertionSort()', () {
        for (var list in insertion) {
          algorithmic.insertionSort(list);
        }
      }, iterations: 1);
      benchmark('algorithmic.combSort()', () {
        for (var list in insertion) {
          algorithmic.combSort(list);
        }
      }, iterations: 1);
      benchmark('algorithmic.selectionSort()', () {
        for (var list in selection) {
          algorithmic.selectionSort(list);
        }
      }, iterations: 1);
      benchmark('algorithmic.bubbleSort()', () {
        for (var list in bubble) {
          algorithmic.bubbleSort(list);
        }
      }, iterations: 1);
    });

    group("In an increasing list of $size numbers", () {
      List<int> list = [];
      setUpEach(() {
        list = List<int>.generate(size, (i) => i);
      });

      benchmark('list.sort()', () {
        list.sort();
      }, iterations: times);
      benchmark('algorithmic.cocktailShakerSort()', () {
        algorithmic.cocktailShakerSort(list);
      }, iterations: times);
      benchmark('algorithmic.gnomeSort()', () {
        algorithmic.gnomeSort(list);
      }, iterations: times);
      benchmark('algorithmic.insertionSort()', () {
        algorithmic.insertionSort(list);
      }, iterations: times);
      benchmark('algorithmic.combSort()', () {
        algorithmic.combSort(list);
      }, iterations: times);
      benchmark('algorithmic.selectionSort()', () {
        algorithmic.selectionSort(list);
      }, iterations: times);
      benchmark('algorithmic.bubbleSort()', () {
        algorithmic.bubbleSort(list);
      }, iterations: times);
    });

    group("In a decreasing list of $size numbers", () {
      List<int> list = [];
      setUpEach(() {
        list = List<int>.generate(size, (i) => -i);
      });

      benchmark('list.sort()', () {
        list.sort();
      }, iterations: times);
      benchmark('algorithmic.cocktailShakerSort()', () {
        algorithmic.cocktailShakerSort(list);
      }, iterations: times);
      benchmark('algorithmic.gnomeSort()', () {
        algorithmic.gnomeSort(list);
      }, iterations: times);
      benchmark('algorithmic.insertionSort()', () {
        algorithmic.insertionSort(list);
      }, iterations: times);
      benchmark('algorithmic.combSort()', () {
        algorithmic.combSort(list);
      }, iterations: times);
      benchmark('algorithmic.selectionSort()', () {
        algorithmic.selectionSort(list);
      }, iterations: times);
      benchmark('algorithmic.bubbleSort()', () {
        algorithmic.bubbleSort(list);
      }, iterations: times);
    });

    group("In a list of $size numbers with 4 repetead elements", () {
      List<int> list = [];
      setUpEach(() {
        list = List<int>.generate(size, (i) => (i * 4 / size).floor());
      });

      benchmark('list.sort()', () {
        list.sort();
      }, iterations: times);
      benchmark('algorithmic.cocktailShakerSort()', () {
        algorithmic.cocktailShakerSort(list);
      }, iterations: times);
      benchmark('algorithmic.gnomeSort()', () {
        algorithmic.gnomeSort(list);
      }, iterations: times);
      benchmark('algorithmic.insertionSort()', () {
        algorithmic.insertionSort(list);
      }, iterations: times);
      benchmark('algorithmic.combSort()', () {
        algorithmic.combSort(list);
      }, iterations: times);
      benchmark('algorithmic.selectionSort()', () {
        algorithmic.selectionSort(list);
      }, iterations: times);
      benchmark('algorithmic.bubbleSort()', () {
        algorithmic.bubbleSort(list);
      }, iterations: times);
    });

    group("In an increasing list of $size numbers with a custom compare", () {
      List<int> list = [];
      setUpEach(() {
        list = List<int>.generate(size, (i) => i);
      });
      final comp = ((int a, int b) => b - a);

      benchmark('list.sort()', () {
        list.sort(comp);
      }, iterations: times);
      benchmark('algorithmic.cocktailShakerSort()', () {
        algorithmic.cocktailShakerSort(list);
      }, iterations: times);
      benchmark('algorithmic.gnomeSort()', () {
        algorithmic.gnomeSort(list, compare: comp);
      }, iterations: times);
      benchmark('algorithmic.insertionSort()', () {
        algorithmic.insertionSort(list, compare: comp);
      }, iterations: times);
      benchmark('algorithmic.combSort()', () {
        algorithmic.combSort(list);
      }, iterations: times);
      benchmark('algorithmic.selectionSort()', () {
        algorithmic.selectionSort(list, compare: comp);
      }, iterations: times);
      benchmark('algorithmic.bubbleSort()', () {
        algorithmic.bubbleSort(list, compare: comp);
      }, iterations: times);
    });
  });
}
