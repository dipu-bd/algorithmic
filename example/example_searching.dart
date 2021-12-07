import 'package:algorithmic/algorithmic.dart';

void main() {
  // Linear searching
  final arr = [1, -1, 2, 2, -2];

  print("find 2 in $arr (expects 2): "
      "${linearSearch(arr, 2)}");

  print("find 2 in $arr with offset = 3 (expects 3): "
      "${linearSearch(arr, 2, offset: 3)}");

  print("find 2 in $arr with count = 2 (expects -1): "
      "${linearSearch(arr, 2, count: 2)}");

  print("find 2 in $arr with offset = 2 and count = 1 (expects 2): "
      "${linearSearch(arr, 2, offset: 2, count: 1)}");

  print("find 2 in $arr with value = value + 2 (expects 2): "
      "${linearSearch(arr, 2, valueOf: (int e) => e + 2)}");

  print("find 2 in $arr with custom comparator (expects 2): "
      "${linearSearch(arr, 2, isEqual: (int a, int b) => (a - b) * (a - b) == 0)}");

  print("find 2 in $arr reversed (expects 3): "
      "${linearSearchReversed(arr, 2)}");
}
