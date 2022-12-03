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

| Libraries                                  | Imported By                            |
| ------------------------------------------ | -------------------------------------- |
| [Search algorithms](#searching-algorithms) | `'package:algorithmic/searching.dart'` |
| [Sort algorithms](#sorting-algorithms)     | `'package:algorithmic/sorting.dart'`   |
| [String algorithms](#string-algorithms)    | `'package:algorithmic/string.dart'`    |

<!-- ⌛ ✔️ ❌ ➖ -->

## Benchmarks

To run benchmark on your own machine:

```
$ dart run benchmark
```

You can check the [benchmark.log](https://github.com/dipu-bd/algorithmic/blob/master/benchmark.log) file for the benchmark results.

## Searching algorithms

Index searching algorithms attempt to find the index of an item from a list.

### Binary Search

> ⭐ **1000%** faster than `collection.lowerBound()` and `collection.binarySearch()`

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

NOTE:

## Sorting algorithms

Sorting algorithms puts a list of items into an increasing order.

### Quick Sort

> ⭐ **500%** faster than `list.sort()` for 700k _items_ [`algorithmic.quickSortHaore()`]

[Quicksort](https://en.wikipedia.org/wiki/Quicksort) is an in-place sorting algorithm that works by selecting a _pivot_ element and partitioning the list surrounding it. There are several schemes for selecting the pivot. The sorting performance varies for different schemes.

|           Functions |    Performance     | Tests | Benchmark | Since |
| ------------------: | :----------------: | :---: | :-------: | :---: |
|  `quickSortHaore()` | _O_(_n_ `log` _n_) |  ✔️   |    ✔️     | 0.0.7 |
| `quickSortLomuto()` | _O_(_n_ `log` _n_) |  ✔️   |    ✔️     | 0.0.6 |

### Counting Sort

> ⭐ **600%** faster than `list.sort()` for 700k _numbers_

[Counting sort](https://en.wikipedia.org/wiki/Counting_sort) is a specialized sorting algorithm to sort integers of ranges in linear time. It counts the frequencies of the numbers appearing in an array, and uses it to reconstruct a sorted list.

|          Functions |  Performance   | Tests | Benchmark | Since |
| -----------------: | :------------: | :---: | :-------: | :---: |
|   `countingSort()` | _O_(_n_ + _k_) |  ✔️   |    ✔️     | 0.0.9 |
| `countingSortOf()` | _O_(_n_ + _k_) |  ✔️   |    ✔️     | 0.0.9 |

> Here, `k` is the range of numbers

### Cocktail Shaker Sort

> ⭐ **400%** faster than `list.sort()` for 32 _items_

[Cocktail shaker sort](https://en.wikipedia.org/wiki/Cocktail_shaker_sort) extends bubble sort by operating in two directions. It has `O(n)` time complexity for an already sorted list.

This algorithm is known by many other names, e.g.: bidirectional bubble sort, cocktail sort, shaker sort, ripple sort, shuffle sort, shuttle sort etc.

|              Functions | Performance | Tests | Benchmark | Since |
| ---------------------: | :---------: | :---: | :-------: | :---: |
| `cocktailShakerSort()` |  _O_(_n²_)  |  ✔️   |    ✔️     | 0.0.8 |

### Insertion Sort

> ⭐ **300%** faster than `list.sort()` for 32 items

[Insertion sort](https://en.wikipedia.org/wiki/Insertion_sort) sorts splits the list into two parts: the left part is ordered and the right part is unordered. In each iteration, it removes the first item from right part, and insert it into the left part maintaining the increasing order.

|         Functions | Performance | Tests | Benchmark | Since |
| ----------------: | :---------: | :---: | :-------: | :---: |
| `insertionSort()` |  _O_(_n²_)  |  ✔️   |    ✔️     | 0.0.5 |

### Comb Sort

[Comb sort](https://en.wikipedia.org/wiki/Comb_sort) improves bubble sort by eliminating small values near the end of the list, since they slows down bubble sort. It has `O(n)` time complexity for an already sorted list.

|    Functions | Performance | Tests | Benchmark | Since |
| -----------: | :---------: | :---: | :-------: | :---: |
| `combSort()` |  _O_(_n²_)  |  ✔️   |    ✔️     | 0.0.8 |

### Selection Sort

[Selection sort](https://en.wikipedia.org/wiki/Selection_sort) algorithm performs sorting by finding the minimum element from the unordered range and putting it at the beginning in each iteration.

|         Functions | Performance | Tests | Benchmark | Since |
| ----------------: | :---------: | :---: | :-------: | :---: |
| `selectionSort()` |  _O_(_n²_)  |  ✔️   |    ✔️     | 0.0.5 |

### Bubble Sort

[Bubble sort](https://en.wikipedia.org/wiki/Bubble_sort) performs sorting by repeatedly stepping through the list, comparing adjacent elements and swapping them if they are in the wrong order.

|      Functions | Performance | Tests | Benchmark | Since |
| -------------: | :---------: | :---: | :-------: | :---: |
| `bubbleSort()` |  _O_(_n²_)  |  ✔️   |    ✔️     | 0.0.5 |

### Gnome Sort

> ⭐ **300%** faster than `list.sort()` for 32 numbers

[Gnome sort](https://en.wikipedia.org/wiki/Gnome_sort) is a variation to the insertion sort which uses a much simpler implementation. It has `O(n)` time complexity for an already sorted list.

|     Functions | Performance | Tests | Benchmark | Since |
| ------------: | :---------: | :---: | :-------: | :---: |
| `gnomeSort()` |  _O_(_n²_)  |  ✔️   |    ✔️     | 0.0.5 |

### Merge Sort

[Merge sort](https://en.wikipedia.org/wiki/Merge_sort) is a divide and conquer based algorithm, which can handle very large arrays. Unlike quick sort, it promises `O(n log n)` performance in worst case and provides stable sort. But it requires equal amount of memory as the length of the array and the implementation runs slower compared than quick sort.

|     Functions |    Performance     | Tests | Benchmark | Since |
| ------------: | :----------------: | :---: | :-------: | :---: |
| `mergeSort()` | _O_(_n_ `log` _n_) |  ✔️   |    ✔️     | 0.0.8 |

### Radix Sort

> ⭐ **200%** faster than `list.sort()` for 700k _numbers_

[Radix sort](https://en.wikipedia.org/wiki/Radix_sort) can sort a range of integers without using any comparisons. It is a special form of bucket sort, which distribute elements into buckets according to their radix.

|       Functions |     Performance      | Tests | Benchmark | Since |
| --------------: | :------------------: | :---: | :-------: | :---: |
|   `radixSort()` | _O_(_n_ `log_b` _n_) |  ✔️   |    ✔️     | 0.0.9 |
| `radixSortOf()` | _O_(_n_ `log_b` _n_) |  ✔️   |    ✔️     | 0.0.9 |

> Here, `b` is the radix

## String Algorithms

### String Metrics

#### Levenshtein Distance

> ⭐ **120%** faster than `edit_distance.Levenshtein().distance()`

[Levenshtein distance](https://en.wikipedia.org/wiki/Levenshtein_distance) returns the minimum number of ediit operations to transform one string (or array) to another. The permitted operations here are _insertion_, _deletion_ and _substitution_. The Levenshtein distance between **ABCD** and **BED** is `2`.

|                 Functions | Performance  | Tests | Benchmark | Since |
| ------------------------: | :----------: | :---: | :-------: | :---: |
|   `levenshteinDistance()` | _O_(_n_ _m_) |  ✔️   |    ✔️     | 0.0.9 |
| `levenshteinDistanceOf()` | _O_(_n_ _m_) |  ✔️   |    ✔️     | 0.0.9 |

> Here, `n` and `m` are the length of first and second string respectively.

#### Damerau-Levenshtein Distance

> ⭐ **200%** faster than `edit_distance.Damerau().distance()`

[Damerau–Levenshtein distance](https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance) is a variation of Lavenshtein distance which permits _transposition_ of two adjacent characters along with _insertion_, _deletion_ and _substitution_. e.g.: The Damerau-Levenshtein distance between **CA** and **ABC** is `2`.

|                        Functions |     Performance      | Tests | Benchmark | Since  |
| -------------------------------: | :------------------: | :---: | :-------: | :----: |
|   `damerauLevenshteinDistance()` | _O_(_n_ _m_ `log` k) |  ✔️   |    ✔️     | 0.0.10 |
| `damerauLevenshteinDistanceOf()` | _O_(_n_ _m_ `log` k) |  ✔️   |    ✔️     | 0.0.10 |

> Here, `n` and `m` are the length of first and second string respectively and `k` is number of unique characters appearing in both string.

#### Restricted Damerau-Levenshtein Distance / Optimal String Alignment Distance

> ⭐ **1000%** faster than `edit_distance.Damerau().distance()`

The [Damerau–Levenshtein distance](https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance) can be restricted with a condition that no substring can be edited more than once, which simplifies the implementation of transposition lookup. This distance is also known as _Optimal String Alignment_ distance. e.g.: The restricted Damerau-Levenshtein edit distance between **CA** and **ABC** is `3`.

|                       Functions | Performance  | Tests | Benchmark | Since  |
| ------------------------------: | :----------: | :---: | :-------: | :----: |
|   `restrictedDamerauDistance()` | _O_(_n_ _m_) |  ✔️   |    ✔️     | 0.0.10 |
| `restrictedDamerauDistanceOf()` | _O_(_n_ _m_) |  ✔️   |    ✔️     | 0.0.10 |

> Here, `n` and `m` are the length of first and second string respectively.

#### Jaro similarity & Jaro-Winkler distance

The Jaro similarity between two strings is the weighted sum of percentage of matched characters from each string and transposed characters. Winkler increased this measure for matching initial characters.

|                   Functions | Performance  | Tests | Benchmark | Since  |
| --------------------------: | :----------: | :---: | :-------: | :----: |
|          `jaroSimilarity()` | _O_(_n_ _m_) |  ✔️   |    ✔️     | 0.0.10 |
|        `jaroSimilarityOf()` | _O_(_n_ _m_) |  ✔️   |    ✔️     | 0.0.10 |
|   `jaroWinklerSimilarity()` | _O_(_n_ _m_) |  ✔️   |    ✔️     | 0.0.10 |
| `jaroWinklerSimilarityOf()` | _O_(_n_ _m_) |  ✔️   |    ✔️     | 0.0.10 |

> Here, `n` and `m` are the length of first and second string respectively.

#### Hamming Distance

[Hamming distance](https://en.wikipedia.org/wiki/Hamming_distance) between two equal-length strings is the number of positions at which the characters differs. In this implementation, if two strings are not equal, the shorter string is padded to match the longer ones.

|             Functions | Performance | Tests | Benchmark | Since  |
| --------------------: | :---------: | :---: | :-------: | :----: |
|   `hammingDistance()` |  _O_(_n_)   |  ✔️   |    ➖     | 0.0.10 |
| `hammingDistanceOf()` |  _O_(_n_)   |  ✔️   |    ➖     | 0.0.10 |

#### Lee Distance

[Lee distance](https://en.wikipedia.org/wiki/Lee_distance) can only be calculated between two equal-length strings.

|         Functions | Performance | Tests | Benchmark | Since  |
| ----------------: | :---------: | :---: | :-------: | :----: |
|   `leeDistance()` |  _O_(_n_)   |  ✔️   |    ➖     | 0.0.10 |
| `leeDistanceOf()` |  _O_(_n_)   |  ✔️   |    ➖     | 0.0.10 |

#### Longest Common Subsequence Length

> ⭐ **200%** faster than `edit_distance.LongestCommonSubsequence().distance()`

[Longest Common Subsequence](https://en.wikipedia.org/wiki/Longest_common_subsequence_problem) is the longest of the common subsequences of two strings.

> Longest common substrings and longest common subsequences are not the same. Unlike substrings, subsequences are not required to occupy consecutive positions.

|                            Functions | Performance  | Tests | Benchmark | Since  |
| -----------------------------------: | :----------: | :---: | :-------: | :----: |
|   `longestCommonSubsequenceLength()` | _O_(_n_ _m_) |  ✔️   |    ✔️     | 0.0.10 |
| `longestCommonSubsequenceLengthOf()` | _O_(_n_ _m_) |  ✔️   |    ✔️     | 0.0.10 |

> Here, `n` and `m` are the length of first and second string respectively.

#### Jaccard index / Tanimoto coefficient

> ⭐ **150%** faster than `edit_distance.LongestCommonSubsequence().distance()`

[Jaccard index](https://en.wikipedia.org/wiki/Jaccard_index) is a metric used to measure similarity of two samples sets.

The complement of it is _Jaccard distance_ which measures the total number of items that is present in one list but not the other.

|             Functions |    Performance     | Tests | Benchmark | Since  |
| --------------------: | :----------------: | :---: | :-------: | :----: |
|      `jaccardIndex()` | _O_(_n_ `log` _n_) |  ✔️   |    ✔️     | 0.0.10 |
|    `jaccardIndexOf()` | _O_(_n_ `log` _n_) |  ✔️   |    ✔️     | 0.0.10 |
|   `jaccardDistance()` | _O_(_n_ `log` _n_) |  ✔️   |    ✔️     | 0.0.10 |
| `jaccardDistanceOf()` | _O_(_n_ `log` _n_) |  ✔️   |    ✔️     | 0.0.10 |

#### Dice coefficient / Sørensen index

[Sørensen–Dice coefficient](https://en.wikipedia.org/wiki/S%C3%B8rensen%E2%80%93Dice_coefficient) is a metric used to measure similarity between two samples.

|       Functions |    Performance     | Tests | Benchmark | Since  |
| --------------: | :----------------: | :---: | :-------: | :----: |
|   `diceIndex()` | _O_(_n_ `log` _n_) |  ✔️   |    ✔️     | 0.0.10 |
| `diceIndexOf()` | _O_(_n_ `log` _n_) |  ✔️   |    ✔️     | 0.0.10 |

#### Tversky Index

[Tversky similarity index](https://en.wikipedia.org/wiki/Tversky_index) an asymmetric similarity measure between sets that compares a variant with a prototype.

|          Functions |    Performance     | Tests | Benchmark | Since  |
| -----------------: | :----------------: | :---: | :-------: | :----: |
|   `tverskyIndex()` | _O_(_n_ `log` _n_) |  ✔️   |    ✔️     | 0.0.10 |
| `tverskyIndexOf()` | _O_(_n_ `log` _n_) |  ✔️   |    ✔️     | 0.0.10 |

## Links

- [Benchmark](https://github.com/dipu-bd/algorithmic/blob/master/benchmark.log)
- [Roadmap](https://github.com/dipu-bd/algorithmic/blob/master/ROADMAP.md)
- [License](https://github.com/dipu-bd/algorithmic/blob/master/LICENSE)
