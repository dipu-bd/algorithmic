// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'dart:math' show max;

import 'package:algorithmic/src/utils/string.dart';
import 'package:algorithmic/src/utils/templates.dart';

int longestCommonSubsequenceLengthDefault<E>(List<E> source, List<E> target) {
  int n = source.length;
  int m = target.length;
  if (n == 0 || m == 0) return 0;

  List<int> dist = List<int>.filled(m + 1, 0, growable: false);

  int i, j, k, c;
  for (i = 1; i <= n; i++) {
    k = 0;
    for (j = 1; j <= m; j++) {
      if (source[i - 1] == target[j - 1]) {
        c = k + 1;
      } else {
        c = max(dist[j], dist[j - 1]);
      }
      k = dist[j];
      dist[j] = c;
    }
  }

  return dist[m];
}

int longestCommonSubsequenceLengthCustom<E>(
    List<E> source, List<E> target, DualEqualityTest<E, E> test) {
  int n = source.length;
  int m = target.length;
  if (n == 0 || m == 0) return 0;

  List<int> dist = List<int>.filled(m + 1, 0, growable: false);

  int i, j, k, c;
  for (i = 1; i <= n; i++) {
    k = 0;
    for (j = 1; j <= m; j++) {
      if (source[i - 1] == target[j - 1]) {
        c = k + 1;
      } else {
        c = max(dist[j], dist[j - 1]);
      }
      k = dist[j];
      dist[j] = c;
    }
  }

  return dist[m];
}

/// Returns the length of the [longest common subsequence](https://en.wikipedia.org/wiki/Longest_common_subsequence_problem)
/// of two list of items.
///
/// > WARN: Not to be confused with [longestCommonSubstringSizeOf].
///
/// ## Parameters
///
/// - [source] and [target] are two list of items.
/// - [test] is an optional equality matcher.
///
/// ## Details
///
/// Common subsequence between two list of items is a set of items appearing in both
/// in the same order. Unlike substrings, the subsequences are not required occupy
/// consecutive positions.
///
/// This functions returns the length of the _longest_ common subsequence between
/// [source] and [target] without modifying their contents.
///
/// This is similar to [Levenshtein distance](https://en.wikipedia.org/wiki/Levenshtein_distance),
/// where only insertion and deletion operations are permitted, and substitution
/// is not.
///
/// ---------------------------------------------------------------------------
/// If `n` is the length of [source] and `m` is the length of [target], <br/>
/// Complexity: Time `O(nm)` | Space `O(n)`
int longestCommonSubsequenceLengthOf<E>(
  List<E> source,
  List<E> target, {
  DualEqualityTest<E, E>? test,
}) {
  if (source.length > target.length) {
    // since this is symmetric, we can swap them to optimize the inner loop
    List<E> t = target;
    target = source;
    source = t;
  }
  if (test == null) {
    return longestCommonSubsequenceLengthDefault(source, target);
  }
  return longestCommonSubsequenceLengthCustom(source, target, test);
}

/// Returns the length of the [longest common subsequence](https://en.wikipedia.org/wiki/Longest_common_subsequence_problem)
/// of two strings.
///
/// > WARN: Not to be confused with [longestCommonSubstringSize].
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
/// > TIPS: You can pass both [ignoreNumbers] and [alphaNumericOnly] to true to
///   ignore everything else except letters.
///
/// ## Details
///
/// Common subsequence between two strings is a set of characters appearing in both
/// in the same order. Unlike substrings, the subsequences are not required occupy
/// consecutive positions.
///
/// This functions returns the length of the _longest_ common subsequence between
/// [source] and [target] without modifying their contents.
///
/// This is similar to [Levenshtein distance](https://en.wikipedia.org/wiki/Levenshtein_distance),
/// where only insertion and deletion operations are permitted, and substitution
/// is not.
///
/// ---------------------------------------------------------------------------
/// If `n` is the length of [source] and `m` is the length of [target], <br/>
/// Complexity: Time `O(nm)` | Space `O(n)`
int longestCommonSubsequenceLength(
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
  return longestCommonSubsequenceLengthOf(source.codeUnits, target.codeUnits);
}
