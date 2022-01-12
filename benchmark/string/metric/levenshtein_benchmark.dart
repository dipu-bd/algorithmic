// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:algorithmic/algorithmic.dart' as algorithmic;
import 'package:benchmark/benchmark.dart';
import 'package:edit_distance/edit_distance.dart' as edit_distance;

void main() {
  group("Two lists of 5000 items each", () {
    final size = 5000;
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

    benchmark('edit_distance.Levenshtein().distance()', () {
      edit_distance.Levenshtein().distance(source, target);
    }, iterations: times);
    benchmark('algorithmic.levenshteinDistance()', () {
      algorithmic.levenshteinDistanceOf(source, target);
    }, iterations: times);
  });

  group("Two lists of 100 items each", () {
    final size = 100;
    final times = 1000;

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

    benchmark('edit_distance.Levenshtein().distance()', () {
      edit_distance.Levenshtein().distance(source, target);
    }, iterations: times);
    benchmark('algorithmic.levenshteinDistance()', () {
      algorithmic.levenshteinDistanceOf(source, target);
    }, iterations: times);
  });

  group("Two lists of 100 vs 10000 items", () {
    final size1 = 100;
    final size2 = 10000;
    final times = 100;

    List<int> _source = [];
    List<int> _target = [];
    String source = "";
    String target = "";
    setUpAll(() {
      _source = List<int>.generate(size1, (i) => i % 255);
      _target = List<int>.generate(size2, (i) => i % 255);
      _target.shuffle();
      source = String.fromCharCodes(_source);
      target = String.fromCharCodes(_target);
    });

    benchmark('edit_distance.Levenshtein().distance()', () {
      edit_distance.Levenshtein().distance(source, target);
    }, iterations: times);
    benchmark('algorithmic.levenshteinDistance()', () {
      algorithmic.levenshteinDistanceOf(source, target);
    }, iterations: times);
  });

  group("Two lists of 10000 vs 100 items", () {
    final size1 = 10000;
    final size2 = 100;
    final times = 100;

    List<int> _source = [];
    List<int> _target = [];
    String source = "";
    String target = "";
    setUpAll(() {
      _source = List<int>.generate(size1, (i) => i % 255);
      _target = List<int>.generate(size2, (i) => i % 255);
      _source.shuffle();
      source = String.fromCharCodes(_source);
      target = String.fromCharCodes(_target);
    });

    benchmark('edit_distance.Levenshtein().distance()', () {
      edit_distance.Levenshtein().distance(source, target);
    }, iterations: times);
    benchmark('algorithmic.levenshteinDistance()', () {
      algorithmic.levenshteinDistanceOf(source, target);
    }, iterations: times);
  });
}
