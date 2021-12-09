# algorithmic

[![plugin version](https://img.shields.io/pub/v/algorithmic?label=pub)](https://pub.dev/packages/algorithmic)
[![dependencies](https://img.shields.io/librariesio/release/pub/algorithmic?label=dependencies)](https://github.com/dipu-bd/algorithmic/-/blob/master/pubspec.yaml)

A collection of useful algorithms keeping performance and flexibility on mind.

## Usage

The following import will give you access to all algorithms declared in this library.

```dart
import 'package:algorithmic/algorithmic.dart';
```

You can also import these algorithms separately:

| Libraries         | Imported By                            |
| ----------------- | -------------------------------------- |
| Search algorithms | `'package:algorithmic/searching.dart'` |

<!-- ⌛ ✔️ ❌ -->

## Benchmarks

To run benchmark on your own machine:

```
$ dart run benchmark
```

You can check the [benchmark.log](https://github.com/dipu-bd/algorithmic/blob/master/benchmark.log) for the benchmark result from my desktop.

If it is taking too long to run the benchmarks, modify the `_config.dart` files stored inside the `benchmark` folder.

## Searching algorithms

Index searching algorithms attempt to find the index of an item from a list.

### Binary Search

A faster searching algorithm for sorted list of items.

|           Functions | Performance | Tests | Benchmark | Since |
| ------------------: | :---------: | :---: | :-------: | :---: |
|      `lowerBound()` | `O(log n)`  |  ✔️   |    ✔️     | 0.0.3 |
|      `upperBound()` | `O(log n)`  |  ✔️   |    ✔️     | 0.0.3 |
|    `binarySearch()` | `O(log n)`  |  ✔️   |    ✔️     | 0.0.3 |
| `binarySearchMax()` | `O(log n)`  |  ✔️   |    ✔️     | 0.0.4 |

### Linear Search

A general searching algorithm for any kind of list.

|                  Functions | Performance | Tests | Benchmark | Since |
| -------------------------: | :---------: | :---: | :-------: | :---: |
|           `linearSearch()` |   `O(n)`    |  ✔️   |    ✔️     | 0.0.1 |
|         `linearSearchBy()` |   `O(n)`    |  ✔️   |    ✔️     | 0.0.4 |
|   `linearSearchReversed()` |   `O(n)`    |  ✔️   |    ✔️     | 0.0.1 |
| `linearSearchReversedBy()` |   `O(n)`    |  ✔️   |    ✔️     | 0.0.4 |

## Sorting algorithms

Sorting algorithms puts a list of items into an increasing order.

### Bubble Sort

[Bubble sort](https://en.wikipedia.org/wiki/Bubble_sort) performs sorting by repeatedly stepping through the list, comparing adjacent elements and swapping them if they are in the wrong order.

|      Functions | Performance | Tests | Benchmark | Since |
| -------------: | :---------: | :---: | :-------: | :---: |
| `bubbleSort()` |  `O(n^2)`   |  ✔️   |    ✔️     | 0.0.5 |

### Selection Sort

[Selection sort](https://en.wikipedia.org/wiki/Selection_sort) algorithm performs sorting by finding the minimum element from the unordered range and putting it at the beginning in each iteration.

|         Functions | Performance | Tests | Benchmark | Since |
| ----------------: | :---------: | :---: | :-------: | :---: |
| `selectionSort()` |  `O(n^2)`   |  ✔️   |    ✔️     | 0.0.5 |

### Insertion Sort

[Insertion sort](https://en.wikipedia.org/wiki/Insertion_sort) sorts splits the list into two parts: the left part is ordered and the right part is unordered. In each iteration, it removes the first item from right part, and insert it into the left part maintaining the increasing order.

|         Functions | Performance | Tests | Benchmark | Since |
| ----------------: | :---------: | :---: | :-------: | :---: |
| `insertionSort()` |  `O(n^2)`   |  ✔️   |    ✔️     | 0.0.5 |

### Gnome Sort

[Gnome sort](https://en.wikipedia.org/wiki/Gnome_sort) is a variation to the insertion sort which uses a much simpler implementation and has `O(n)` time complexity for an already sorted list.

|     Functions | Performance | Tests | Benchmark | Since |
| ------------: | :---------: | :---: | :-------: | :---: |
| `gnomeSort()` |  `O(n^2)`   |  ✔️   |    ✔️     | 0.0.5 |
