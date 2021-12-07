import 'package:benchmark/benchmark.dart';
import 'package:algorithmic/algorithmic.dart';

void main() {
  List<int> list = [];

  setUp(() {
    list = List<int>.generate(500000, (i) => i);
    list.shuffle();
  });

  tearDown(() => list = []);

  group('List(500k).indexOf', () {
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

  group('Linear searching in List(500k)', () {
    benchmark('linearSearch(list, -1)', () {
      linearSearch(list, -1);
    });

    benchmark('linearSearch(list, -1, offset: 100)', () {
      linearSearch(list, -1, offset: 100);
    });

    benchmark('linearSearch(list, -1, compare: (a, b) => a - b)', () {
      linearSearch(list, -1, compare: (int a, int b) => a - b);
    });

    benchmark('linearSearch(list, -1, offset: 100, compare: (a, b) => a - b)',
        () {
      linearSearch(list, -1, offset: 100, compare: (int a, int b) => a - b);
    });
  });

  group('List(500k).lastIndexOf', () {
    benchmark('list.lastIndexOf(-1)', () {
      list.lastIndexOf(-1);
    });

    benchmark('list.lastIndexOf(100000)', () {
      list.lastIndexOf(-1, 100000);
    });

    benchmark('list.indexWhere((e) => e == -1)', () {
      list.lastIndexWhere((e) => e == -1);
    });

    benchmark('list.lastIndexOf((e) => e == -1, 100000)', () {
      list.lastIndexWhere((e) => e == -1, 100000);
    });
  });

  group('Reverse linear searching in List(500k)', () {
    benchmark('linearSearchReversed(list, -1)', () {
      linearSearchReversed(list, -1);
    });

    benchmark('linearSearchReversed(list, -1, offset: 100000)', () {
      linearSearchReversed(list, -1, offset: 100000);
    });

    benchmark('linearSearchReversed(list, -1, compare: (a, b) => a - b)', () {
      linearSearchReversed(list, -1, compare: (int a, int b) => a - b);
    });

    benchmark('linearSearchReversed(... 100000, compare: (a, b) => a - b)', () {
      linearSearchReversed(list, -1,
          offset: 100000, compare: (int a, int b) => a - b);
    });
  });
}
