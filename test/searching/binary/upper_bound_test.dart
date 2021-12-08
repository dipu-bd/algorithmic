import 'package:test/test.dart';
import 'package:algorithmic/searching.dart';

void main() {
  group('upperBound()', () {
    group('Check if errors are thrown', () {
      test("Case: int vs. string", () {
        expect(() => upperBound([1], '1'), throwsA(TypeMatcher<TypeError>()));
      });
      test("Case: String vs. int", () {
        expect(() => upperBound(['1'], 1), throwsA(TypeMatcher<TypeError>()));
      });
      test("Case: String vs. double", () {
        expect(() => upperBound(['1'], 1.0), throwsA(TypeMatcher<TypeError>()));
      });
      test("Case: negative count", () {
        expect(() => upperBound([1], 1, count: -1),
            throwsA(TypeMatcher<RangeError>()));
      });
    });

    group('Test [0, 0, 0, 0, 0]', () {
      final arr = [0, 0, 0, 0, 0];

      test("Case: -10", () {
        expect(upperBound(arr, -10), 0);
      });
      test("Case: -1", () {
        expect(upperBound(arr, -1), 0);
      });
      test("Case: 0", () {
        expect(upperBound(arr, 0), 5);
      });
      test("Case: 1", () {
        expect(upperBound(arr, 1), 5);
      });
      test("Case: 10", () {
        expect(upperBound(arr, 10), 5);
      });
    });

    group('Test [0, 2, 2, 5, 5, 5, 7, 7, 10, 11]', () {
      final arr = [0, 2, 2, 5, 5, 5, 7, 7, 10, 11];

      test("Case: -100", () {
        expect(upperBound(arr, -100), 0);
      });
      test("Case: -10", () {
        expect(upperBound(arr, -10), 0);
      });
      test("Case: -1", () {
        expect(upperBound(arr, -1), 0);
      });
      test("Case: 0", () {
        expect(upperBound(arr, 0), 1);
      });
      test("Case: 1", () {
        expect(upperBound(arr, 1), 1);
      });
      test("Case: 2", () {
        expect(upperBound(arr, 2), 3);
      });
      test("Case: 3", () {
        expect(upperBound(arr, 3), 3);
      });
      test("Case: 4", () {
        expect(upperBound(arr, 4), 3);
      });
      test("Case: 5", () {
        expect(upperBound(arr, 5), 6);
      });
      test("Case: 6", () {
        expect(upperBound(arr, 6), 6);
      });
      test("Case: 7", () {
        expect(upperBound(arr, 7), 8);
      });
      test("Case: 8", () {
        expect(upperBound(arr, 8), 8);
      });
      test("Case: 9", () {
        expect(upperBound(arr, 9), 8);
      });
      test("Case: 10", () {
        expect(upperBound(arr, 10), 9);
      });
      test("Case: 11", () {
        expect(upperBound(arr, 11), 10);
      });
      test("Case: 12", () {
        expect(upperBound(arr, 12), 10);
      });
      test("Case: 13", () {
        expect(upperBound(arr, 13), 10);
      });
      test("Case: 100", () {
        expect(upperBound(arr, 100), 10);
      });
    });

    group('Test start and count', () {
      final arr = [0, 2, 2, 5, 5, 5, 7, 7, 10, 11];
      test("Case: 5 start -10", () {
        expect(upperBound(arr, 5, start: -10), 6);
      });
      test("Case: 5 start 7", () {
        expect(upperBound(arr, 5, start: 7), 7);
      });
      test("Case: 5 start 100)", () {
        expect(upperBound(arr, 5, start: 100), 10);
      });
      test("Case: 5 count 0", () {
        expect(upperBound(arr, 5, count: 0), 0);
      });
      test("Case: 5 count 5", () {
        expect(upperBound(arr, 5, count: 5), 5);
      });
      test("Case: 5 count 8", () {
        expect(upperBound(arr, 5, count: 8), 6);
      });
      test("Case: 5 count 100", () {
        expect(upperBound(arr, 5, count: 100), 6);
      });
      test("Case: 5 start 3 count 2", () {
        expect(upperBound(arr, 5, start: 3, count: 2), 5);
      });
      test("Case: 5 start 3 count 100", () {
        expect(upperBound(arr, 5, start: 3, count: 100), 6);
      });
      test("Case: 5 start 8 count 100", () {
        expect(upperBound(arr, 5, start: 8, count: 100), 8);
      });
      test("Case: 5 start -100 count 5", () {
        expect(upperBound(arr, 5, start: -100, count: 5), -95);
      });
      test("Case: 5 start -100 count 8", () {
        expect(upperBound(arr, 5, start: -100, count: 8), -92);
      });
      test("Case: 5 start -100 count 100", () {
        expect(upperBound(arr, 5, start: -100, count: 100), 0);
      });
      test("Case: 5 start -100 count 106", () {
        expect(upperBound(arr, 5, start: -100, count: 106), 6);
      });
      test("Case: 3 start -100 count 106", () {
        expect(upperBound(arr, 3, start: -100, count: 106), 3);
      });
    });
  });

  group('upperBound() with [compare]', () {
    final compare = ((int a, int b) => a - b);

    group('Test [0, 0, 0, 0, 0]', () {
      final arr = [0, 0, 0, 0, 0];

      test("Case: -10", () {
        expect(upperBound(arr, -10, compare: compare), 0);
      });
      test("Case: -1", () {
        expect(upperBound(arr, -1, compare: compare), 0);
      });
      test("Case: 0", () {
        expect(upperBound(arr, 0, compare: compare), 5);
      });
      test("Case: 1", () {
        expect(upperBound(arr, 1, compare: compare), 5);
      });
      test("Case: 10", () {
        expect(upperBound(arr, 10, compare: compare), 5);
      });
    });

    group('Test [0, 2, 2, 5, 5, 5, 7, 7, 10, 11]', () {
      final arr = [0, 2, 2, 5, 5, 5, 7, 7, 10, 11];

      test("Case: -100", () {
        expect(upperBound(arr, -100, compare: compare), 0);
      });
      test("Case: -10", () {
        expect(upperBound(arr, -10, compare: compare), 0);
      });
      test("Case: -1", () {
        expect(upperBound(arr, -1, compare: compare), 0);
      });
      test("Case: 0", () {
        expect(upperBound(arr, 0, compare: compare), 1);
      });
      test("Case: 1", () {
        expect(upperBound(arr, 1, compare: compare), 1);
      });
      test("Case: 2", () {
        expect(upperBound(arr, 2, compare: compare), 3);
      });
      test("Case: 3", () {
        expect(upperBound(arr, 3, compare: compare), 3);
      });
      test("Case: 4", () {
        expect(upperBound(arr, 4, compare: compare), 3);
      });
      test("Case: 5", () {
        expect(upperBound(arr, 5, compare: compare), 6);
      });
      test("Case: 6", () {
        expect(upperBound(arr, 6, compare: compare), 6);
      });
      test("Case: 7", () {
        expect(upperBound(arr, 7, compare: compare), 8);
      });
      test("Case: 8", () {
        expect(upperBound(arr, 8, compare: compare), 8);
      });
      test("Case: 9", () {
        expect(upperBound(arr, 9, compare: compare), 8);
      });
      test("Case: 10", () {
        expect(upperBound(arr, 10, compare: compare), 9);
      });
      test("Case: 11", () {
        expect(upperBound(arr, 11, compare: compare), 10);
      });
      test("Case: 12", () {
        expect(upperBound(arr, 12, compare: compare), 10);
      });
      test("Case: 13", () {
        expect(upperBound(arr, 13, compare: compare), 10);
      });
      test("Case: 100", () {
        expect(upperBound(arr, 100, compare: compare), 10);
      });
    });

    group('Test start and count', () {
      final arr = [0, 2, 2, 5, 5, 5, 7, 7, 10, 11];
      test("Case: 5 start -10", () {
        expect(upperBound(arr, 5, compare: compare, start: -10), 6);
      });
      test("Case: 5 start 7", () {
        expect(upperBound(arr, 5, compare: compare, start: 7), 7);
      });
      test("Case: 5 start 100)", () {
        expect(upperBound(arr, 5, compare: compare, start: 100), 10);
      });
      test("Case: 5 count 0", () {
        expect(upperBound(arr, 5, compare: compare, count: 0), 0);
      });
      test("Case: 5 count 5", () {
        expect(upperBound(arr, 5, compare: compare, count: 5), 5);
      });
      test("Case: 5 count 8", () {
        expect(upperBound(arr, 5, compare: compare, count: 8), 6);
      });
      test("Case: 5 count 100", () {
        expect(upperBound(arr, 5, compare: compare, count: 100), 6);
      });
      test("Case: 5 start 3 count 2", () {
        expect(upperBound(arr, 5, compare: compare, start: 3, count: 2), 5);
      });
      test("Case: 5 start 3 count 100", () {
        expect(upperBound(arr, 5, compare: compare, start: 3, count: 100), 6);
      });
      test("Case: 5 start 8 count 100", () {
        expect(upperBound(arr, 5, compare: compare, start: 8, count: 100), 8);
      });
      test("Case: 5 start -100 count 5", () {
        expect(upperBound(arr, 5, compare: compare, start: -100, count: 5), -95);
      });
      test("Case: 5 start -100 count 8", () {
        expect(upperBound(arr, 5, compare: compare, start: -100, count: 8), -92);
      });
      test("Case: 5 start -100 count 100", () {
        expect(
            upperBound(arr, 5, compare: compare, start: -100, count: 100), 0);
      });
    });
  });
}
