// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

/// A collection of algorithms for strings or similar data structures.
library algorithmic.string;

export 'src/string/metrics/damerau_levenshtein_distance.dart'
    show damerauLevenshteinDistanceOf, damerauLevenshteinDistance;
export 'src/string/metrics/dice_index.dart' show diceIndex, diceIndexOf;
export 'src/string/metrics/hamming_distance.dart'
    show hammingDistanceOf, hammingDistance;
export 'src/string/metrics/jaccard_index.dart'
    show jaccardIndex, jaccardDistance, jaccardDistanceOf, jaccardIndexOf;
export 'src/string/metrics/jaro.dart' show jaroSimilarity, jaroSimilarityOf;
export 'src/string/metrics/jaro_winkler.dart'
    show jaroWinklerSimilarity, jaroWinklerSimilarityOf;
export 'src/string/metrics/lee_distance.dart' show leeDistanceOf, leeDistance;
export 'src/string/metrics/levenshtein_distance.dart'
    show levenshteinDistanceOf, levenshteinDistance;
export 'src/string/metrics/longest_common_subsequence_length.dart'
    show longestCommonSubsequenceLengthOf, longestCommonSubsequenceLength;
export 'src/string/metrics/restricted_damerau_distance.dart'
    show restrictedDamerauDistanceOf, restrictedDamerauDistance;
export 'src/string/metrics/tversky_index.dart'
    show tverskyIndex, tverskyIndexOf;
