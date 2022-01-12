// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'dart:math' show min;

import 'package:algorithmic/algorithmic.dart';
import 'package:algorithmic/src/utils/string.dart';

int damerauLevenshteinDistanceDefault<E>(List<E> source, List<E> target) {
  int n = source.length;
  int m = target.length;
  if (n == 0) {
    return m;
  }
  if (m == 0) {
    return n;
  }

  // Last three rows of the `cost` matrix
  List<List<int>> d = List<List<int>>.generate(
    n + 1,
    (i) => List<int>.filled(m + 1, 0, growable: false),
    growable: false,
  );

  Map<E, int> da = {};
  int i, j, cost, k, l, db, dv;

  for (i = 0; i <= n; ++i) {
    d[i][0] = i;
  }
  for (j = 0; j <= m; ++j) {
    d[0][j] = j;
  }
  for (i = 1; i <= n; i++) {
    db = 0;
    for (j = 1; j <= m; j++) {
      k = da[target[j - 1]] ?? 0;
      l = db;
      dv = k > 0 && l > 0 ? d[k - 1][l - 1] : n + m;

      if (source[i - 1] == target[j - 1]) {
        cost = 0;
        db = j;
      } else {
        cost = 1;
      }

      d[i][j] = min(
        min(
          min(
            d[i][j - 1] + 1, // insertion
            d[i - 1][j] + 1, // deletion
          ),
          d[i - 1][j - 1] + cost, // substitution
        ),
        dv + (i - k - 1) + 1 + (j - l - 1), // transposition
      );

      da[source[i - 1]] = i;
    }
  }

  return d[n][m];
}

/// Finds the [Damerau–Levenshtein distance](https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance)
/// between two lists which allows deletion, insertion, substitution and transposition
/// using [Wagner–Fischer algorithm](https://en.wikipedia.org/wiki/Wagner%E2%80%93Fischer_algorithm)
///
/// ## Parameters
///
/// - [source] and [target] are two list of items.
///
/// ## Details
///
/// Edit distance is a way to quantify how dissimilar two list of items are to
/// one another by counting minimum number of single-index operations required
/// to transform one list to the other.
///
/// This variation of edit distance algorithm allows 4 types of operations:
/// - insertions: insert a single item anywhere in the [source] list
/// - deletions: delete a single item from the [source]
/// - substitutions: replace one item with another in the [source]
/// - transposition: swap two adjacent items in the [source]
///
/// This functions returns the _minimum_ number of these operations required to
/// transform [source] into [target] without modifying their contents.
///
/// The difference between Damerau-Levenshtein distance and [restrictedEditDistance],
/// is that this implementation does not have the restriction to not edit a substring
/// more than once. As a result, it becomes significantly more complex to calculate
/// the Damerau-Levenshtein distance.
///
/// ---------------------------------------------------------------------------
/// If `n` is the length of [source], `m` is the length of [target], and `k` is
/// the number of unique items appearing on the lists, <br/>
/// Complexity: Time `O(nm log k)` | Space `O(nm + k)`
int damerauLevenshteinDistanceOf<E>(List<E> source, List<E> target) {
  return damerauLevenshteinDistanceDefault(source, target);
}

/// Finds the [Damerau–Levenshtein distance](https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance)
/// between two strings which allows deletion, insertion, substitution and transposition
/// using [Wagner–Fischer algorithm](https://en.wikipedia.org/wiki/Wagner%E2%80%93Fischer_algorithm)
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
/// Edit distance is a way to quantify how dissimilar two strings are to
/// one another by counting minimum number of single-character operations required
/// to transform one string to the other.
///
/// This variation of edit distance algorithm allows 4 types of operations:
/// - insertions: insert a single character anywhere in the [source]
/// - deletions: delete a single character from the [source]
/// - substitutions: replace one character with another in the [source]
/// - transposition: swap two adjacent characters in the [source]
///
/// This functions returns the _minimum_ number of these operations required to
/// transform [source] into [target] without modifying their contents.
///
/// The difference between Damerau-Levenshtein distance and [restrictedEditDistance],
/// is that this implementation does not have the restriction to not edit a substring
/// more than once. As a result, it becomes significantly more complex to calculate
/// the Damerau-Levenshtein distance.
///
/// ---------------------------------------------------------------------------
/// If `n` is the length of [source], `m` is the length of [target], and `k` is
/// the number of unique characters appearing on the string, <br/>
/// Complexity: Time `O(nm log k)` | Space `O(nm + k)`
int damerauLevenshteinDistance(
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
  return damerauLevenshteinDistanceDefault(source.codeUnits, target.codeUnits);
}
