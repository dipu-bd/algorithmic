# algorithmic

[![plugin version](https://img.shields.io/pub/v/algorithmic?label=pub)](https://pub.dev/packages/algorithmic)
[![dependencies](https://img.shields.io/librariesio/release/pub/algorithmic?label=dependencies)](https://github.com/dipu-bd/algorithmic/-/blob/master/pubspec.yaml)

A collection of popular algorithms in Dart.

## Usage

If you want to have access to all of the algorithms, you can import the parent library:

```dart
import 'package:algorithmic/algorithmic.dart';
```

You may also import individual libraries as you need them. Check the [Algorithms](#algorithms) section for available algorithms in each of these libraries.

| Libraries | Imports                                |
| --------- | -------------------------------------- |
| Searching | `'package:algorithmic/searching.dart'` |

## Algorithms

<!-- ⌛ ✔️ ❌ -->

### Searching algorithms

#### Linear Search

|         Exported Methods |  Time  | Tests | Benchmark | Since |
| -----------------------: | :----: | :---: | :-------: | :---: |
|         `linearSearch()` | `O(n)` |  ✔️   |    ✔️     | 0.0.1 |
| `linearSearchReversed()` | `O(n)` |  ✔️   |    ✔️     | 0.0.1 |

#### Binary Search

|         Exported Methods |    Time    | Tests | Benchmark | Since |
| -----------------------: | :--------: | :---: | :-------: | :---: |
|           `lowerBound()` | `O(log n)` |  ✔️   |    ✔️     | 0.0.3 |
|         `binarySearch()` | `O(log n)` |  ✔️   |    ✔️     | 0.0.3 |
|           `upperBound()` | `O(log n)` |  ✔️   |    ⌛     | 0.0.3 |
| `binarySearchReversed()` | `O(log n)` |  ✔️   |    ⌛     | 0.0.3 |

## Benchmarks

All benchmarks are stored inside the './benchmark' folder. You can run it directly via the following command:

```
$ dart run benchmark
```

List of all 3rd party package names that were used to compare:

|  Benchmark Name   | Package                                                 |
| :---------------: | ------------------------------------------------------- |
| **`algorithmic`** | [**algorithmic**](https://pub.dev/packages/algorithmic) |
|   `collection`    | [collection](https://pub.dev/packages/collection)       |

### Searching

#### `linearSearch()`

```
 Linear search in a shuffled list of 10000000 numbers
  ✓ list.indexOf() (46 ms)
  ✓ * algorithmic.linearSearch() (45 ms)
 Linear search in a shuffled list of 10000000 numbers with a start offset
  ✓ list.indexOf() (46 ms)
  ✓ * algorithmic.linearSearch() (45 ms)
 Linear search in a shuffled list of 10000000 numbers with a custom comparator
  ✓ list.indexWhere() (304 ms)
  ✓ * algorithmic.linearSearch() (315 ms)
```

#### `linearSearchReversed()`

```
 Reversed linear search in a shuffled list of 10000000 numbers
  ✓ list.lastIndexOf() (67 ms)
  ✓ * algorithmic.linearSearchReversed() (56 ms)
 Reversed linear search in a shuffled list of 10000000 numbers with a start offset
  ✓ list.lastIndexOf() (66 ms)
  ✓ * algorithmic.linearSearchReversed() (56 ms)
 Reversed Linear search in a shuffled list of 10000000 numbers with a custom comparator
  ✓ list.lastIndexWhere() (301 ms)
  ✓ * algorithmic.linearSearchReversed() (316 ms)
```

#### `binarySearch()`

```
 Binary search in a sorted list of 500000000 numbers (100000 times)
  ✓ collection.binarySearch() (317 ms)
  ✓ * algorithmic.binarySearch() (43 ms)
 Binary search in a sorted list of 500000000 numbers with starting offset (100000 times)
  ✓ collection.binarySearchBy() (318 ms)
  ✓ * algorithmic.binarySearch() (44 ms)
 Binary search in a sorted list of 500000000 numbers with a custom comparator (100000 times)
  ✓ collection.binarySearch() (321 ms)
  ✓ * algorithmic.binarySearch (124 ms)
```

#### `lowerBound()`

```
 Lower bound in a sorted list of 500000000 numbers (100000 times)
  ✓ collection.lowerBound() (331 ms)
  ✓ * algorithmic.lowerBound() (38 ms)
 Lower bound in a sorted list of 500000000 numbers with starting offset (100000 times)
  ✓ collection.lowerBoundBy() (330 ms)
  ✓ * algorithmic.lowerBound() (38 ms)
 Lower bound in a sorted list of 500000000 numbers with a custom comparator (100000 times)
  ✓ collection.lowerBound() (326 ms)
  ✓ * algorithmic.lowerBound (115 ms)
```
