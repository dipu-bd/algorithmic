import 'package:test/test.dart';
import 'package:algorithmic/searching.dart';

void main() {
  group('upperBound()', () {
    test('Check if type errors are thrown on invalid types', () {
      expect(upperBound([1], '1'), -1);
      expect(upperBound(['1'], 1), -1);
      expect(upperBound(['1'], 1.0), -1);
    });

    group('Input: [0, 2, 2, 5, 5, 5, 7, 7, 10, 11]', () {
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
  });
}
