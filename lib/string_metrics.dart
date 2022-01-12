// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

/// A collection of algorithms for strings or similar data structures.
library algorithmic.string;

export 'src/string/metrics/levenshtein_distance.dart'
    show levenshteinDistance, levenshteinDistanceOf;
export 'src/string/metrics/restricted_damerau_distance.dart'
    show restrictedDamerauDistance, restrictedDamerauDistanceOf;
export 'src/string/metrics/damerau_levenshtein_distance.dart'
    show damerauLevenshteinDistance, damerauLevenshteinDistanceOf;
export 'src/string/metrics/hamming_distance.dart'
    show hammingDistance, hammingDistanceOf;
export 'src/string/metrics/lee_distance.dart' show leeDistance, leeDistanceOf;
