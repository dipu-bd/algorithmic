// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:test/test.dart';
import 'package:algorithmic/searching.dart';

void main() {
  group('binarySearch()', () {
    group('Check if errors are thrown', () {
      test("Case: int vs. string", () {
        expect(() => binarySearch([1], '1'), throwsA(TypeMatcher<TypeError>()));
      });
      test("Case: String vs. int", () {
        expect(() => binarySearch(['1'], 1), throwsA(TypeMatcher<TypeError>()));
      });
      test("Case: String vs. double", () {
        expect(
            () => binarySearch(['1'], 1.0), throwsA(TypeMatcher<TypeError>()));
      });
      test("Case: negative count", () {
        expect(binarySearch([1], 1, count: -1), -1);
      });
    });
    group('Find items from an integer array', () {
      var arr = List<int>.generate(10, (i) => i);
      test("Case: 0 to 9", () {
        for (int i = 0; i < 10; ++i) {
          expect(binarySearch(arr, i), i);
        }
      });
      test("Case -20", () {
        expect(binarySearch(arr, -20), -1);
      });
      test("Case 20", () {
        expect(binarySearch(arr, 20), -1);
      });
      test("Case 10", () {
        expect(binarySearch(arr, 10), -1);
      });
      test("Case -1", () {
        expect(binarySearch(arr, -1), -1);
      });
      test("Case -10", () {
        expect(binarySearch(arr, -10), -1);
      });
      test("Case 5.0 + 1e-10", () {
        expect(binarySearch(arr, 5.0 + 1e-10), -1);
      });
      test("Case -0.0", () {
        expect(binarySearch(arr, -0.0), 0);
      });
      test("Case 0.0", () {
        expect(binarySearch(arr, 0.0), 0);
      });
      test("Case 5.0 + 1e-30", () {
        expect(binarySearch(arr, 5.0 + 1e-30), 5);
      });
      test("Case 5.0", () {
        expect(binarySearch(arr, 5.0), 5);
      });
    });
    group('Test [0, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4]', () {
      var arr = [0, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4];
      test("Case: -1", () {
        expect(binarySearch(arr, -1), -1);
      });
      test("Case: 0", () {
        expect(binarySearch(arr, 0), 0);
      });
      test("Case: 1", () {
        expect(binarySearch(arr, 1), 1);
      });
      test("Case: 2", () {
        expect(binarySearch(arr, 2), 4);
      });
      test("Case: 3", () {
        expect(binarySearch(arr, 3), 10);
      });
      test("Case: 4", () {
        expect(binarySearch(arr, 4), 15);
      });
      test("Case: 5", () {
        expect(binarySearch(arr, 5), -1);
      });
    });
    group('Test [1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 5]', () {
      var arr = [1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 5];
      test("Case: 0", () {
        expect(binarySearch(arr, 0), -1);
      });
      test("Case: 1", () {
        expect(binarySearch(arr, 1), 0);
      });
      test("Case: 2", () {
        expect(binarySearch(arr, 2), 4);
      });
      test("Case: 3", () {
        expect(binarySearch(arr, 3), 10);
      });
      test("Case: 4", () {
        expect(binarySearch(arr, 4), 15);
      });
      test("Case: 5", () {
        expect(binarySearch(arr, 5), 18);
      });
    });
    test('Find items from a floating point array', () {
      var arr = List<double>.generate(10, (i) => i - 5.5);
      for (int i = 0; i < 10; ++i) {
        expect(binarySearch(arr, i - 5.5), i);
      }
    });
    group('Find items from a string array', () {
      var arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k'];
      test("Case: 'a'", () {
        expect(binarySearch(arr, 'a'), 0);
      });
      test("Case: 'd'", () {
        expect(binarySearch(arr, 'd'), 3);
      });
      test("Case: 'k'", () {
        expect(binarySearch(arr, 'k'), arr.length - 1);
      });
    });
    group('Find items from an empty array', () {
      test("Case: 2", () {
        expect(binarySearch(<int>[], 2), -1);
      });
      test("Case: 2.0", () {
        expect(binarySearch(<double>[], 2.0), -1);
      });
      test("Case: '1.0'", () {
        expect(binarySearch(<String>[], '1.0'), -1);
      });
    });
    group('Find items using start and count', () {
      var arr = List<int>.generate(100, (i) => (i / 10).floor());
      test("arr, 1, start: -100", () {
        expect(binarySearch(arr, 1, start: -100), 10);
      });
      test("arr, 1, start: -1", () {
        expect(binarySearch(arr, 1, start: -1), 10);
      });
      test("arr, 1, start: 1", () {
        expect(binarySearch(arr, 1, start: 1), 10);
      });
      test("arr, 1, start: 2", () {
        expect(binarySearch(arr, 1, start: 2), 10);
      });
      test("arr, 1, start: 10", () {
        expect(binarySearch(arr, 1, start: 10), 10);
      });
      test("arr, 1, start: 20", () {
        expect(binarySearch(arr, 1, start: 20), -1);
      });
      test("arr, 9, start: 47", () {
        expect(binarySearch(arr, 9, start: 47), 90);
      });

      test("arr, 1, count: 10", () {
        expect(binarySearch(arr, 1, count: 10), -1);
      });
      test("arr, 0, count: 1", () {
        expect(binarySearch(arr, 0, count: 1), 0);
      });
      test("arr, 1, count: 0", () {
        expect(binarySearch(arr, 1, count: 0), -1);
      });
      test("arr, 1, count: 2", () {
        expect(binarySearch(arr, 1, count: 2), -1);
      });
      test("arr, 1, count: 3", () {
        expect(binarySearch(arr, 1, count: 3), -1);
      });
      test("arr, 1, count: 11", () {
        expect(binarySearch(arr, 1, count: 11), 10);
      });

      test("arr, 1, start: 8, count: 0", () {
        expect(binarySearch(arr, 1, start: 8, count: 0), -1);
      });
      test("arr, 1, start: 8, count: 1", () {
        expect(binarySearch(arr, 1, start: 8, count: 1), -1);
      });
      test("arr, 1, start: 8, count: 2", () {
        expect(binarySearch(arr, 1, start: 8, count: 2), -1);
      });
      test("arr, 1, start: 8, count: 3", () {
        expect(binarySearch(arr, 1, start: 8, count: 3), 10);
      });
      test("arr, 1, start: 10, count: 0", () {
        expect(binarySearch(arr, 1, start: 10, count: 0), -1);
      });
      test("arr, 1, start: 10, count: 1", () {
        expect(binarySearch(arr, 1, start: 10, count: 1), 10);
      });
      test("arr, 1, start: 30, count: 1", () {
        expect(binarySearch(arr, 1, start: 30, count: 1), -1);
      });
      test("arr, 0, start: -30, count: 1", () {
        expect(binarySearch(arr, 0, start: -30, count: 1), -1);
      });
      test("arr, 0, start: -30, count: 30", () {
        expect(binarySearch(arr, 0, start: -30, count: 30), -1);
      });
      test("arr, 0, start: -30, count: 31", () {
        expect(binarySearch(arr, 0, start: -30, count: 31), 0);
      });
      test("arr, 1, start: -30, count: 40", () {
        expect(binarySearch(arr, 1, start: -30, count: 40), -1);
      });
      test("arr, 1, start: -30, count: 41", () {
        expect(binarySearch(arr, 1, start: -30, count: 41), 10);
      });
    });
  });

  group('binarySearch() with custom [compare]', () {
    final comp = ((num a, num b) => (a - b).toInt());

    group('Find items from an integer array', () {
      var arr = List<int>.generate(10, (i) => i);
      test("Case: 0 to 9", () {
        for (int i = 0; i < 10; ++i) {
          expect(binarySearch(arr, i, compare: comp), i);
        }
      });
      test("Case -20", () {
        expect(binarySearch(arr, -20, compare: comp), -1);
      });
      test("Case 20", () {
        expect(binarySearch(arr, 20, compare: comp), -1);
      });
      test("Case 10", () {
        expect(binarySearch(arr, 10, compare: comp), -1);
      });
      test("Case -1", () {
        expect(binarySearch(arr, -1, compare: comp), -1);
      });
      test("Case -10", () {
        expect(binarySearch(arr, -10, compare: comp), -1);
      });
      test("Case 5.0 + 1e-10", () {
        expect(binarySearch(arr, 5.0 + 1e-10, compare: comp), 5);
      });
      test("Case -0.0", () {
        expect(binarySearch(arr, -0.0, compare: comp), 0);
      });
      test("Case 0.0", () {
        expect(binarySearch(arr, 0.0, compare: comp), 0);
      });
      test("Case 5.0 + 1e-30", () {
        expect(binarySearch(arr, 5.0 + 1e-30, compare: comp), 5);
      });
      test("Case 5.0", () {
        expect(binarySearch(arr, 5.0, compare: comp), 5);
      });
    });
    group('Test [0, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4]', () {
      var arr = [0, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4];
      test("Case: -1", () {
        expect(binarySearch(arr, -1, compare: comp), -1);
      });
      test("Case: 0", () {
        expect(binarySearch(arr, 0, compare: comp), 0);
      });
      test("Case: 1", () {
        expect(binarySearch(arr, 1, compare: comp), 1);
      });
      test("Case: 2", () {
        expect(binarySearch(arr, 2, compare: comp), 4);
      });
      test("Case: 3", () {
        expect(binarySearch(arr, 3, compare: comp), 10);
      });
      test("Case: 4", () {
        expect(binarySearch(arr, 4, compare: comp), 15);
      });
      test("Case: 5", () {
        expect(binarySearch(arr, 5, compare: comp), -1);
      });
    });
    group('Test [1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 5]', () {
      var arr = [1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 5];
      test("Case: 0", () {
        expect(binarySearch(arr, 0, compare: comp), -1);
      });
      test("Case: 1", () {
        expect(binarySearch(arr, 1, compare: comp), 0);
      });
      test("Case: 2", () {
        expect(binarySearch(arr, 2, compare: comp), 4);
      });
      test("Case: 3", () {
        expect(binarySearch(arr, 3, compare: comp), 10);
      });
      test("Case: 4", () {
        expect(binarySearch(arr, 4, compare: comp), 15);
      });
      test("Case: 5", () {
        expect(binarySearch(arr, 5, compare: comp), 18);
      });
    });
    test('Find items from a floating point array', () {
      var arr = List<double>.generate(10, (i) => i - 5.5);
      for (int i = 0; i < 10; ++i) {
        expect(binarySearch(arr, i - 5.5, compare: comp), i);
      }
    });
    group('Find items from a string array', () {
      var arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k'];
      var strcomp = ((String a, String b) => a.compareTo(b));
      test("Case: 'a'", () {
        expect(binarySearch(arr, 'a', compare: strcomp), 0);
      });
      test("Case: 'd'", () {
        expect(binarySearch(arr, 'd', compare: strcomp), 3);
      });
      test("Case: 'k'", () {
        expect(binarySearch(arr, 'k', compare: strcomp), arr.length - 1);
      });
    });
    group('Find items using start and count', () {
      var arr = List<int>.generate(100, (i) => (i / 10).floor());
      test("arr, 1, start: -100", () {
        expect(binarySearch(arr, 1, compare: comp, start: -100), 10);
      });
      test("arr, 1, start: -1", () {
        expect(binarySearch(arr, 1, compare: comp, start: -1), 10);
      });
      test("arr, 1, start: 1", () {
        expect(binarySearch(arr, 1, compare: comp, start: 1), 10);
      });
      test("arr, 1, start: 2", () {
        expect(binarySearch(arr, 1, compare: comp, start: 2), 10);
      });
      test("arr, 1, start: 10", () {
        expect(binarySearch(arr, 1, compare: comp, start: 10), 10);
      });
      test("arr, 1, start: 20", () {
        expect(binarySearch(arr, 1, compare: comp, start: 20), -1);
      });
      test("arr, 9, start: 47", () {
        expect(binarySearch(arr, 9, compare: comp, start: 47), 90);
      });

      test("arr, 1, count: 10", () {
        expect(binarySearch(arr, 1, compare: comp, count: 10), -1);
      });
      test("arr, 0, count: 1", () {
        expect(binarySearch(arr, 0, compare: comp, count: 1), 0);
      });
      test("arr, 1, count: 0", () {
        expect(binarySearch(arr, 1, compare: comp, count: 0), -1);
      });
      test("arr, 1, count: 2", () {
        expect(binarySearch(arr, 1, compare: comp, count: 2), -1);
      });
      test("arr, 1, count: 3", () {
        expect(binarySearch(arr, 1, compare: comp, count: 3), -1);
      });
      test("arr, 1, count: 11", () {
        expect(binarySearch(arr, 1, compare: comp, count: 11), 10);
      });

      test("arr, 1, start: 8, count: 0", () {
        expect(binarySearch(arr, 1, compare: comp, start: 8, count: 0), -1);
      });
      test("arr, 1, start: 8, count: 1", () {
        expect(binarySearch(arr, 1, compare: comp, start: 8, count: 1), -1);
      });
      test("arr, 1, start: 8, count: 2", () {
        expect(binarySearch(arr, 1, compare: comp, start: 8, count: 2), -1);
      });
      test("arr, 1, start: 8, count: 3", () {
        expect(binarySearch(arr, 1, compare: comp, start: 8, count: 3), 10);
      });
      test("arr, 1, start: 10, count: 0", () {
        expect(binarySearch(arr, 1, compare: comp, start: 10, count: 0), -1);
      });
      test("arr, 1, start: 10, count: 1", () {
        expect(binarySearch(arr, 1, compare: comp, start: 10, count: 1), 10);
      });
      test("arr, 1, start: 30, count: 1", () {
        expect(binarySearch(arr, 1, compare: comp, start: 30, count: 1), -1);
      });
      test("arr, 0, start: -30, count: 1", () {
        expect(binarySearch(arr, 0, compare: comp, start: -30, count: 1), -1);
      });
      test("arr, 0, start: -30, count: 30", () {
        expect(binarySearch(arr, 0, compare: comp, start: -30, count: 30), -1);
      });
      test("arr, 0, start: -30, count: 31", () {
        expect(binarySearch(arr, 0, compare: comp, start: -30, count: 31), 0);
      });
      test("arr, 1, start: -30, count: 40", () {
        expect(binarySearch(arr, 1, compare: comp, start: -30, count: 40), -1);
      });
      test("arr, 1, start: -30, count: 41", () {
        expect(binarySearch(arr, 1, compare: comp, start: -30, count: 41), 10);
      });
    });
  });
}
