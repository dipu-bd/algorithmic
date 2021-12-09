import 'package:test/test.dart';
import 'package:trotter/trotter.dart';
import 'package:algorithmic/algorithmic.dart';

void main() {
  group("gnomeSort()", () {
    test("Test all permutations of [-3, -2, -1, 0, 1, 2]", () {
      final original = [-3, -2, -1, 0, 1, 2];
      final perms = Permutations(original.length, original);
      for (final list in perms()) {
        gnomeSort(list);
        expect(list, original);
      }
    });
    test("Test single element list", () {
      final list = [-2];
      gnomeSort(list);
      expect(list.length, 1);
      expect(list[0], -2);
    });
    test("Test [1, 2, 2, 4]", () {
      final list = [1, 2, 2, 4];
      gnomeSort(list);
      expect(list, [1, 2, 2, 4]);
    });
    test("Test [1, 2, 2, 2]", () {
      final list = [1, 2, 2, 2];
      gnomeSort(list);
      expect(list, [1, 2, 2, 2]);
    });
    test("Test [2, 2, 2, 2]", () {
      final list = [2, 2, 2, 2];
      gnomeSort(list);
      expect(list, [2, 2, 2, 2]);
    });
    test("Test [2, 2, 2, 1]", () {
      final list = [2, 2, 2, 1];
      gnomeSort(list);
      expect(list, [1, 2, 2, 2]);
    });
    test("Test [1, 2, 2, 1]", () {
      final list = [1, 1, 2, 2];
      gnomeSort(list);
      expect(list, [1, 1, 2, 2]);
    });

    group("Test partial sorting", () {
      test("Case: begin at -10", () {
        final list = [8, 1, 3, 7, 3, 2];
        gnomeSort(list, begin: -10);
        expect(list, [1, 2, 3, 3, 7, 8]);
      });
      test("Case: begin at 2", () {
        final list = [8, 1, 3, 7, 3, 2];
        gnomeSort(list, begin: 2);
        expect(list, [8, 1, 2, 3, 3, 7]);
      });
      test("Case: begin at 5", () {
        final list = [8, 1, 3, 7, 3, 2];
        gnomeSort(list, begin: 5);
        expect(list, [8, 1, 3, 7, 3, 2]);
      });
      test("Case: begin at 10", () {
        final list = [8, 1, 3, 7, 3, 2];
        gnomeSort(list, begin: 10);
        expect(list, [8, 1, 3, 7, 3, 2]);
      });

      test("Case: end at -10", () {
        final list = [8, 1, 3, 7, 3, 2];
        gnomeSort(list, end: -10);
        expect(list, [8, 1, 3, 7, 3, 2]);
      });
      test("Case: end at -2", () {
        final list = [8, 1, 3, 7, 3, 2];
        gnomeSort(list, end: -2);
        expect(list, [1, 3, 7, 8, 3, 2]);
      });
      test("Case: end at 2", () {
        final list = [8, 1, 3, 7, 3, 2];
        gnomeSort(list, end: 2);
        expect(list, [1, 8, 3, 7, 3, 2]);
      });
      test("Case: end at 5", () {
        final list = [8, 1, 3, 7, 3, 2];
        gnomeSort(list, end: 5);
        expect(list, [1, 3, 3, 7, 8, 2]);
      });
      test("Case: end at 10", () {
        final list = [8, 1, 3, 7, 3, 2];
        gnomeSort(list, end: 10);
        expect(list, [1, 2, 3, 3, 7, 8]);
      });

      test("Case: begin at -10 end at -10", () {
        final list = [8, 1, 3, 7, 3, 2];
        gnomeSort(list, begin: -10, end: -10);
        expect(list, [8, 1, 3, 7, 3, 2]);
      });
      test("Case: begin at -10 end at 2", () {
        final list = [8, 1, 3, 7, 3, 2];
        gnomeSort(list, begin: -10, end: 2);
        expect(list, [1, 8, 3, 7, 3, 2]);
      });
      test("Case: begin at 2 end at -1", () {
        final list = [8, 1, 3, 7, 3, 2];
        gnomeSort(list, begin: 2, end: -1);
        expect(list, [8, 1, 3, 3, 7, 2]);
      });
      test("Case: begin at 2 end at 2", () {
        final list = [8, 1, 3, 7, 3, 2];
        gnomeSort(list, begin: 2, end: 2);
        expect(list, [8, 1, 3, 7, 3, 2]);
      });
      test("Case: begin at 4 end at 2", () {
        final list = [8, 1, 3, 7, 3, 2];
        gnomeSort(list, begin: 2, end: 2);
        expect(list, [8, 1, 3, 7, 3, 2]);
      });
      test("Case: begin at -3 end at -1", () {
        final list = [8, 1, 3, 7, 3, 2];
        gnomeSort(list, begin: -3, end: -1);
        expect(list, [1, 3, 3, 7, 8, 2]);
      });
    });
  });

  group("gnomeSort() with custom [compare]", () {
    test("Test all permutations of [-3, -2, -1, 0, 1, 2]", () {
      final original = [-3, -2, -1, 0, 1, 2];
      final perms = Permutations(original.length, original);
      for (final list in perms()) {
        gnomeSort<int>(list, compare: (a, b) => a - b);
        expect(list, original);
      }
    });
  });
}
