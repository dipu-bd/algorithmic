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

  group('lowerBoundBy()', () {
    group('Check if errors are thrown', () {
      test("Case: negative count", () {
        expect(() => lowerBoundBy([1], (int e) => e < 1, count: -1),
            throwsA(TypeMatcher<RangeError>()));
      });
    });

    group('Test [0, 0, 0, 0, 0]', () {
      final arr = [0, 0, 0, 0, 0];
      test("Case: -10", () {
        expect(lowerBoundBy(arr, (int e) => e < -10), 0);
      });
      test("Case: -1", () {
        expect(lowerBoundBy(arr, (int e) => e < -1), 0);
      });
      test("Case: 0", () {
        expect(lowerBoundBy(arr, (int e) => e < 0), 0);
      });
      test("Case: 1", () {
        expect(lowerBoundBy(arr, (int e) => e < 1), 5);
      });
      test("Case: 10", () {
        expect(lowerBoundBy(arr, (int e) => e < 10), 5);
      });
    });

    group('Test [0, 2, 2, 5, 5, 5, 7, 7, 10, 11]', () {
      final arr = [0, 2, 2, 5, 5, 5, 7, 7, 10, 11];
      test("Case: -100", () {
        expect(lowerBoundBy(arr, (int e) => e < -100), 0);
      });
      test("Case: -10", () {
        expect(lowerBoundBy(arr, (int e) => e < -10), 0);
      });
      test("Case: -1", () {
        expect(lowerBoundBy(arr, (int e) => e < -1), 0);
      });
      test("Case: 0", () {
        expect(lowerBoundBy(arr, (int e) => e < 0), 0);
      });
      test("Case: 1", () {
        expect(lowerBoundBy(arr, (int e) => e < 1), 1);
      });
      test("Case: 2", () {
        expect(lowerBoundBy(arr, (int e) => e < 2), 1);
      });
      test("Case: 3", () {
        expect(lowerBoundBy(arr, (int e) => e < 3), 3);
      });
      test("Case: 4", () {
        expect(lowerBoundBy(arr, (int e) => e < 4), 3);
      });
      test("Case: 5", () {
        expect(lowerBoundBy(arr, (int e) => e < 5), 3);
      });
      test("Case: 6", () {
        expect(lowerBoundBy(arr, (int e) => e < 6), 6);
      });
      test("Case: 7", () {
        expect(lowerBoundBy(arr, (int e) => e < 7), 6);
      });
      test("Case: 8", () {
        expect(lowerBoundBy(arr, (int e) => e < 8), 8);
      });
      test("Case: 9", () {
        expect(lowerBoundBy(arr, (int e) => e < 9), 8);
      });
      test("Case: 10", () {
        expect(lowerBoundBy(arr, (int e) => e < 10), 8);
      });
      test("Case: 11", () {
        expect(lowerBoundBy(arr, (int e) => e < 11), 9);
      });
      test("Case: 12", () {
        expect(lowerBoundBy(arr, (int e) => e < 12), 10);
      });
      test("Case: 13", () {
        expect(lowerBoundBy(arr, (int e) => e < 13), 10);
      });
      test("Case: 100", () {
        expect(lowerBoundBy(arr, (int e) => e < 100), 10);
      });
    });

    group('Test start and count', () {
      final arr = [0, 0, 0, 0, 0];
      test("Case: find 0 start -10", () {
        expect(lowerBoundBy(arr, (int e) => e < 0, start: -10), 0);
      });
      test("Case: find 0 start 2", () {
        expect(lowerBoundBy(arr, (int e) => e < 0, start: 2), 2);
      });
      test("Case: find 0 start 4", () {
        expect(lowerBoundBy(arr, (int e) => e < 0, start: 4), 4);
      });
      test("Case: find 0 start 5", () {
        expect(lowerBoundBy(arr, (int e) => e < 0, start: 5), 5);
      });
      test("Case: find 0 start 10", () {
        expect(lowerBoundBy(arr, (int e) => e < 0, start: 10), 5);
      });
      test("Case: find 1 start -10", () {
        expect(lowerBoundBy(arr, (int e) => e < 1, start: -10), 5);
      });
      test("Case: find 1 start 3", () {
        expect(lowerBoundBy(arr, (int e) => e < 1, start: 3), 5);
      });
      test("Case: find 1 start 10", () {
        expect(lowerBoundBy(arr, (int e) => e < 1, start: 10), 5);
      });

      test("Case: find 0 count 0", () {
        expect(lowerBoundBy(arr, (int e) => e < 0, count: 0), 0);
      });
      test("Case: find 1 count 0", () {
        expect(lowerBoundBy(arr, (int e) => e < 1, count: 0), 0);
      });
      test("Case: find 1 count 1", () {
        expect(lowerBoundBy(arr, (int e) => e < 1, count: 1), 1);
      });
      test("Case: find 1 count 3", () {
        expect(lowerBoundBy(arr, (int e) => e < 1, count: 3), 3);
      });
      test("Case: find 1 count 5", () {
        expect(lowerBoundBy(arr, (int e) => e < 1, count: 5), 5);
      });
      test("Case: find 1 count 6", () {
        expect(lowerBoundBy(arr, (int e) => e < 1, count: 6), 5);
      });
      test("Case: find 1 count 10", () {
        expect(lowerBoundBy(arr, (int e) => e < 1, count: 10), 5);
      });

      test("Case: find 1 start 2 count 0", () {
        expect(lowerBoundBy(arr, (int e) => e < 1, start: 2, count: 0), 2);
      });
      test("Case: find 1 start 2 count 1", () {
        expect(lowerBoundBy(arr, (int e) => e < 1, start: 2, count: 1), 3);
      });
      test("Case: find 1 start 2 count 3", () {
        expect(lowerBoundBy(arr, (int e) => e < 1, start: 2, count: 3), 5);
      });
      test("Case: find 1 start 2 count 5", () {
        expect(lowerBoundBy(arr, (int e) => e < 1, start: 2, count: 5), 5);
      });
      test("Case: find 1 start 2 count 10", () {
        expect(lowerBoundBy(arr, (int e) => e < 1, start: 2, count: 10), 5);
      });
      test("Case: find 1 start -1 count 2", () {
        expect(lowerBoundBy(arr, (int e) => e < 1, start: -1, count: 2), 1);
      });
      test("Case: find 1 start -10 count 300", () {
        expect(lowerBoundBy(arr, (int e) => e < 1, start: -10, count: 300), 5);
      });
      test("Case: find 0 start -10 count 3", () {
        expect(lowerBoundBy(arr, (int e) => e < 0, start: -10, count: 3), -7);
      });
      test("Case: find 0 start -10 count 0", () {
        expect(lowerBoundBy(arr, (int e) => e < 0, start: -10, count: 0), -10);
      });
      test("Case: find 0 start -10 count 100", () {
        expect(lowerBoundBy(arr, (int e) => e < 0, start: -10, count: 100), 0);
      });
    });
  });

}
