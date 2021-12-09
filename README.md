# algorithmic

[![plugin version](https://img.shields.io/pub/v/algorithmic?label=pub)](https://pub.dev/packages/algorithmic)
[![dependencies](https://img.shields.io/librariesio/release/pub/algorithmic?label=dependencies)](https://github.com/dipu-bd/algorithmic/-/blob/master/pubspec.yaml)

A collection of useful algorithms in Dart with keeping performance and flexibility on mind.

## Usage

The following import will give you access to all algorithms declared in this library.

```dart
import 'package:algorithmic/algorithmic.dart';
```

You can also import these algorithms separately:

| Libraries         | Imports                                |
| ----------------- | -------------------------------------- |
| Search algorithms | `'package:algorithmic/searching.dart'` |

## Algorithms

<!-- ⌛ ✔️ ❌ -->

### Searching algorithms

#### Binary Search

A faster searching algorithm for sorted list of items.

|    Exported Methods | Performance | Tests | Benchmark | Since |
| ------------------: | :---------: | :---: | :-------: | :---: |
|      `lowerBound()` | `O(log n)`  |  ✔️   |    ✔️     | 0.0.3 |
|      `upperBound()` | `O(log n)`  |  ✔️   |    ✔️     | 0.0.3 |
|    `binarySearch()` | `O(log n)`  |  ✔️   |    ✔️     | 0.0.3 |
| `binarySearchMax()` | `O(log n)`  |  ✔️   |    ✔️     | 0.0.4 |

#### Linear Search

A general searching algorithm for any kind of list.

|           Exported Methods | Performance | Tests | Benchmark | Since |
| -------------------------: | :---------: | :---: | :-------: | :---: |
|           `linearSearch()` |   `O(n)`    |  ✔️   |    ✔️     | 0.0.1 |
|         `linearSearchBy()` |   `O(n)`    |  ✔️   |    ✔️     | 0.0.4 |
|   `linearSearchReversed()` |   `O(n)`    |  ✔️   |    ✔️     | 0.0.1 |
| `linearSearchReversedBy()` |   `O(n)`    |  ✔️   |    ✔️     | 0.0.4 |

### Sorting algorithms

#### Bubble Sort

<!--  -->

| Exported Methods | Performance | Tests | Benchmark | Since |
| ---------------: | :---------: | :---: | :-------: | :---: |
|   `bubbleSort()` |  `O(n^2)`   |  ✔️   |    ✔️     | 0.0.5 |

#### Insertion Sort

<!--  -->

|  Exported Methods | Performance | Tests | Benchmark | Since |
| ----------------: | :---------: | :---: | :-------: | :---: |
| `insertionSort()` |  `O(n^2)`   |  ✔️   |    ✔️     | 0.0.5 |

#### Selection Sort

<!--  -->

|  Exported Methods | Performance | Tests | Benchmark | Since |
| ----------------: | :---------: | :---: | :-------: | :---: |
| `selectionSort()` |  `O(n^2)`   |  ✔️   |    ✔️     | 0.0.5 |

## Benchmarks

All benchmarking files are stored inside the './benchmark' folder. You can check it directly via the following command:

```
$ dart run benchmark
```

You can also check the [benchmark.log](https://github.com/dipu-bd/algorithmic/blob/master/benchmark.log) file for the benchmark result that I got on my PC.
