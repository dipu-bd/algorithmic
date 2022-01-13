// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:benchmark/benchmark.dart';
import 'package:algorithmic/algorithmic.dart' as algorithmic;

void main() {
  final int size = 777 * 1000;
  final int times = 7;

  group("In a decreasing list of $size numbers", () {
    List<int> list = [];
    setUpEach(() {
      list = List<int>.generate(size, (i) => -i);
    });

    // benchmark('algorithmic.radixSort(radixPower: 2)', () {
    //   algorithmic.radixSort(list, radixPower: 2);
    // }, iterations: times);
    // benchmark('algorithmic.radixSort(radixPower: 3)', () {
    //   algorithmic.radixSort(list, radixPower: 3);
    // }, iterations: times);
    benchmark('algorithmic.radixSort(radixPower: 4)', () {
      algorithmic.radixSort(list, radixPower: 4);
    }, iterations: times);
    benchmark('algorithmic.radixSort(radixPower: 5)', () {
      algorithmic.radixSort(list, radixPower: 5);
    }, iterations: times);
    benchmark('algorithmic.radixSort(radixPower: 6)', () {
      algorithmic.radixSort(list, radixPower: 6);
    }, iterations: times);
    benchmark('algorithmic.radixSort(radixPower: 7)', () {
      algorithmic.radixSort(list, radixPower: 7);
    }, iterations: times);
    benchmark('algorithmic.radixSort(radixPower: 8)', () {
      algorithmic.radixSort(list, radixPower: 8);
    }, iterations: times);
    benchmark('algorithmic.radixSort(radixPower: 9', () {
      algorithmic.radixSort(list, radixPower: 9);
    }, iterations: times);
    benchmark('algorithmic.radixSort(radixPower: 10', () {
      algorithmic.radixSort(list, radixPower: 10);
    }, iterations: times);
    benchmark('algorithmic.radixSort(radixPower: 11', () {
      algorithmic.radixSort(list, radixPower: 11);
    }, iterations: times);
    benchmark('algorithmic.radixSort(radixPower: 12', () {
      algorithmic.radixSort(list, radixPower: 12);
    }, iterations: times);
    benchmark('algorithmic.radixSort(radixPower: 13', () {
      algorithmic.radixSort(list, radixPower: 13);
    }, iterations: times);
    benchmark('algorithmic.radixSort(radixPower: 14', () {
      algorithmic.radixSort(list, radixPower: 14);
    }, iterations: times);
    // benchmark('algorithmic.radixSort(radixPower: 15', () {
    //   algorithmic.radixSort(list, radixPower: 15);
    // }, iterations: times);
    // benchmark('algorithmic.radixSort(radixPower: 16', () {
    //   algorithmic.radixSort(list, radixPower: 16);
    // }, iterations: times);
  });
}
