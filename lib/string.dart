// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

/// A collection of algorithms for strings or similar data structures.
library algorithmic.string;

export 'src/string/metrics/levenshtein_distance.dart'
    show levenshteinDistance, levenshteinDistanceOf;
export 'src/string/metrics/restricted_edit_distance.dart'
    show restrictedEditDistance, restrictedEditDistanceOf;
export 'src/string/metrics/damerau_levenshtein_distance.dart'
    show damerauLevenshteinDistance, damerauLevenshteinDistanceOf;
