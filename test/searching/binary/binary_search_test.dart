import 'package:test/test.dart';
import 'package:algorithmic/searching.dart';

void main() {
  group('binarySearch()', () {
    test('Check if type errors are thrown on invalid types', () {
      expect(binarySearch([1, 2, 3], '1'), -1);
      expect(binarySearch(['1'], 1), -1);
      expect(binarySearch(['1'], 1.0), -1);
    });
    test('Find items from an integer array', () {
      var arr = List<int>.generate(10, (i) => i);
      expect(binarySearch(arr, -20), -1);
      expect(binarySearch(arr, 20), -1);
      for (int i = 0; i < 10; ++i) {
        expect(binarySearch(arr, i), i);
      }
      expect(binarySearch(arr, 10), -1);
      expect(binarySearch(arr, -1), -1);
      expect(binarySearch(arr, -10), -1);
      expect(binarySearch(arr, 5.0), 5);
      expect(binarySearch(arr, 5.0 + 1e-10), -1);
      expect(binarySearch(arr, 5.0 + 1e-30), 5);
      expect(binarySearch(arr, -0.0), -1);
      expect(binarySearch(arr, 0.0), 0);
    });
    test('Find items from list containing similar values 1', () {
      var arr = [0, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4];
      expect(binarySearch(arr, -1), -1);
      expect(binarySearch(arr, 0), 0);
      expect(binarySearch(arr, 1), 1);
      expect(binarySearch(arr, 2), 4);
      expect(binarySearch(arr, 3), 10);
      expect(binarySearch(arr, 4), 15);
      expect(binarySearch(arr, 5), -1);
    });
    test('Find items from list containing similar values 2', () {
      var arr = [1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 5];
      expect(binarySearch(arr, 0), -1);
      expect(binarySearch(arr, 1), 0);
      expect(binarySearch(arr, 2), 4);
      expect(binarySearch(arr, 3), 10);
      expect(binarySearch(arr, 4), 15);
      expect(binarySearch(arr, 5), 18);
    });
    test('Find items from list containing similar values 3', () {
      var arr = [1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 5];
      final comp = ((int a, int b) => a - b);
      expect(binarySearch(arr, 0, compare: comp), -1);
      expect(binarySearch(arr, 1, compare: comp), 0);
      expect(binarySearch(arr, 2, compare: comp), 4);
      expect(binarySearch(arr, 3, compare: comp), 10);
      expect(binarySearch(arr, 4, compare: comp), 15);
      expect(binarySearch(arr, 5, compare: comp), 18);
    });
    test('Find items from a floating point array', () {
      var arr = List<double>.generate(10, (i) => i - 5.5);
      for (int i = 0; i < 10; ++i) {
        expect(binarySearch(arr, i - 5.5), i);
      }
      expect(binarySearch(arr, -4.5 - 1e-10), -1);
      expect(binarySearch(arr, -4.5 + 1e-10), -1);
      expect(binarySearch(arr, -.5), 5);
      expect(binarySearch(arr, .5), 6);
      expect(binarySearch(arr, 10), -1);
      expect(binarySearch(arr, -10), -1);
      expect(binarySearch(arr, -6), -1);
      expect(binarySearch(arr, 6), -1);
    });
    test('Find items from a string array', () {
      var arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k'];
      expect(binarySearch(arr, 'a'), 0);
      expect(binarySearch(arr, 'd'), 3);
      expect(binarySearch(arr, 'k'), arr.length - 1);
    });
    test('Find items from an empty array', () {
      expect(binarySearch(<int>[], 2), -1);
      expect(binarySearch(<double>[], 2.0), -1);
      expect(binarySearch(<String>[], '1.0'), -1);
    });
    test('Find items using custom offset', () {
      var arr = List<int>.generate(100, (i) => (i / 10).floor());
      expect(binarySearch(arr, 1, offset: -100), 10);
      expect(binarySearch(arr, 1, offset: -1), 10);
      expect(binarySearch(arr, 1, offset: 1), 10);
      expect(binarySearch(arr, 1, offset: 2), 10);
      expect(binarySearch(arr, 1, offset: 10), 10);
      expect(binarySearch(arr, 1, offset: 20), -1);
      expect(binarySearch(arr, 9, offset: 47), 90);
    });
    test('Find items using custom count', () {
      var arr = List<int>.generate(100, (i) => (i / 10).floor());
      expect(binarySearch(arr, 1, count: 10), -1);
      expect(binarySearch(arr, 0, count: 1), 0);
      expect(binarySearch(arr, 1, count: 0), -1);
      expect(binarySearch(arr, 1, count: 2), -1);
      expect(binarySearch(arr, 1, count: 3), -1);
      expect(binarySearch(arr, 1, count: 11), 10);
      expect(binarySearch(arr, 1, count: -1), -1);
    });
    test('Find items using both custom offset and count', () {
      var arr = List<int>.generate(100, (i) => (i / 10).floor());
      expect(binarySearch(arr, 1, offset: 8, count: 0), -1);
      expect(binarySearch(arr, 1, offset: 8, count: 1), -1);
      expect(binarySearch(arr, 1, offset: 8, count: 2), -1);
      expect(binarySearch(arr, 1, offset: 8, count: 3), 10);
      expect(binarySearch(arr, 1, offset: 10, count: 0), -1);
      expect(binarySearch(arr, 1, offset: 10, count: 1), 10);
      expect(binarySearch(arr, 1, offset: 11, count: -1), -1);
      expect(binarySearch(arr, 1, offset: 12, count: -2), -1);
      expect(binarySearch(arr, 1, offset: 30, count: 1), -1);
      expect(binarySearch(arr, 0, offset: -30, count: 1), -1);
      expect(binarySearch(arr, 0, offset: -30, count: 30), -1);
      expect(binarySearch(arr, 0, offset: -30, count: 31), 0);
      expect(binarySearch(arr, 1, offset: -30, count: 40), -1);
      expect(binarySearch(arr, 1, offset: -30, count: 41), 10);
    });
    test('Find items using both custom offset and count and comparator', () {
      var arr = List<int>.generate(100, (i) => (i / 10).floor());
      final comp = ((int a, int b) => a - b);
      expect(binarySearch(arr, 1, offset: 8, count: 0, compare: comp), -1);
      expect(binarySearch(arr, 1, offset: 8, count: 1, compare: comp), -1);
      expect(binarySearch(arr, 1, offset: 8, count: 2, compare: comp), -1);
      expect(binarySearch(arr, 1, offset: 8, count: 3, compare: comp), 10);
      expect(binarySearch(arr, 1, offset: 10, count: 0, compare: comp), -1);
      expect(binarySearch(arr, 1, offset: 10, count: 1, compare: comp), 10);
      expect(binarySearch(arr, 1, offset: 11, count: -1, compare: comp), -1);
      expect(binarySearch(arr, 1, offset: 12, count: -2, compare: comp), -1);
      expect(binarySearch(arr, 1, offset: 30, count: 1, compare: comp), -1);
      expect(binarySearch(arr, 0, offset: -30, count: 1, compare: comp), -1);
      expect(binarySearch(arr, 0, offset: -30, count: 30, compare: comp), -1);
      expect(binarySearch(arr, 0, offset: -30, count: 31, compare: comp), 0);
      expect(binarySearch(arr, 1, offset: -30, count: 40, compare: comp), -1);
      expect(binarySearch(arr, 1, offset: -30, count: 41, compare: comp), 10);
    });
  });
}
