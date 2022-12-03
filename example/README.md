```dart
import 'package:algorithmic/algorithmic.dart';

void main() {
  final list = List<int>.generate(1000, (i) => i - 500);
  list.shuffle();

  int indexOf10 = linearSearch(list, 10);
  print("index of 10 in a random list: $indexOf10");

  print("sorting list using gnome sort.");
  gnomeSort(list);

  int indexOf10Sorted = binarySearch(list, 10);
  print("index of 10 in a sorted list: $indexOf10Sorted");
}
```
