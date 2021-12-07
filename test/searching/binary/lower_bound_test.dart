import 'package:test/test.dart';
import 'package:algorithmic/searching.dart';

void main() {
  group('lowerBound()', () {
    test('Check if type errors are thrown on invalid types', () {
      expect(lowerBound([1], '1'), -1);
      expect(lowerBound(['1'], 1), -1);
      expect(lowerBound(['1'], 1.0), -1);
    });

    group('Input: [0, 2, 2, 5, 5, 5, 7, 7, 10, 11]', () {
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
  });
}
