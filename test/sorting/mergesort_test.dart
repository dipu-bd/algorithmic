// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:test/test.dart';
import 'package:trotter/trotter.dart';
import 'package:algorithmic/algorithmic.dart';

void main() {
  group("mergeSort()", () {
    group("Test with invalid thresholds", () {
      final list = [-3, -2, -1, 0, 1, 2];
      test("Case threshold: 12", () {
        expect(() => mergeSort(list, threshold: 12), throwsArgumentError);
      });
      test("Case threshold: 3", () {
        expect(() => mergeSort(list, threshold: 3), throwsArgumentError);
      });
      test("Case threshold: 1000", () {
        expect(() => mergeSort(list, threshold: 1000), throwsArgumentError);
      });
    });
    test("Test all permutations of [-3, -2, -1, 0, 1, 2] with threshold: 0",
        () {
      final original = [-3, -2, -1, 0, 1, 2];
      final perms = Permutations(original.length, original);
      for (final list in perms()) {
        mergeSort(list, threshold: 0);
        expect(list, original, reason: '$list');
      }
    });
    test("Test all permutations of [-3, -2, -1, 0, 1, 2] with threshold: 128",
        () {
      final original = [-3, -2, -1, 0, 1, 2];
      final perms = Permutations(original.length, original);
      for (final list in perms()) {
        mergeSort(list, threshold: 128);
        expect(list, original, reason: '$list');
      }
    });
    test("Test with large list of 1000 length", () {
      final original = List<int>.generate(1000, (i) => i);
      final shuffled = [...original];
      shuffled.shuffle();
      shuffled.shuffle();
      mergeSort(shuffled);
      expect(shuffled, original);
    });
    test("Test single element list", () {
      final list = [-2];
      mergeSort(list, threshold: 2);
      expect(list.length, 1);
      expect(list[0], -2);
    });
    test("Test [a, d, f, b, c, e]", () {
      final list = ['a', 'd', 'f', 'b', 'c', 'e'];
      mergeSort(list, threshold: 0);
      expect(list, ['a', 'b', 'c', 'd', 'e', 'f']);
    });
    test("Test [-3, -2, -1, 0, 2, 1]", () {
      final list = [-3, -2, -1, 0, 2, 1];
      mergeSort(list, threshold: 0);
      expect(list, [-3, -2, -1, 0, 1, 2]);
    });
    test("Test [1, 2, 0, 3, -1, -2, -3]", () {
      final list = [1, 2, 0, 3, -1, -2, -3];
      mergeSort(list, threshold: 0);
      expect(list, [-3, -2, -1, 0, 1, 2, 3]);
    });
    test("Test [1, 2, 2, 2, 2, 4]", () {
      final list = [1, 2, 2, 2, 2, 4];
      mergeSort(list, threshold: 2);
      expect(list, [1, 2, 2, 2, 2, 4]);
    });
    test("Test [1, 2, 2, 2, 2, 2]", () {
      final list = [1, 2, 2, 2, 2, 2];
      mergeSort(list, threshold: 2);
      expect(list, [1, 2, 2, 2, 2, 2]);
    });
    test("Test [2, 2, 2, 2, 2, 2, 2, 2]", () {
      final list = [2, 2, 2, 2, 2, 2, 2, 2];
      mergeSort(list, threshold: 2);
      expect(list, [2, 2, 2, 2, 2, 2, 2, 2]);
    });
    test("Test [2, 2, 2, 2, 2, 1]", () {
      final list = [2, 2, 2, 2, 2, 1];
      mergeSort(list, threshold: 2);
      expect(list, [1, 2, 2, 2, 2, 2]);
    });
    test("Test [1, 2, 2, 2, 2, 1]", () {
      final list = [1, 1, 2, 2, 2, 2];
      mergeSort(list, threshold: 2);
      expect(list, [1, 1, 2, 2, 2, 2]);
    });

    group("Test partial sorting", () {
      test("Case: begin at -10", () {
        final list = [8, 1, 3, 7, 3, 2];
        mergeSort(list, begin: -10, threshold: 2);
        expect(list, [1, 2, 3, 3, 7, 8]);
      });
      test("Case: begin at 2", () {
        final list = [8, 1, 3, 7, 3, 2];
        mergeSort(list, begin: 2, threshold: 2);
        expect(list, [8, 1, 2, 3, 3, 7]);
      });
      test("Case: begin at 5", () {
        final list = [8, 1, 3, 7, 3, 2];
        mergeSort(list, begin: 5, threshold: 0);
        expect(list, [8, 1, 3, 7, 3, 2]);
      });
      test("Case: begin at 10", () {
        final list = [8, 1, 3, 7, 3, 2];
        mergeSort(list, begin: 10, threshold: 0);
        expect(list, [8, 1, 3, 7, 3, 2]);
      });

      test("Case: end at -10", () {
        final list = [8, 1, 3, 7, 3, 2];
        mergeSort(list, end: -10, threshold: 0);
        expect(list, [8, 1, 3, 7, 3, 2]);
      });
      test("Case: end at -2", () {
        final list = [8, 1, 3, 7, 3, 2];
        mergeSort(list, end: -2, threshold: 0);
        expect(list, [1, 3, 7, 8, 3, 2]);
      });
      test("Case: end at 2", () {
        final list = [8, 1, 3, 7, 3, 2];
        mergeSort(list, end: 2, threshold: 0);
        expect(list, [1, 8, 3, 7, 3, 2]);
      });
      test("Case: end at 5", () {
        final list = [8, 1, 3, 7, 3, 2];
        mergeSort(list, end: 5, threshold: 0);
        expect(list, [1, 3, 3, 7, 8, 2]);
      });
      test("Case: end at 10", () {
        final list = [8, 1, 3, 7, 3, 2];
        mergeSort(list, end: 10, threshold: 0);
        expect(list, [1, 2, 3, 3, 7, 8]);
      });

      test("Case: begin at -10 end at -10", () {
        final list = [8, 1, 3, 7, 3, 2];
        mergeSort(list, begin: -10, end: -10, threshold: 0);
        expect(list, [8, 1, 3, 7, 3, 2]);
      });
      test("Case: begin at -10 end at 2", () {
        final list = [8, 1, 3, 7, 3, 2];
        mergeSort(list, begin: -10, end: 2, threshold: 0);
        expect(list, [1, 8, 3, 7, 3, 2]);
      });
      test("Case: begin at 2 end at -1", () {
        final list = [8, 1, 3, 7, 3, 2];
        mergeSort(list, begin: 2, end: -1, threshold: 0);
        expect(list, [8, 1, 3, 3, 7, 2]);
      });
      test("Case: begin at 2 end at 2", () {
        final list = [8, 1, 3, 7, 3, 2];
        mergeSort(list, begin: 2, end: 2, threshold: 0);
        expect(list, [8, 1, 3, 7, 3, 2]);
      });
      test("Case: begin at 4 end at 2", () {
        final list = [8, 1, 3, 7, 3, 2];
        mergeSort(list, begin: 2, end: 2, threshold: 0);
        expect(list, [8, 1, 3, 7, 3, 2]);
      });
      test("Case: begin at -3 end at -1", () {
        final list = [8, 1, 3, 7, 3, 2];
        mergeSort(list, begin: -3, end: -1, threshold: 0);
        expect(list, [1, 3, 3, 7, 8, 2]);
      });
    });
  });

  group("mergeSort() with custom [compare]", () {
    final comp = ((int a, int b) => b - a);
    test("Test all permutations of [2, 1, 0, -1, -2, -3]", () {
      final original = [2, 1, 0, -1, -2, -3];
      final perms = Permutations(original.length, original);
      for (final list in perms()) {
        mergeSort(list, compare: comp, threshold: 2);
        expect(list, original, reason: '$list');
      }
    });
    test("Test all permutations of [2, 1, 0, -1, -2, -3] with threshold: 128",
        () {
      final original = [2, 1, 0, -1, -2, -3];
      final perms = Permutations(original.length, original);
      for (final list in perms()) {
        mergeSort(list, compare: comp, threshold: 128);
        expect(list, original, reason: '$list');
      }
    });
    test("Test with large list of 1000 length", () {
      final original = List<int>.generate(1000, (i) => -i);
      final shuffled = [...original];
      shuffled.shuffle();
      shuffled.shuffle();
      mergeSort(shuffled, compare: comp);
      expect(shuffled, original);
    });
  });
}
