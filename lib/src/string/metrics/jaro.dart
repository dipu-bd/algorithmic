// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:algorithmic/src/utils/string.dart';

/// Find the [Jaro Similarity](https://en.wikipedia.org/wiki/Jaro%E2%80%93Winkler_distance#Jaro_Similarity)
/// index between two list of items.
///
/// ## Parameters
///
/// - [source] and [target] are two list of items.
///
/// ## Details
///
/// The Jaro similarity index between two list of items is the weighted sum of
/// percentage of matched items from each list and transposed items.
///
/// See Also: [jaroWinklerSimilarity]
///
/// ---------------------------------------------------------------------------
/// If `n` is the length of [source] and `m` is the length of [target], <br/>
/// Complexity: Time `O(nm)` | Space `O(n+m)`
double jaroSimilarity<E>(List<E> source, List<E> target) {
  int sLen = source.length;
  int tLen = target.length;

  int i, j, k;
  int match = 0;
  int transpositions = 0;

  // If two strings are equal
  if (sLen == tLen) {
    for (i = 0; i < sLen; ++i) {
      if (source[i] != target[i]) {
        break;
      }
    }
    if (i == sLen) return 1;
  }

  if (sLen > tLen) {
    List<E> t = source;
    source = target;
    target = t;
    sLen = source.length;
    tLen = target.length;
  }

  // The maximum distance of matching characters
  int maxDist = (tLen >> 1) - 1;

  // Flags for matches
  List<bool> sMatch = List<bool>.filled(sLen, false, growable: false);
  List<bool> tMatch = List<bool>.filled(tLen, false, growable: false);

  // Check which matching items from first to second
  for (i = 0; i < sLen; ++i) {
    j = i > maxDist ? i - maxDist : 0;
    k = i + maxDist + 1;
    if (k > tLen) k = tLen;
    for (; j < k; j++) {
      if (!tMatch[j] && source[i] == target[j]) {
        sMatch[i] = true;
        tMatch[j] = true;
        match++;
        break;
      }
    }
  }

  // If no match is found
  if (match == 0) {
    return 0;
  }

  // Find number of sandwitched matches
  k = 0;
  for (i = 0; i < sLen; ++i) {
    if (!sMatch[i]) continue;
    while (!tMatch[k]) {
      k++;
    }
    if (source[i] != target[k]) {
      transpositions++;
    }
    k++;
  }

  // Calculate the Jaro similarity index
  double m = match.toDouble();
  double t = transpositions * 0.5;
  return (m / sLen + m / tLen + (m - t) / m) / 3.0;
}

/// Find the [Jaro Similarity](https://en.wikipedia.org/wiki/Jaro%E2%80%93Winkler_distance#Jaro_Similarity)
/// index between two strings.
///
/// ## Parameters
///
/// - [source] and [target] are two strings.
/// - if [ignoreCase] is true, the character case shall be ignored.
/// - if [ignoreWhitespace] is true, space, tab, newlines etc whitespace
///   characters will be ignored.
/// - if [ignoreNumbers] is true, numbers will be ignored.
/// - if [alphaNumericOnly] is true, only letters and digits will be matched.
///
/// ## Details
///
/// The Jaro similarity index between two strings is the weighted sum of
/// percentage of matched characters from each string and transposed characters.
///
/// See Also: [jaroSimilarity]
///
/// ---------------------------------------------------------------------------
/// If `n` is the length of [source] and `m` is the length of [target], <br/>
/// Complexity: Time `O(nm)` | Space `O(n+m)`
double jaroSimilarityOf(
  String source,
  String target, {
  bool ignoreCase = false,
  bool ignoreWhitespace = false,
  bool ignoreNumbers = false,
  bool alphaNumericOnly = false,
}) {
  source = cleanupString(
    source,
    ignoreCase: ignoreCase,
    ignoreWhitespace: ignoreWhitespace,
    ignoreNumbers: ignoreNumbers,
    alphaNumericOnly: alphaNumericOnly,
  );
  target = cleanupString(
    target,
    ignoreCase: ignoreCase,
    ignoreWhitespace: ignoreWhitespace,
    ignoreNumbers: ignoreNumbers,
    alphaNumericOnly: alphaNumericOnly,
  );
  return jaroSimilarity(
    source.codeUnits,
    target.codeUnits,
  );
}
