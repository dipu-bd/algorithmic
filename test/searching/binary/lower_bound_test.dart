import 'package:test/test.dart';
import 'package:algorithmic/searching.dart';

void main() {
  group('lowerBound()', () {
    group('Check if errors are thrown', () {
      test("Case: int vs. string", () {
        expect(() => lowerBound([1], '1'), throwsA(TypeMatcher<TypeError>()));
      });
      test("Case: String vs. int", () {
        expect(() => lowerBound(['1'], 1), throwsA(TypeMatcher<TypeError>()));
      });
      test("Case: String vs. double", () {
        expect(() => lowerBound(['1'], 1.0), throwsA(TypeMatcher<TypeError>()));
      });
      test("Case: negative count", () {
        expect(() => lowerBound([1], 1, count: -1),
            throwsA(TypeMatcher<RangeError>()));
      });
    });

    group('Test [0, 0, 0, 0, 0]', () {
      final arr = [0, 0, 0, 0, 0];
      test("Case: -10", () {
        expect(lowerBound(arr, -10), 0);
      });
      test("Case: -1", () {
        expect(lowerBound(arr, -1), 0);
      });
      test("Case: 0", () {
        expect(lowerBound(arr, 0), 0);
      });
      test("Case: 1", () {
        expect(lowerBound(arr, 1), 5);
      });
      test("Case: 10", () {
        expect(lowerBound(arr, 10), 5);
      });
    });

    group('Test [0, 2, 2, 5, 5, 5, 7, 7, 10, 11]', () {
      final arr = [0, 2, 2, 5, 5, 5, 7, 7, 10, 11];
      test("Case: -100", () {
        expect(lowerBound(arr, -100), 0);
      });
      test("Case: -10", () {
        expect(lowerBound(arr, -10), 0);
      });
      test("Case: -1", () {
        expect(lowerBound(arr, -1), 0);
      });
      test("Case: 0", () {
        expect(lowerBound(arr, 0), 0);
      });
      test("Case: 1", () {
        expect(lowerBound(arr, 1), 1);
      });
      test("Case: 2", () {
        expect(lowerBound(arr, 2), 1);
      });
      test("Case: 3", () {
        expect(lowerBound(arr, 3), 3);
      });
      test("Case: 4", () {
        expect(lowerBound(arr, 4), 3);
      });
      test("Case: 5", () {
        expect(lowerBound(arr, 5), 3);
      });
      test("Case: 6", () {
        expect(lowerBound(arr, 6), 6);
      });
      test("Case: 7", () {
        expect(lowerBound(arr, 7), 6);
      });
      test("Case: 8", () {
        expect(lowerBound(arr, 8), 8);
      });
      test("Case: 9", () {
        expect(lowerBound(arr, 9), 8);
      });
      test("Case: 10", () {
        expect(lowerBound(arr, 10), 8);
      });
      test("Case: 11", () {
        expect(lowerBound(arr, 11), 9);
      });
      test("Case: 12", () {
        expect(lowerBound(arr, 12), 10);
      });
      test("Case: 13", () {
        expect(lowerBound(arr, 13), 10);
      });
      test("Case: 100", () {
        expect(lowerBound(arr, 100), 10);
      });
    });

    group('Test start and count', () {
      final arr = [0, 0, 0, 0, 0];
      test("Case: find 0 start -10", () {
        expect(lowerBound(arr, 0, start: -10), 0);
      });
      test("Case: find 0 start 2", () {
        expect(lowerBound(arr, 0, start: 2), 2);
      });
      test("Case: find 0 start 4", () {
        expect(lowerBound(arr, 0, start: 4), 4);
      });
      test("Case: find 0 start 5", () {
        expect(lowerBound(arr, 0, start: 5), 5);
      });
      test("Case: find 0 start 10", () {
        expect(lowerBound(arr, 0, start: 10), 5);
      });
      test("Case: find 1 start -10", () {
        expect(lowerBound(arr, 1, start: -10), 5);
      });
      test("Case: find 1 start 3", () {
        expect(lowerBound(arr, 1, start: 3), 5);
      });
      test("Case: find 1 start 10", () {
        expect(lowerBound(arr, 1, start: 10), 5);
      });

      test("Case: find 0 count 0", () {
        expect(lowerBound(arr, 0, count: 0), 0);
      });
      test("Case: find 1 count 0", () {
        expect(lowerBound(arr, 1, count: 0), 0);
      });
      test("Case: find 1 count 1", () {
        expect(lowerBound(arr, 1, count: 1), 1);
      });
      test("Case: find 1 count 3", () {
        expect(lowerBound(arr, 1, count: 3), 3);
      });
      test("Case: find 1 count 5", () {
        expect(lowerBound(arr, 1, count: 5), 5);
      });
      test("Case: find 1 count 6", () {
        expect(lowerBound(arr, 1, count: 6), 5);
      });
      test("Case: find 1 count 10", () {
        expect(lowerBound(arr, 1, count: 10), 5);
      });

      test("Case: find 1 start 2 count 0", () {
        expect(lowerBound(arr, 1, start: 2, count: 0), 2);
      });
      test("Case: find 1 start 2 count 1", () {
        expect(lowerBound(arr, 1, start: 2, count: 1), 3);
      });
      test("Case: find 1 start 2 count 3", () {
        expect(lowerBound(arr, 1, start: 2, count: 3), 5);
      });
      test("Case: find 1 start 2 count 5", () {
        expect(lowerBound(arr, 1, start: 2, count: 5), 5);
      });
      test("Case: find 1 start 2 count 10", () {
        expect(lowerBound(arr, 1, start: 2, count: 10), 5);
      });
      test("Case: find 1 start -1 count 2", () {
        expect(lowerBound(arr, 1, start: -1, count: 2), 1);
      });
      test("Case: find 1 start -10 count 3", () {
        expect(lowerBound(arr, 1, start: -10, count: 3), -7);
      });
      test("Case: find 1 start -10 count 300", () {
        expect(lowerBound(arr, 1, start: -10, count: 300), 5);
      });
      test("Case: find 0 start -10 count 3", () {
        expect(lowerBound(arr, 0, start: -10, count: 3), -7);
      });
      test("Case: find 0 start -10 count 0", () {
        expect(lowerBound(arr, 0, start: -10, count: 0), -10);
      });
      test("Case: find 0 start -10 count 100", () {
        expect(lowerBound(arr, 0, start: -10, count: 100), 0);
      });
    });
  });

  group('lowerBound() with [compare]', () {
    final comp = ((int a, int b) => a - b);
    group('Test [0, 0, 0, 0, 0]', () {
      final arr = [0, 0, 0, 0, 0];
      test("Case: -10", () {
        expect(lowerBound(arr, -10, compare: comp), 0);
      });
      test("Case: -1", () {
        expect(lowerBound(arr, -1, compare: comp), 0);
      });
      test("Case: 0", () {
        expect(lowerBound(arr, 0, compare: comp), 0);
      });
      test("Case: 1", () {
        expect(lowerBound(arr, 1, compare: comp), 5);
      });
      test("Case: 10", () {
        expect(lowerBound(arr, 10, compare: comp), 5);
      });
    });

    group('Test [0, 2, 2, 5, 5, 5, 7, 7, 10, 11]', () {
      final arr = [0, 2, 2, 5, 5, 5, 7, 7, 10, 11];
      test("Case: -100", () {
        expect(lowerBound(arr, -100, compare: comp), 0);
      });
      test("Case: -10", () {
        expect(lowerBound(arr, -10, compare: comp), 0);
      });
      test("Case: -1", () {
        expect(lowerBound(arr, -1, compare: comp), 0);
      });
      test("Case: 0", () {
        expect(lowerBound(arr, 0, compare: comp), 0);
      });
      test("Case: 1", () {
        expect(lowerBound(arr, 1, compare: comp), 1);
      });
      test("Case: 2", () {
        expect(lowerBound(arr, 2, compare: comp), 1);
      });
      test("Case: 3", () {
        expect(lowerBound(arr, 3, compare: comp), 3);
      });
      test("Case: 4", () {
        expect(lowerBound(arr, 4, compare: comp), 3);
      });
      test("Case: 5", () {
        expect(lowerBound(arr, 5, compare: comp), 3);
      });
      test("Case: 6", () {
        expect(lowerBound(arr, 6, compare: comp), 6);
      });
      test("Case: 7", () {
        expect(lowerBound(arr, 7, compare: comp), 6);
      });
      test("Case: 8", () {
        expect(lowerBound(arr, 8, compare: comp), 8);
      });
      test("Case: 9", () {
        expect(lowerBound(arr, 9, compare: comp), 8);
      });
      test("Case: 10", () {
        expect(lowerBound(arr, 10, compare: comp), 8);
      });
      test("Case: 11", () {
        expect(lowerBound(arr, 11, compare: comp), 9);
      });
      test("Case: 12", () {
        expect(lowerBound(arr, 12, compare: comp), 10);
      });
      test("Case: 13", () {
        expect(lowerBound(arr, 13, compare: comp), 10);
      });
      test("Case: 100", () {
        expect(lowerBound(arr, 100, compare: comp), 10);
      });
    });

    group('Test start and count', () {
      final arr = [0, 0, 0, 0, 0];
      test("Case: find 0 start -10", () {
        expect(lowerBound(arr, 0, compare: comp, start: -10), 0);
      });
      test("Case: find 0 start 2", () {
        expect(lowerBound(arr, 0, compare: comp, start: 2), 2);
      });
      test("Case: find 0 start 4", () {
        expect(lowerBound(arr, 0, compare: comp, start: 4), 4);
      });
      test("Case: find 0 start 5", () {
        expect(lowerBound(arr, 0, compare: comp, start: 5), 5);
      });
      test("Case: find 0 start 10", () {
        expect(lowerBound(arr, 0, compare: comp, start: 10), 5);
      });
      test("Case: find 1 start -10", () {
        expect(lowerBound(arr, 1, compare: comp, start: -10), 5);
      });
      test("Case: find 1 start 3", () {
        expect(lowerBound(arr, 1, compare: comp, start: 3), 5);
      });
      test("Case: find 1 start 10", () {
        expect(lowerBound(arr, 1, compare: comp, start: 10), 5);
      });

      test("Case: find 0 count 0", () {
        expect(lowerBound(arr, 0, compare: comp, count: 0), 0);
      });
      test("Case: find 1 count 0", () {
        expect(lowerBound(arr, 1, compare: comp, count: 0), 0);
      });
      test("Case: find 1 count 1", () {
        expect(lowerBound(arr, 1, compare: comp, count: 1), 1);
      });
      test("Case: find 1 count 3", () {
        expect(lowerBound(arr, 1, compare: comp, count: 3), 3);
      });
      test("Case: find 1 count 5", () {
        expect(lowerBound(arr, 1, compare: comp, count: 5), 5);
      });
      test("Case: find 1 count 6", () {
        expect(lowerBound(arr, 1, compare: comp, count: 6), 5);
      });
      test("Case: find 1 count 10", () {
        expect(lowerBound(arr, 1, compare: comp, count: 10), 5);
      });

      test("Case: find 1 start 2 count 0", () {
        expect(lowerBound(arr, 1, compare: comp, start: 2, count: 0), 2);
      });
      test("Case: find 1 start 2 count 1", () {
        expect(lowerBound(arr, 1, compare: comp, start: 2, count: 1), 3);
      });
      test("Case: find 1 start 2 count 3", () {
        expect(lowerBound(arr, 1, compare: comp, start: 2, count: 3), 5);
      });
      test("Case: find 1 start 2 count 5", () {
        expect(lowerBound(arr, 1, compare: comp, start: 2, count: 5), 5);
      });
      test("Case: find 1 start 2 count 10", () {
        expect(lowerBound(arr, 1, compare: comp, start: 2, count: 10), 5);
      });
      test("Case: find 1 start -1 count 2", () {
        expect(lowerBound(arr, 1, compare: comp, start: -1, count: 2), 1);
      });
      test("Case: find 1 start -10 count 300", () {
        expect(lowerBound(arr, 1, compare: comp, start: -10, count: 300), 5);
      });
      test("Case: find 0 start -10 count 3", () {
        expect(lowerBound(arr, 0, compare: comp, start: -10, count: 3), -7);
      });
      test("Case: find 0 start -10 count 0", () {
        expect(lowerBound(arr, 0, compare: comp, start: -10, count: 0), -10);
      });
      test("Case: find 0 start -10 count 100", () {
        expect(lowerBound(arr, 0, compare: comp, start: -10, count: 100), 0);
      });
    });
  });
}
