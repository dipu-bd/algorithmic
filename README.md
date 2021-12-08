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

#### Linear Search

|           Exported Methods | Performance | Tests | Benchmark | Since |
| -------------------------: | :---------: | :---: | :-------: | :---: |
|           `linearSearch()` |   `O(n)`    |  ✔️   |    ✔️     | 0.0.1 |
|         `linearSearchBy()` |   `O(n)`    |  ✔️   |    ✔️     | 0.0.4 |
|   `linearSearchReversed()` |   `O(n)`    |  ✔️   |    ✔️     | 0.0.1 |
| `linearSearchReversedBy()` |   `O(n)`    |  ✔️   |    ✔️     | 0.0.4 |

#### Binary Search

|    Exported Methods | Performance | Tests | Benchmark | Since |
| ------------------: | :---------: | :---: | :-------: | :---: |
|      `lowerBound()` | `O(log n)`  |  ✔️   |    ✔️     | 0.0.3 |
|    `lowerBoundBy()` | `O(log n)`  |  ✔️   |    ✔️     | 0.0.4 |
|      `upperBound()` | `O(log n)`  |  ✔️   |    ✔️     | 0.0.3 |
|    `binarySearch()` | `O(log n)`  |  ✔️   |    ✔️     | 0.0.3 |
| `binarySearchMax()` | `O(log n)`  |  ✔️   |    ✔️     | 0.0.3 |

<!--
#### Interpolation Search

|        Exported Methods |    Performance    | Tests | Benchmark | Since |
| ----------------------: | :---------------: | :---: | :-------: | :---: |
| `interpolationSearch()` | `O(log log n)` 🗒️ |  ⌛   |    ⌛     |  ⌛   |

🗒️ Under the assumption of a uniform distribution of data, performance of interpolation search is `O(log log n)`. However, in general the performance is `O(n)`.

-->

## Benchmarks

All benchmarking files are stored inside the './benchmark' folder. You can check it directly via the following command:

```
$ dart run benchmark
```

You can also check the [benchmark.log](https://github.com/dipu-bd/algorithmic/blob/master/benchmark.log) file for the benchmark result that I got on my PC.
