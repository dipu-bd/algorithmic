// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:test/test.dart';
import 'package:trotter/trotter.dart';
import 'package:algorithmic/algorithmic.dart';

void main() {
  group("cocktailShakerSort()", () {
    test("Test all permutations of [-3, -2, -1, 0, 1, 2]", () {
      final original = [-3, -2, -1, 0, 1, 2];
      final perms = Permutations(original.length, original);
      for (final list in perms()) {
        cocktailShakerSort(list);
        expect(list, original);
      }
    });
    test("Test single element listay", () {
      final list = [-2];
      cocktailShakerSort(list);
      expect(list.length, 1);
      expect(list[0], -2);
    });
    test("Test [1, 2, 2, 4]", () {
      final list = [1, 2, 2, 4];
      cocktailShakerSort(list);
      expect(list, [1, 2, 2, 4]);
    });
    test("Test [1, 2, 2, 2]", () {
      final list = [1, 2, 2, 2];
      cocktailShakerSort(list);
      expect(list, [1, 2, 2, 2]);
    });
    test("Test [2, 2, 2, 2]", () {
      final list = [2, 2, 2, 2];
      cocktailShakerSort(list);
      expect(list, [2, 2, 2, 2]);
    });
    test("Test [2, 2, 2, 1]", () {
      final list = [2, 2, 2, 1];
      cocktailShakerSort(list);
      expect(list, [1, 2, 2, 2]);
    });
    test("Test [1, 2, 2, 1]", () {
      final list = [1, 1, 2, 2];
      cocktailShakerSort(list);
      expect(list, [1, 1, 2, 2]);
    });

    group("Test partial sorting", () {
      test("Case: begin at -10", () {
        final list = [8, 1, 3, 7, 3, 2];
        cocktailShakerSort(list, begin: -10);
        expect(list, [1, 2, 3, 3, 7, 8]);
      });
      test("Case: begin at 2", () {
        final list = [8, 1, 3, 7, 3, 2];
        cocktailShakerSort(list, begin: 2);
        expect(list, [8, 1, 2, 3, 3, 7]);
      });
      test("Case: begin at 5", () {
        final list = [8, 1, 3, 7, 3, 2];
        cocktailShakerSort(list, begin: 5);
        expect(list, [8, 1, 3, 7, 3, 2]);
      });
      test("Case: begin at 10", () {
        final list = [8, 1, 3, 7, 3, 2];
        cocktailShakerSort(list, begin: 10);
        expect(list, [8, 1, 3, 7, 3, 2]);
      });

      test("Case: end at -10", () {
        final list = [8, 1, 3, 7, 3, 2];
        cocktailShakerSort(list, end: -10);
        expect(list, [8, 1, 3, 7, 3, 2]);
      });
      test("Case: end at -2", () {
        final list = [8, 1, 3, 7, 3, 2];
        cocktailShakerSort(list, end: -2);
        expect(list, [1, 3, 7, 8, 3, 2]);
      });
      test("Case: end at 2", () {
        final list = [8, 1, 3, 7, 3, 2];
        cocktailShakerSort(list, end: 2);
        expect(list, [1, 8, 3, 7, 3, 2]);
      });
      test("Case: end at 5", () {
        final list = [8, 1, 3, 7, 3, 2];
        cocktailShakerSort(list, end: 5);
        expect(list, [1, 3, 3, 7, 8, 2]);
      });
      test("Case: end at 10", () {
        final list = [8, 1, 3, 7, 3, 2];
        cocktailShakerSort(list, end: 10);
        expect(list, [1, 2, 3, 3, 7, 8]);
      });

      test("Case: begin at -10 end at -10", () {
        final list = [8, 1, 3, 7, 3, 2];
        cocktailShakerSort(list, begin: -10, end: -10);
        expect(list, [8, 1, 3, 7, 3, 2]);
      });
      test("Case: begin at -10 end at 2", () {
        final list = [8, 1, 3, 7, 3, 2];
        cocktailShakerSort(list, begin: -10, end: 2);
        expect(list, [1, 8, 3, 7, 3, 2]);
      });
      test("Case: begin at 2 end at -1", () {
        final list = [8, 1, 3, 7, 3, 2];
        cocktailShakerSort(list, begin: 2, end: -1);
        expect(list, [8, 1, 3, 3, 7, 2]);
      });
      test("Case: begin at 2 end at 2", () {
        final list = [8, 1, 3, 7, 3, 2];
        cocktailShakerSort(list, begin: 2, end: 2);
        expect(list, [8, 1, 3, 7, 3, 2]);
      });
      test("Case: begin at 4 end at 2", () {
        final list = [8, 1, 3, 7, 3, 2];
        cocktailShakerSort(list, begin: 2, end: 2);
        expect(list, [8, 1, 3, 7, 3, 2]);
      });
      test("Case: begin at -3 end at -1", () {
        final list = [8, 1, 3, 7, 3, 2];
        cocktailShakerSort(list, begin: -3, end: -1);
        expect(list, [1, 3, 3, 7, 8, 2]);
      });
    });
  });

  group("cocktailShakerSort() with custom [compare]", () {
    final comp = ((int a, int b) => b - a);
    test("Test all permutations of [2, 1, 0, -1, -2, -3]", () {
      final original = [2, 1, 0, -1, -2, -3];
      final perms = Permutations(original.length, original);
      for (final list in perms()) {
        cocktailShakerSort(list, compare: comp);
        expect(list, original);
      }
    });
  });
}
