import 'package:test/test.dart';
import 'package:algorithmic/searching.dart';

void main() {
  group('linearSearch()', () {
    test('Find items from an integer array', () {
      expect(linearSearch([1, 2, 3], 2), 1);
      expect(linearSearch([1, 2, 3], 2.0), 1);
      expect(linearSearch([0, 1, 3], true), -1);
    });
    test('Find items from a floating point array', () {
      expect(linearSearch([1.2, 4.6, 2.5, 4.5], 2.5), 2);
      expect(linearSearch([1.5, 2.0, 3.1], 2), 1);
      expect(linearSearch([0.0, -1.0, 3.1], true), -1);
      expect(linearSearch([-0.0, 0.0, 3.1], 0.0), 0);
      expect(linearSearch([0.0, 0.0, 3.1], 0.0), 0);
    });
    test('Find items from a string array', () {
      final arr = ['1.2', '4.6', '5', '4.5'];
      expect(linearSearch(arr, '5'), 2);
      expect(linearSearch(arr, 5), -1);
      expect(linearSearch(arr, 1.2), -1);
      expect(linearSearch(arr, true), -1);
    });
    test('Find items from a boolean array', () {
      final arr = [true, false, false, true];
      expect(linearSearch(arr, false), 1);
      expect(linearSearch(arr, 1), -1);
      expect(linearSearch(arr, ''), -1);
      expect(linearSearch(arr, 0), -1);
    });
    test('Find items from an empty array', () {
      expect(linearSearch([], 2), -1);
      expect(linearSearch([], null), -1);
      expect(linearSearch([], []), -1);
      expect(linearSearch([], false), -1);
    });
    test('Find items using custom offset and count', () {
      final arr = [2, 2, 1, 1, 3, 3, 1];
      expect(linearSearch(arr, 1), 2);

      expect(linearSearch(arr, 1, offset: -100), 2);
      expect(linearSearch(arr, 1, offset: -1), 2);
      expect(linearSearch(arr, 1, offset: 1), 2);
      expect(linearSearch(arr, 1, offset: 2), 2);
      expect(linearSearch(arr, 1, offset: 100), -1);

      expect(linearSearch(arr, 1, count: 0), -1);
      expect(linearSearch(arr, 1, count: 2), -1);
      expect(linearSearch(arr, 1, count: 3), 2);
      expect(linearSearch(arr, 1, count: 100), 2);
      expect(linearSearch(arr, 1, count: -1), -1);
      expect(linearSearch(arr, 1, count: -10), -1);

      expect(linearSearch(arr, 1, offset: 1, count: 0), -1);
      expect(linearSearch(arr, 1, offset: 1, count: 1), -1);
      expect(linearSearch(arr, 1, offset: 1, count: 2), 2);
      expect(linearSearch(arr, 1, offset: 2, count: 0), -1);
      expect(linearSearch(arr, 1, offset: 2, count: 1), 2);
      expect(linearSearch(arr, 1, offset: 3, count: -1), -1);
      expect(linearSearch(arr, 1, offset: 5, count: -2), -1);
      expect(linearSearch(arr, 1, offset: 5, count: 1), -1);
      expect(linearSearch(arr, 1, offset: 5, count: 2), 6);
      expect(linearSearch(arr, 1, offset: 5, count: 100), 6);
      expect(linearSearch(arr, 1, offset: 7, count: -2), -1);
      expect(linearSearch(arr, 1, offset: -10, count: 2), -1);
      expect(linearSearch(arr, 1, offset: -10, count: 12), -1);
      expect(linearSearch(arr, 1, offset: -10, count: 13), 2);
      expect(linearSearch(arr, 1, offset: -100, count: 1000), 2);
    });
    test('Find items using an array of arrays', () {
      final arr = [
        [1],
        [2],
        [3],
      ];
      expect(linearSearch(arr, [3]), -1);
      expect(
          linearSearch(arr, [3], compare: (List a, List b) => a[0] - b[0]), 2);
    });
  });
  test('Find items using an array of objects', () {
    var arr = [
      {'v': 1},
      {'v': 2},
      {'v': 3}
    ];
    expect(linearSearch(arr, {'v': 3}), -1);
    expect(linearSearch(arr, arr[2]), 2);
    expect(
        linearSearch(arr, {'v': 3}, compare: (Map a, Map b) => a['v'] - b['v']),
        2);
  });

  group('linearSearchReversed()', () {
    test('Find items from an integer array', () {
      expect(linearSearchReversed([1, 2, 2, 3], 2), 2);
      expect(linearSearchReversed([1, 2, 2, 3], 2.0), 2);
      expect(linearSearchReversed([0, 1, 3, 0], true), -1);
    });
    test('Find items from a floating point array', () {
      expect(linearSearchReversed([1.2, 4.6, 2.5, 2.5], 2.5), 3);
    });
    test('Find items from a string array', () {
      final arr = ['1.2', '5', '5', '4.5'];
      expect(linearSearchReversed(arr, '5'), 2);
    });
    test('Find items from a boolean array', () {
      final arr = [true, false, false, true];
      expect(linearSearchReversed(arr, false), 2);
    });
    test('Find items from an empty array', () {
      expect(linearSearchReversed([], 2), -1);
      expect(linearSearchReversed([], null), -1);
      expect(linearSearchReversed([], []), -1);
      expect(linearSearchReversed([], false), -1);
    });
    test('Find items using custom offset and count', () {
      final arr = [2, 2, 1, 1, 3, 3, 1];
      expect(linearSearchReversed(arr, 1), 6);

      expect(linearSearchReversed(arr, 1, offset: -10), -1);
      expect(linearSearchReversed(arr, 1, offset: 1), -1);
      expect(linearSearchReversed(arr, 1, offset: 2), 2);
      expect(linearSearchReversed(arr, 1, offset: 100), 6);

      expect(linearSearchReversed(arr, 1, count: 0), -1);
      expect(linearSearchReversed(arr, 1, count: 1), 6);
      expect(linearSearchReversed(arr, 1, count: -1), -1);
      expect(linearSearchReversed(arr, 1, count: 100), 6);
      expect(linearSearchReversed(arr, 1, count: -100), -1);

      expect(linearSearchReversed(arr, 1, offset: 10, count: 0), -1);
      expect(linearSearchReversed(arr, 1, offset: 10, count: 4), -1);
      expect(linearSearchReversed(arr, 1, offset: 10, count: 5), 6);
      expect(linearSearchReversed(arr, 1, offset: 5, count: 100), 3);
      expect(linearSearchReversed(arr, 1, offset: -1, count: -10), -1);
      expect(linearSearchReversed(arr, 1, offset: -100, count: 1000), -1);
      expect(linearSearchReversed(arr, 1, offset: -100, count: -1000), -1);
    });
  });
}
