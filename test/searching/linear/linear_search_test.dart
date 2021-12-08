import 'dart:collection';

import 'package:test/test.dart';
import 'package:algorithmic/searching.dart';

void main() {
  group('linearSearch()', () {
    group("Test [0, 3, 8, 1, 5]", () {
      final list = <int>[0, 3, 8, 1, 5];
      test("Case: -1", () {
        expect(linearSearch(list, -1), -1);
      });
      test("Case: 0", () {
        expect(linearSearch(list, 0), 0);
      });
      test("Case: 1", () {
        expect(linearSearch(list, 1), 3);
      });
      test("Case: 2", () {
        expect(linearSearch(list, 2), -1);
      });
      test("Case: 3", () {
        expect(linearSearch(list, 3), 1);
      });
      test("Case: 4", () {
        expect(linearSearch(list, 4), -1);
      });
      test("Case: 5", () {
        expect(linearSearch(list, 5), 4);
      });
      test("Case: 8", () {
        expect(linearSearch(list, 8), 2);
      });
      test("Case: 10", () {
        expect(linearSearch(list, 10), -1);
      });
    });

    group("Test with unmodifiable list", () {
      final list = <int>[0, 3, 8, 1, 5];
      final unmodifiable = UnmodifiableListView(list);

      test("Case: List<int>", () {
        expect(linearSearch(list, 1), 3);
      });
      test("Case: UnmodifiableListView<int>", () {
        expect(linearSearch(unmodifiable, 1), 3);
      });
    });

    group("Test [0, 0, 0, 1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4]", () {
      final list = <int>[0, 0, 0, 1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4];
      test("Case: find 1 start -100", () {
        expect(linearSearch(list, 1, start: -100), 3);
      });
      test("Case: find 1 start -1", () {
        expect(linearSearch(list, 1, start: -1), 3);
      });
      test("Case: find 1 start 2", () {
        expect(linearSearch(list, 1, start: 2), 3);
      });
      test("Case: find 1 start 3", () {
        expect(linearSearch(list, 1, start: 3), 3);
      });
      test("Case: find 1 start 4", () {
        expect(linearSearch(list, 1, start: 4), 4);
      });
      test("Case: find 1 start 5", () {
        expect(linearSearch(list, 1, start: 5), 5);
      });
      test("Case: find 1 start 6", () {
        expect(linearSearch(list, 1, start: 6), -1);
      });
      test("Case: find 1 start 14", () {
        expect(linearSearch(list, 4, start: 14), 14);
      });
      test("Case: find 1 start 15", () {
        expect(linearSearch(list, 4, start: 15), -1);
      });
      test("Case: find 1 start 100", () {
        expect(linearSearch(list, 1, start: 100), -1);
      });

      test("Case: find 2 count -100", () {
        expect(linearSearch(list, 2, count: -100), -1);
      });
      test("Case: find 2 count -1", () {
        expect(linearSearch(list, 2, count: -1), -1);
      });
      test("Case: find 2 count 0", () {
        expect(linearSearch(list, 2, count: 0), -1);
      });
      test("Case: find 2 count 5", () {
        expect(linearSearch(list, 2, count: 5), -1);
      });
      test("Case: find 2 count 6", () {
        expect(linearSearch(list, 2, count: 6), -1);
      });
      test("Case: find 2 count 7", () {
        expect(linearSearch(list, 2, count: 7), 6);
      });
      test("Case: find 2 count 10", () {
        expect(linearSearch(list, 2, count: 10), 6);
      });
      test("Case: find 2 count 100", () {
        expect(linearSearch(list, 2, count: 100), 6);
      });

      test("Case: find 1 start 4 count 0", () {
        expect(linearSearch(list, 1, start: 4, count: 0), -1);
      });
      test("Case: find 1 start 4 count -1", () {
        expect(linearSearch(list, 1, start: 4, count: -1), -1);
      });
      test("Case: find 1 start 4 count 1", () {
        expect(linearSearch(list, 1, start: 4, count: 1), 4);
      });
      test("Case: find 1 start 4 count 100", () {
        expect(linearSearch(list, 1, start: 4, count: 100), 4);
      });
      test("Case: find 1 start -10 count 100", () {
        expect(linearSearch(list, 1, start: -10, count: 100), 3);
      });
      test("Case: find 1 start -1 count 100", () {
        expect(linearSearch(list, 1, start: -1, count: 100), 3);
      });
    });

    group("Test [2, 1, '1', -0.0, 2.0, false]", () {
      final list = [2, 1, '1', -0.0, 0, 2.0, false];
      test("Case: false", () {
        expect(linearSearch(list, false), 6);
      });
      test("Case: '1'", () {
        expect(linearSearch(list, '1'), 2);
      });
      test("Case: 2", () {
        expect(linearSearch(list, 2), 0);
      });
      test("Case: 2.0", () {
        expect(linearSearch(list, 2.0), 0);
      });
      test("Case: 0.0", () {
        expect(linearSearch(list, 0.0), 3);
      });
      test("Case: 0", () {
        expect(linearSearch(list, 0), 3);
      });
      test("Case: -0.0", () {
        expect(linearSearch(list, -0.0), 3);
      });
    });
  });
}
