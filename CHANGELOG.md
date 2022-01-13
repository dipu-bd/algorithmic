## 0.0.10

- New algorithms:
  - damerauLevenshteinDistance
  - damerauLevenshteinDistanceOf
  - restrictedDamerauDistance
  - restrictedDamerauDistanceOf
  - hammingDistance
  - hammingDistanceOf
  - leeDistance
  - leeDistanceOf
  - longestCommonSubsequenceLength
  - longestCommonSubsequenceLengthOf
  - tverskyIndex
  - tverskyIndexOf
  - diceIndex
  - diceIndexOf
  - jaccardIndex
  - jaccardIndexOf
  - jaccardDistance
  - jaccardDistanceOf
- Update documentations, test and benchmarks.

## 0.0.9

- New algorithms:
  - countingSort
  - countingSortOf
  - radixSort
  - radixSortOf
  - levenshteinDistance
  - levenshteinDistanceOf

## 0.0.8

- New algorithms:
  - mergeSort
  - combSort
  - cocktailShakerSort
- Refactor exports
- Performance improvements

## 0.0.7

- New algorithms:
  - quickSortHaore
- Performance improvement:
  - Removes `final` from function parameters.
  - Pre-declare all variables.

## 0.0.6

- New algorithms:
  - binarySearchQuick
  - quickSortLomuto
  - gnomeSort
- Changes algorithms:
  - binarySearchUpper: renamed from binarySearchMax

## 0.0.5

- Adds sorting algorithms:
  - bubbleSort
  - insertionSort
  - selectionSort
- Refactor binary searching to improve performance.
  - lowerBound: parameter change
  - lowerBoundBy: removed (merged with lowerBound)

## 0.0.4

- Refactor linear searching for better flexibility and performance.
  Modified methods are:
  - linearSearch: parameter change
  - linearSearchReversed: parameter change
  - linearSearchBy: new
  - linearSearchReversedBy: new
- Refactor binary searching for better flexibility and performance.
  Modified methods are:
  - lowerBound: parameter change
  - upperBound: parameter change
  - lowerBoundBy: new
  - upperBoundBy: new
  - binarySearchMax: instead of binarySearchReversed

## 0.0.3

- Update linear search method documentation.
- Implements binary searching algorithms:
  - lowerBound
  - upperBound
  - binarySearch
  - binarySearchReversed

## 0.0.2

- Add benchmarking and organize examples.
- Improves runtime for linear searching.

## 0.0.1

- Implements linear searching algorithms:
  - linearSearch
  - linearSearchReversed
