// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:algorithmic/algorithmic.dart' as algorithmic;
import 'package:benchmark/benchmark.dart';
import 'package:edit_distance/edit_distance.dart' as edit_distance;

void main() {
  group("Two lists of 777000 items each", () {
    final size = 777000;
    final times = 10;

    List<int> _source = [];
    List<int> _target = [];
    String source = "";
    String target = "";
    setUpAll(() {
      _source = List<int>.generate(size, (i) => i % 255);
      _target = [..._source];
      _target.shuffle();
      source = String.fromCharCodes(_source);
      target = String.fromCharCodes(_target);
    });

    benchmark('edit_distance.Jaccard().distance()', () {
      edit_distance.Jaccard(ngram: 1).distance(source, target);
    }, iterations: times);
    benchmark('algorithmic.jaccardDistanceOf()', () {
      algorithmic.jaccardDistanceOf(source, target);
    }, iterations: times);
    benchmark('algorithmic.jaccardIndexOf()', () {
      algorithmic.jaccardIndexOf(source, target);
    }, iterations: times);
    benchmark('algorithmic.diceIndexOf()', () {
      algorithmic.diceIndexOf(source, target);
    }, iterations: times);
    benchmark('algorithmic.tverskyIndex()', () {
      algorithmic.tverskyIndexOf(source, target);
    }, iterations: times);
  });

  group("Two lists of 77 items each", () {
    final size = 77;
    final times = 100;

    List<int> _source = [];
    List<int> _target = [];
    String source = "";
    String target = "";
    setUpAll(() {
      _source = List<int>.generate(size, (i) => i % 255);
      _target = [..._source];
      _target.shuffle();
      source = String.fromCharCodes(_source);
      target = String.fromCharCodes(_target);
    });

    benchmark('edit_distance.Jaccard().distance()', () {
      edit_distance.Jaccard(ngram: 1).distance(source, target);
    }, iterations: times);
    benchmark('algorithmic.jaccardDistanceOf()', () {
      algorithmic.jaccardDistanceOf(source, target);
    }, iterations: times);
    benchmark('algorithmic.jaccardIndexOf()', () {
      algorithmic.jaccardIndexOf(source, target);
    }, iterations: times);
    benchmark('algorithmic.diceIndexOf()', () {
      algorithmic.diceIndexOf(source, target);
    }, iterations: times);
    benchmark('algorithmic.tverskyIndex()', () {
      algorithmic.tverskyIndexOf(source, target);
    }, iterations: times);
  });

  group("Two lists of 777000 items each | ngram: 77", () {
    final size = 77000;
    final times = 10;

    List<int> _source = [];
    List<int> _target = [];
    String source = "";
    String target = "";
    setUpAll(() {
      _source = List<int>.generate(size, (i) => i % 255);
      _target = [..._source];
      _target.shuffle();
      source = String.fromCharCodes(_source);
      target = String.fromCharCodes(_target);
    });

    benchmark('edit_distance.Jaccard().distance()', () {
      edit_distance.Jaccard(ngram: 77).distance(source, target);
    }, iterations: times);
    benchmark('algorithmic.jaccardDistanceOf()', () {
      algorithmic.jaccardDistanceOf(source, target, ngram: 77);
    }, iterations: times);
    benchmark('algorithmic.jaccardIndexOf()', () {
      algorithmic.jaccardIndexOf(source, target, ngram: 77);
    }, iterations: times);
    benchmark('algorithmic.diceIndexOf()', () {
      algorithmic.diceIndexOf(source, target, ngram: 77);
    }, iterations: times);
    benchmark('algorithmic.tverskyIndex()', () {
      algorithmic.tverskyIndexOf(source, target, ngram: 77);
    }, iterations: times);
  });
}
