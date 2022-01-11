# algorithmic

[![plugin version](https://img.shields.io/pub/v/algorithmic?label=pub)](https://pub.dev/packages/algorithmic)
[![dependencies](https://img.shields.io/librariesio/release/pub/algorithmic?label=dependencies)](https://github.com/dipu-bd/algorithmic/-/blob/master/pubspec.yaml)
[![Dart](https://github.com/dipu-bd/algorithmic/actions/workflows/dart.yml/badge.svg)](https://github.com/dipu-bd/algorithmic/actions/workflows/dart.yml)

A collection of useful algorithms keeping performance and flexibility on mind.

## Usage

The following import will give you access to all the algorithms in this package.

```dart
import 'package:algorithmic/algorithmic.dart';
```

You can also import these algorithms separately:

| Libraries         | Imported By                            |
| ----------------- | -------------------------------------- |
| Search algorithms | `'package:algorithmic/searching.dart'` |
| Sort algorithms   | `'package:algorithmic/sorting.dart'`   |
| String algorithms | `'package:algorithmic/string.dart'`    |

<!-- ⌛ ✔️ ❌ -->

## Benchmarks

To run benchmark on your own machine:

```
$ dart run benchmark
```

You can check the [benchmark.log](https://github.com/dipu-bd/algorithmic/blob/master/benchmark.log) file for the benchmark results.

## Searching algorithms

Index searching algorithms attempt to find the index of an item from a list.

### Binary Search

A faster searching algorithm for sorted list of items. It divides the list into two parts and discard one based on the middle value of them. This requires the list to be sorted in an increasing order.

|             Functions |  Performance   | Tests | Benchmark | Since |
| --------------------: | :------------: | :---: | :-------: | :---: |
|        `lowerBound()` | _O_(`log` _n_) |  ✔️   |    ✔️     | 0.0.3 |
|        `upperBound()` | _O_(`log` _n_) |  ✔️   |    ✔️     | 0.0.3 |
|      `binarySearch()` | _O_(`log` _n_) |  ✔️   |    ✔️     | 0.0.3 |
| `binarySearchUpper()` | _O_(`log` _n_) |  ✔️   |    ✔️     | 0.0.6 |
| `binarySearchQuick()` | _O_(`log` _n_) |  ✔️   |    ✔️     | 0.0.6 |

### Linear Search

A general searching algorithm for any kind of list. It tests every elements on the list one by one.

|                  Functions | Performance | Tests | Benchmark | Since |
| -------------------------: | :---------: | :---: | :-------: | :---: |
|           `linearSearch()` |  _O_(_n_)   |  ✔️   |    ✔️     | 0.0.1 |
|         `linearSearchBy()` |  _O_(_n_)   |  ✔️   |    ✔️     | 0.0.4 |
|   `linearSearchReversed()` |  _O_(_n_)   |  ✔️   |    ✔️     | 0.0.1 |
| `linearSearchReversedBy()` |  _O_(_n_)   |  ✔️   |    ✔️     | 0.0.4 |

## Sorting algorithms

Sorting algorithms puts a list of items into an increasing order.

### Bubble Sort

[Bubble sort](https://en.wikipedia.org/wiki/Bubble_sort) performs sorting by repeatedly stepping through the list, comparing adjacent elements and swapping them if they are in the wrong order.

|      Functions | Performance | Tests | Benchmark | Since |
| -------------: | :---------: | :---: | :-------: | :---: |
| `bubbleSort()` |  _O_(_n²_)  |  ✔️   |    ✔️     | 0.0.5 |

### Comb Sort

[Comb sort](https://en.wikipedia.org/wiki/Comb_sort) improves bubble sort by eliminating small values near the end of the list, since they slows down bubble sort. It has `O(n)` time complexity for an already sorted list.

|    Functions | Performance | Tests | Benchmark | Since |
| -----------: | :---------: | :---: | :-------: | :---: |
| `combSort()` |  _O_(_n²_)  |  ✔️   |    ✔️     | 0.0.8 |

### Cocktail Shaker Sort

[Cocktail shaker sort](https://en.wikipedia.org/wiki/Cocktail_shaker_sort) extends bubble sort by operating in two directions. It has `O(n)` time complexity for an already sorted list.

This algorithm is known by many other names, e.g.: bidirectional bubble sort, cocktail sort, shaker sort, ripple sort, shuffle sort, shuttle sort etc.

|              Functions | Performance | Tests | Benchmark | Since |
| ---------------------: | :---------: | :---: | :-------: | :---: |
| `cocktailShakerSort()` |  _O_(_n²_)  |  ✔️   |    ✔️     | 0.0.8 |

### Selection Sort

[Selection sort](https://en.wikipedia.org/wiki/Selection_sort) algorithm performs sorting by finding the minimum element from the unordered range and putting it at the beginning in each iteration.

|         Functions | Performance | Tests | Benchmark | Since |
| ----------------: | :---------: | :---: | :-------: | :---: |
| `selectionSort()` |  _O_(_n²_)  |  ✔️   |    ✔️     | 0.0.5 |

### Insertion Sort

[Insertion sort](https://en.wikipedia.org/wiki/Insertion_sort) sorts splits the list into two parts: the left part is ordered and the right part is unordered. In each iteration, it removes the first item from right part, and insert it into the left part maintaining the increasing order.

|         Functions | Performance | Tests | Benchmark | Since |
| ----------------: | :---------: | :---: | :-------: | :---: |
| `insertionSort()` |  _O_(_n²_)  |  ✔️   |    ✔️     | 0.0.5 |

### Gnome Sort

[Gnome sort](https://en.wikipedia.org/wiki/Gnome_sort) is a variation to the insertion sort which uses a much simpler implementation. It has `O(n)` time complexity for an already sorted list.

|     Functions | Performance | Tests | Benchmark | Since |
| ------------: | :---------: | :---: | :-------: | :---: |
| `gnomeSort()` |  _O_(_n²_)  |  ✔️   |    ✔️     | 0.0.5 |

### Quick Sort

[Quicksort](https://en.wikipedia.org/wiki/Quicksort) is an in-place sorting algorithm that works by selecting a _pivot_ element and partitioning the list surrounding it. There are several schemes for selecting the pivot. The sorting performance varies for different schemes.

|           Functions |    Performance     | Tests | Benchmark | Since |
| ------------------: | :----------------: | :---: | :-------: | :---: |
| `quickSortLomuto()` | _O_(_n_ `log` _n_) |  ✔️   |    ✔️     | 0.0.6 |
|  `quickSortHaore()` | _O_(_n_ `log` _n_) |  ✔️   |    ✔️     | 0.0.7 |

### Merge Sort

[Merge sort](https://en.wikipedia.org/wiki/Merge_sort) is a divide and conquer based algorithm, which can handle very large arrays. Unlike quick sort, it promises `O(n log n)` performance in worst case and provides stable sort. But it requires equal amount of memory as the length of the array and the implementation runs slower compared than quick sort.

|     Functions |    Performance     | Tests | Benchmark | Since |
| ------------: | :----------------: | :---: | :-------: | :---: |
| `mergeSort()` | _O_(_n_ `log` _n_) |  ✔️   |    ✔️     | 0.0.8 |

### Counting Sort

[Counting sort](https://en.wikipedia.org/wiki/Counting_sort) is a specialized sorting algorithm to sort integers of ranges in linear time. It counts the frequencies of the numbers appearing in an array, and uses it to reconstruct a sorted list.

|          Functions |            Performance            | Tests | Benchmark | Since |
| -----------------: | :-------------------------------: | :---: | :-------: | :---: |
|   `countingSort()` |          _O_(_n_ + _k_)           |  ✔️   |    ✔️     | 0.0.9 |
| `countingSortOf()` |          _O_(_n_ + _k_)           |  ✔️   |    ✔️     | 0.0.9 |
|                    | Here, `k` is the range of numbers |       |           |       |

### Radix Sort

[Radix sort](https://en.wikipedia.org/wiki/Radix_sort) can sort a range of integers without using any comparisons. It is a special form of bucket sort, which distribute elements into buckets according to their radix.

|       Functions |      Performance       | Tests | Benchmark | Since |
| --------------: | :--------------------: | :---: | :-------: | :---: |
|   `radixSort()` |  _O_(_n_ `log_b` _n_)  |  ✔️   |    ✔️     | 0.0.9 |
| `radixSortOf()` |  _O_(_n_ `log_b` _n_)  |  ✔️   |    ✔️     | 0.0.9 |
|                 | Here, `b` is the radix |       |           |       |

## String Metrics

### Levenshtein Distance

[Levenshtein's algorithm](https://en.wikipedia.org/wiki/Levenshtein_distance) returns the minimum number of operations to transform one string (or array) to another. The permitted operations here are insertion, deletion, and substitution.

|                 Functions |             Performance             | Tests | Benchmark | Since |
| ------------------------: | :---------------------------------: | :---: | :-------: | :---: |
|   `levenshteinDistance()` |            _O_(_n_ _m_)             |  ✔️   |    ✔️     | 0.0.9 |
| `levenshteinDistanceOf()` |            _O_(_n_ _m_)             |  ✔️   |    ✔️     | 0.0.9 |
|                           | Here, `n` and `m` are string length |       |           |       |

## Links

- [Benchmark](https://github.com/dipu-bd/algorithmic/blob/master/benchmark.log)
- [Roadmap](https://github.com/dipu-bd/algorithmic/blob/master/ROADMAP.md)
- [License](https://github.com/dipu-bd/algorithmic/blob/master/LICENSE)
