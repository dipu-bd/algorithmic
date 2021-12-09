import 'package:algorithmic/algorithmic.dart';

void main() {
  // Linear searching
  final arr = [-2, -1, 1, 2, 2, 3];

  print("linear search 2 in $arr [expects 3]: "
      "${linearSearch(arr, 2)}");
      
  print("binary search 2 in $arr [expects 3]: "
      "${binarySearch(arr, 2)}");

  print("binary search 2 in $arr with offset = 3 [expects 3]: "
      "${binarySearch(arr, 2, start: 3)}");

  print("binary search 2 in $arr with count = 2 [expects -1]: "
      "${binarySearch(arr, 2, count: 2)}");

  print("binary search 2 in $arr with offset = 2 and count = 1 [expects 4]: "
      "${binarySearch(arr, 2, start: 4, count: 1)}");

  print("linear search 2 in $arr with custom comparator [expects 0]: "
      "${linearSearchBy(arr, (int e) => e * e == 4)}");

  print("binary search maximum index of 2 in $arr reversed [expects 4]: "
      "${binarySearchMax(arr, 2)}");
}
