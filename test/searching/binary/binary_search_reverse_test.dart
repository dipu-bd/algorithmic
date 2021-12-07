import 'package:test/test.dart';
import 'package:algorithmic/searching.dart';

void main() {
  group('binarySearchReversed()', () {
    test('Check if type errors are thrown on invalid types', () {
      expect(binarySearchReversed([1, 2, 3], '1'), -1);
      expect(binarySearchReversed(['1'], 1), -1);
      expect(binarySearchReversed(['1'], 1.0), -1);
    });
    test('Find items from an integer array', () {
      var arr = List<int>.generate(10, (i) => i);
      expect(binarySearchReversed(arr, -20), -1);
      expect(binarySearchReversed(arr, 20), -1);
      for (int i = 0; i < 10; ++i) {
        expect(binarySearchReversed(arr, i), i);
      }
      expect(binarySearchReversed(arr, 10), -1);
      expect(binarySearchReversed(arr, -1), -1);
      expect(binarySearchReversed(arr, -10), -1);
      expect(binarySearchReversed(arr, 5.0), 5);
      expect(binarySearchReversed(arr, 5.0 + 1e-10), -1);
      expect(binarySearchReversed(arr, 5.0 + 1e-30), 5);
      expect(binarySearchReversed(arr, -0.0), -1);
      expect(binarySearchReversed(arr, 0.0), 0);
    });
    test('Find items from a floating point array', () {
      var arr = List<double>.generate(10, (i) => i - 5.5);
      for (int i = 0; i < 10; ++i) {
        expect(binarySearchReversed(arr, i - 5.5), i);
      }
      expect(binarySearchReversed(arr, -4.5 - 1e-10), -1);
      expect(binarySearchReversed(arr, -4.5 + 1e-10), -1);
      expect(binarySearchReversed(arr, -.5), 5);
      expect(binarySearchReversed(arr, .5), 6);
      expect(binarySearchReversed(arr, 10), -1);
      expect(binarySearchReversed(arr, -10), -1);
      expect(binarySearchReversed(arr, -6), -1);
      expect(binarySearchReversed(arr, 6), -1);
    });
    test('Find items from a string array', () {
      var arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k'];
      expect(binarySearchReversed(arr, 'a'), 0);
      expect(binarySearchReversed(arr, 'd'), 3);
      expect(binarySearchReversed(arr, 'k'), arr.length - 1);
    });
    test('Find items from an empty array', () {
      expect(binarySearchReversed(<int>[], 2), -1);
      expect(binarySearchReversed(<double>[], 2.0), -1);
      expect(binarySearchReversed(<String>[], '1.0'), -1);
    });
    test('Find items from list containing similar values 1', () {
      var arr = [0, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4];
      expect(binarySearchReversed(arr, -1), -1);
      expect(binarySearchReversed(arr, 0), 0);
      expect(binarySearchReversed(arr, 1), 3);
      expect(binarySearchReversed(arr, 2), 9);
      expect(binarySearchReversed(arr, 3), 14);
      expect(binarySearchReversed(arr, 4), 18);
      expect(binarySearchReversed(arr, 5), -1);
    });
    test('Find items from list containing similar values 2', () {
      var arr = [1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4, 5];
      expect(binarySearchReversed(arr, 0), -1);
      expect(binarySearchReversed(arr, 1), 2);
      expect(binarySearchReversed(arr, 5), 18);
      expect(binarySearchReversed(arr, 6), -1);
    });
    test('Find items from list containing similar values 3', () {
      var arr = [1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4, 5];
      final comp = ((int a, int b) => a - b);
      expect(binarySearchReversed(arr, 0, compare: comp), -1);
      expect(binarySearchReversed(arr, 1, compare: comp), 2);
      expect(binarySearchReversed(arr, 5, compare: comp), 18);
      expect(binarySearchReversed(arr, 6, compare: comp), -1);
    });
    test('Find items using custom offset', () {
      var arr = List<int>.generate(100, (i) => (i / 10).floor());
      expect(binarySearchReversed(arr, 1, offset: -100), -1);
      expect(binarySearchReversed(arr, 1, offset: -1), -1);
      expect(binarySearchReversed(arr, 1, offset: 100), 19);
      expect(binarySearchReversed(arr, 1, offset: 1), -1);
      expect(binarySearchReversed(arr, 1, offset: 10), 10);
      expect(binarySearchReversed(arr, 1, offset: 9), -1);
      expect(binarySearchReversed(arr, 1, offset: 15), 15);
      expect(binarySearchReversed(arr, 1, offset: 19), 19);
      expect(binarySearchReversed(arr, 1, offset: 20), 19);
      expect(binarySearchReversed(arr, 1, offset: 5000), 19);
    });
    test('Find items using custom count', () {
      var arr = List<int>.generate(100, (i) => (i / 10).floor());
      expect(binarySearchReversed(arr, 1, count: 80), -1); // offset = 99
      expect(binarySearchReversed(arr, 0, count: 1), -1);
      expect(binarySearchReversed(arr, 1, count: 10), -1);
      expect(binarySearchReversed(arr, 1, count: 0), -1);
      expect(binarySearchReversed(arr, 1, count: 2), -1);
      expect(binarySearchReversed(arr, 1, count: 3), -1);
      expect(binarySearchReversed(arr, 1, count: 79), -1); // offset = 99
      expect(binarySearchReversed(arr, 1, count: 81), 19); // offset = 99
      expect(binarySearchReversed(arr, 1, count: -1), -1);
    });
    test('Find items using both custom offset and count', () {
      var arr = List<int>.generate(100, (i) => (i / 10).floor());
      expect(binarySearchReversed(arr, 1, offset: 8, count: 0), -1);
      expect(binarySearchReversed(arr, 1, offset: 8, count: 1), -1);
      expect(binarySearchReversed(arr, 1, offset: 8, count: 2), -1);
      expect(binarySearchReversed(arr, 1, offset: 8, count: 3), -1);
      expect(binarySearchReversed(arr, 1, offset: 13, count: 3), 13);
      expect(binarySearchReversed(arr, 1, offset: 10, count: 0), -1);
      expect(binarySearchReversed(arr, 1, offset: 10, count: 1), 10);
      expect(binarySearchReversed(arr, 1, offset: 11, count: -1), -1);
      expect(binarySearchReversed(arr, 1, offset: 12, count: -2), -1);
      expect(binarySearchReversed(arr, 1, offset: 30, count: 1), -1);
      expect(binarySearchReversed(arr, 0, offset: 30, count: 1), -1);
      expect(binarySearchReversed(arr, 0, offset: 30, count: 30), 9);
      expect(binarySearchReversed(arr, 0, offset: 30, count: 20), -1);
      expect(binarySearchReversed(arr, 0, offset: 30, count: 21), -1);
      expect(binarySearchReversed(arr, 0, offset: 30, count: 22), 9);
      expect(binarySearchReversed(arr, 0, offset: -2, count: 10), -1);
    });
  });
}
