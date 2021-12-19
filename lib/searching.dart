// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

/// A collection of index search algorithms.
library algorithmic.searching;

export 'src/searching/binary_lower.dart' show lowerBound, binarySearch;
export 'src/searching/binary_quick.dart' show binarySearchQuick;
export 'src/searching/binary_upper.dart' show upperBound, binarySearchUpper;
export 'src/searching/linear_forward.dart' show linearSearch, linearSearchBy;
export 'src/searching/linear_reversed.dart'
    show linearSearchReversed, linearSearchReversedBy;
