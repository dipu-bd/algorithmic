import 'package:benchmark/benchmark.dart';
import 'package:algorithmic/algorithmic.dart';

void main() {
  List<int> list = [];
  int size = 10 * 1000 * 1000;

  setUp(() {
    list = List<int>.generate(size, (i) => i);
    list.shuffle();
  });

  tearDown(() => list = []);

  group('List.indexOf: list size = $size', () {
    benchmark('list.indexOf(-1)', () {
      list.indexOf(-1);
    });

    benchmark('list.indexOf(-1, 100)', () {
      list.indexOf(-1, 100);
    });

    benchmark('list.indexWhere((e) => e == -1)', () {
      list.indexWhere((e) => e == -1);
    });

    benchmark('list.indexWhere((e) => e == -1, 100)', () {
      list.indexWhere((e) => e == -1, 100);
    });
  });

  group('* Linear searching: list size = $size', () {
    benchmark('linearSearch(list, -1)', () {
      linearSearch(list, -1);
    });

    benchmark('linearSearch(list, -1, offset: 100)', () {
      linearSearch(list, -1, offset: 100);
    });

    benchmark('linearSearch(list, -1, compare: (a, b) => a - b)', () {
      linearSearch(list, -1, compare: (int a, int b) => a - b);
    });

    benchmark('linearSearch(... offset: 100, compare: (a, b) => a - b)', () {
      linearSearch(list, -1, offset: 100, compare: (int a, int b) => a - b);
    });
  });

  group('List.lastIndexOf: list size = $size', () {
    benchmark('list.lastIndexOf(-1)', () {
      list.lastIndexOf(-1);
    });

    benchmark('list.lastIndexOf(list.length - 100)', () {
      list.lastIndexOf(-1, list.length - 100);
    });

    benchmark('list.indexWhere((e) => e == -1)', () {
      list.lastIndexWhere((e) => e == -1);
    });

    benchmark('list.lastIndexOf((e) => e == -1, list.length - 100)', () {
      list.lastIndexWhere((e) => e == -1, list.length - 100);
    });
  });

  group('* Reverse linear searching: list size = $size', () {
    benchmark('linearSearchReversed(list, -1)', () {
      linearSearchReversed(list, -1);
    });

    benchmark('linearSearchReversed(list, -1, offset: list.length - 100)', () {
      linearSearchReversed(list, -1, offset: list.length - 100);
    });

    benchmark('linearSearchReversed(list, -1, compare: (a, b) => a - b)', () {
      linearSearchReversed(list, -1, compare: (int a, int b) => a - b);
    });

    benchmark('linearSearchReversed(... - 100, compare: (a, b) => a - b)', () {
      linearSearchReversed(
        list,
        -1,
        offset: list.length - 100,
        compare: (int a, int b) => a - b,
      );
    });
  });
}
