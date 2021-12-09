// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:benchmark/benchmark.dart';
import 'package:algorithmic/algorithmic.dart' as algorithmic;
import './_config.dart';

void main() {
  group("Insertion vs Gnome sort", () {
    group("In a shuffled list of $size numbers", () {
      final list = List<int>.generate(size, (i) => (i / 10).floor());
      list.shuffle();

      final gnome = [...list];
      final insertion = [...list];
      benchmark('algorithmic.gnomeSort()', () {
        algorithmic.gnomeSort(gnome);
      });
      benchmark('algorithmic.insertionSort()', () {
        algorithmic.insertionSort(insertion);
      });
    });

    group("In an increasingly sorted list of $size numbers", () {
      final list = List<int>.generate(size, (i) => (i / 10).floor());

      final gnome = [...list];
      final insertion = [...list];
      benchmark('algorithmic.gnomeSort()', () {
        algorithmic.gnomeSort(gnome);
      });
      benchmark('algorithmic.insertionSort()', () {
        algorithmic.insertionSort(insertion);
      });
    });

    group("In a decreasingly sorted list of $size numbers", () {
      final list = List<int>.generate(size, (i) => -(i / 10).floor());

      final gnome = [...list];
      final insertion = [...list];
      benchmark('algorithmic.gnomeSort()', () {
        algorithmic.gnomeSort(gnome);
      });
      benchmark('algorithmic.insertionSort()', () {
        algorithmic.insertionSort(insertion);
      });
    });
  });
}
