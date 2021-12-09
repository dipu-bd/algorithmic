// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:test/test.dart';
import 'package:algorithmic/searching.dart';

void main() {
  group('binarySearchMax()', () {
    group('Check if errors are thrown', () {
      test("Case: int vs. string", () {
        expect(
            () => binarySearchMax([1], '1'), throwsA(TypeMatcher<TypeError>()));
      });
      test("Case: String vs. int", () {
        expect(
            () => binarySearchMax(['1'], 1), throwsA(TypeMatcher<TypeError>()));
      });
      test("Case: String vs. double", () {
        expect(() => binarySearchMax(['1'], 1.0),
            throwsA(TypeMatcher<TypeError>()));
      });
      test("Case: negative count", () {
        expect(() => binarySearchMax([1], 1, count: -1),
            throwsA(TypeMatcher<RangeError>()));
      });
    });

    group('Test [0, 0, 0, 0, 0]', () {
      final arr = [0, 0, 0, 0, 0];
      test("Case: -10", () {
        expect(binarySearchMax(arr, -10), -1);
      });
      test("Case: -1", () {
        expect(binarySearchMax(arr, -1), -1);
      });
      test("Case: 0", () {
        expect(binarySearchMax(arr, 0), 4);
      });
      test("Case: 1", () {
        expect(binarySearchMax(arr, 1), -1);
      });
      test("Case: 10", () {
        expect(binarySearchMax(arr, 10), -1);
      });
    });

    group('Test [0, 2, 2, 5, 5, 5, 7, 7, 10, 11]', () {
      final arr = [0, 2, 2, 5, 5, 5, 7, 7, 10, 11];
      test("Case: -100", () {
        expect(binarySearchMax(arr, -100), -1);
      });
      test("Case: -10", () {
        expect(binarySearchMax(arr, -10), -1);
      });
      test("Case: -1", () {
        expect(binarySearchMax(arr, -1), -1);
      });
      test("Case: 0", () {
        expect(binarySearchMax(arr, 0), 0);
      });
      test("Case: 1", () {
        expect(binarySearchMax(arr, 1), -1);
      });
      test("Case: 2", () {
        expect(binarySearchMax(arr, 2), 2);
      });
      test("Case: 3", () {
        expect(binarySearchMax(arr, 3), -1);
      });
      test("Case: 4", () {
        expect(binarySearchMax(arr, 4), -1);
      });
      test("Case: 5", () {
        expect(binarySearchMax(arr, 5), 5);
      });
      test("Case: 6", () {
        expect(binarySearchMax(arr, 6), -1);
      });
      test("Case: 7", () {
        expect(binarySearchMax(arr, 7), 7);
      });
      test("Case: 8", () {
        expect(binarySearchMax(arr, 8), -1);
      });
      test("Case: 9", () {
        expect(binarySearchMax(arr, 9), -1);
      });
      test("Case: 10", () {
        expect(binarySearchMax(arr, 10), 8);
      });
      test("Case: 11", () {
        expect(binarySearchMax(arr, 11), 9);
      });
      test("Case: 12", () {
        expect(binarySearchMax(arr, 12), -1);
      });
      test("Case: 13", () {
        expect(binarySearchMax(arr, 13), -1);
      });
      test("Case: 100", () {
        expect(binarySearchMax(arr, 100), -1);
      });
    });

    group('Test start and count', () {
      final arr = [0, 2, 2, 5, 5, 5, 7, 7, 10, 11];
      test("Case: 5 start -10", () {
        expect(binarySearchMax(arr, 5, start: -10), 5);
      });
      test("Case: 5 start 7", () {
        expect(binarySearchMax(arr, 5, start: 7), -1);
      });
      test("Case: 5 start 4", () {
        expect(binarySearchMax(arr, 5, start: 4), 5);
      });
      test("Case: 5 start 5", () {
        expect(binarySearchMax(arr, 5, start: 5), 5);
      });
      test("Case: 5 start 6", () {
        expect(binarySearchMax(arr, 5, start: 6), -1);
      });
      test("Case: 5 start 100)", () {
        expect(binarySearchMax(arr, 5, start: 100), -1);
      });
      test("Case: 5 count 0", () {
        expect(binarySearchMax(arr, 5, count: 0), -1);
      });
      test("Case: 5 count 5", () {
        expect(binarySearchMax(arr, 5, count: 5), 4);
      });
      test("Case: 5 count 8", () {
        expect(binarySearchMax(arr, 5, count: 8), 5);
      });
      test("Case: 5 count 100", () {
        expect(binarySearchMax(arr, 5, count: 100), 5);
      });
      test("Case: 5 start 3 count 2", () {
        expect(binarySearchMax(arr, 5, start: 3, count: 2), 4);
      });
      test("Case: 5 start 3 count 100", () {
        expect(binarySearchMax(arr, 5, start: 3, count: 100), 5);
      });
      test("Case: 5 start 8 count 100", () {
        expect(binarySearchMax(arr, 5, start: 8, count: 100), -1);
      });
      test("Case: 5 start -100 count 5", () {
        expect(binarySearchMax(arr, 5, start: -100, count: 5), -1);
      });
      test("Case: 5 start -100 count 8", () {
        expect(binarySearchMax(arr, 5, start: -100, count: 8), -1);
      });
      test("Case: 5 start -100 count 100", () {
        expect(binarySearchMax(arr, 5, start: -100, count: 100), -1);
      });
      test("Case: 5 start -100 count 106", () {
        expect(binarySearchMax(arr, 5, start: -100, count: 106), 5);
      });
      test("Case: 5 start -100 count 105", () {
        expect(binarySearchMax(arr, 5, start: -100, count: 105), 4);
      });
      test("Case: 3 start -100 count 106", () {
        expect(binarySearchMax(arr, 3, start: -100, count: 106), -1);
      });
    });
  });

  group('binarySearchMax() with [compare]', () {
    final comp = ((int a, int b) => a - b);
    group('Test [0, 0, 0, 0, 0]', () {
      final arr = [0, 0, 0, 0, 0];
      test("Case: -10", () {
        expect(binarySearchMax(arr, -10, compare: comp), -1);
      });
      test("Case: -1", () {
        expect(binarySearchMax(arr, -1, compare: comp), -1);
      });
      test("Case: 0", () {
        expect(binarySearchMax(arr, 0, compare: comp), 4);
      });
      test("Case: 1", () {
        expect(binarySearchMax(arr, 1, compare: comp), -1);
      });
      test("Case: 10", () {
        expect(binarySearchMax(arr, 10, compare: comp), -1);
      });
    });

    group('Test [0, 2, 2, 5, 5, 5, 7, 7, 10, 11]', () {
      final arr = [0, 2, 2, 5, 5, 5, 7, 7, 10, 11];
      test("Case: -100", () {
        expect(binarySearchMax(arr, -100, compare: comp), -1);
      });
      test("Case: -10", () {
        expect(binarySearchMax(arr, -10, compare: comp), -1);
      });
      test("Case: -1", () {
        expect(binarySearchMax(arr, -1, compare: comp), -1);
      });
      test("Case: 0", () {
        expect(binarySearchMax(arr, 0, compare: comp), 0);
      });
      test("Case: 1", () {
        expect(binarySearchMax(arr, 1, compare: comp), -1);
      });
      test("Case: 2", () {
        expect(binarySearchMax(arr, 2, compare: comp), 2);
      });
      test("Case: 3", () {
        expect(binarySearchMax(arr, 3, compare: comp), -1);
      });
      test("Case: 4", () {
        expect(binarySearchMax(arr, 4, compare: comp), -1);
      });
      test("Case: 5", () {
        expect(binarySearchMax(arr, 5, compare: comp), 5);
      });
      test("Case: 6", () {
        expect(binarySearchMax(arr, 6, compare: comp), -1);
      });
      test("Case: 7", () {
        expect(binarySearchMax(arr, 7, compare: comp), 7);
      });
      test("Case: 8", () {
        expect(binarySearchMax(arr, 8, compare: comp), -1);
      });
      test("Case: 9", () {
        expect(binarySearchMax(arr, 9, compare: comp), -1);
      });
      test("Case: 10", () {
        expect(binarySearchMax(arr, 10, compare: comp), 8);
      });
      test("Case: 11", () {
        expect(binarySearchMax(arr, 11, compare: comp), 9);
      });
      test("Case: 12", () {
        expect(binarySearchMax(arr, 12, compare: comp), -1);
      });
      test("Case: 13", () {
        expect(binarySearchMax(arr, 13, compare: comp), -1);
      });
      test("Case: 100", () {
        expect(binarySearchMax(arr, 100, compare: comp), -1);
      });
    });

    group('Test start and count', () {
      final arr = [0, 2, 2, 5, 5, 5, 7, 7, 10, 11];
      test("Case: 5 start -10", () {
        expect(binarySearchMax(arr, 5, compare: comp, start: -10), 5);
      });
      test("Case: 5 start 7", () {
        expect(binarySearchMax(arr, 5, compare: comp, start: 7), -1);
      });
      test("Case: 5 start 4", () {
        expect(binarySearchMax(arr, 5, compare: comp, start: 4), 5);
      });
      test("Case: 5 start 5", () {
        expect(binarySearchMax(arr, 5, compare: comp, start: 5), 5);
      });
      test("Case: 5 start 6", () {
        expect(binarySearchMax(arr, 5, compare: comp, start: 6), -1);
      });
      test("Case: 5 start 100)", () {
        expect(binarySearchMax(arr, 5, compare: comp, start: 100), -1);
      });
      test("Case: 5 count 0", () {
        expect(binarySearchMax(arr, 5, compare: comp, count: 0), -1);
      });
      test("Case: 5 count 5", () {
        expect(binarySearchMax(arr, 5, compare: comp, count: 5), 4);
      });
      test("Case: 5 count 8", () {
        expect(binarySearchMax(arr, 5, compare: comp, count: 8), 5);
      });
      test("Case: 5 count 100", () {
        expect(binarySearchMax(arr, 5, compare: comp, count: 100), 5);
      });
      test("Case: 5 start 3 count 2", () {
        expect(binarySearchMax(arr, 5, compare: comp, start: 3, count: 2), 4);
      });
      test("Case: 5 start 3 count 100", () {
        expect(binarySearchMax(arr, 5, compare: comp, start: 3, count: 100), 5);
      });
      test("Case: 5 start 8 count 100", () {
        expect(
            binarySearchMax(arr, 5, compare: comp, start: 8, count: 100), -1);
      });
      test("Case: 5 start -100 count 5", () {
        expect(
            binarySearchMax(arr, 5, compare: comp, start: -100, count: 5), -1);
      });
      test("Case: 5 start -100 count 8", () {
        expect(
            binarySearchMax(arr, 5, compare: comp, start: -100, count: 8), -1);
      });
      test("Case: 5 start -100 count 100", () {
        expect(binarySearchMax(arr, 5, compare: comp, start: -100, count: 100),
            -1);
      });
      test("Case: 5 start -100 count 106", () {
        expect(
            binarySearchMax(arr, 5, compare: comp, start: -100, count: 106), 5);
      });
      test("Case: 5 start -100 count 105", () {
        expect(
            binarySearchMax(arr, 5, compare: comp, start: -100, count: 105), 4);
      });
      test("Case: 3 start -100 count 106", () {
        expect(binarySearchMax(arr, 3, compare: comp, start: -100, count: 106),
            -1);
      });
    });
  });
}
