// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'dart:math' show min;

import 'package:algorithmic/src/utils/string.dart';
import 'package:algorithmic/src/utils/templates.dart';

int levenshteinDistanceDefault<E>(List<E> source, List<E> target) {
  int n = source.length;
  int m = target.length;
  if (n == 0) {
    return m;
  }
  if (m == 0) {
    return n;
  }

  // The edit distance `cost` array
  List<int> cost = List<int>.generate(m + 1, (i) => i, growable: false);

  int i, j, k, c;
  for (i = 1; i <= n; i++) {
    k = i - 1;
    cost[0] = i;
    for (j = 1; j <= m; j++) {
      c = min(
        min(
          cost[j] + 1, // deletion
          cost[j - 1] + 1, // insertion
        ),
        source[i - 1] == target[j - 1] ? k : k + 1, // substitution
      );
      k = cost[j];
      cost[j] = c;
    }
  }

  return cost[m];
}

int levenshteinDistanceCustom<E>(
    List<E> source, List<E> target, DualEqualityTest<E, E> test) {
  int n = source.length;
  int m = target.length;
  if (n == 0) {
    return m;
  }
  if (m == 0) {
    return n;
  }

  // The edit distance `cost` array
  List<int> cost = List<int>.generate(m + 1, (i) => i, growable: false);

  int i, j, k, c;
  for (i = 1; i <= n; i++) {
    k = i - 1;
    cost[0] = i;
    for (j = 1; j <= m; j++) {
      c = min(
        min(
          cost[j] + 1, // deletion
          cost[j - 1] + 1, // insertion
        ),
        test(source[i - 1], target[j - 1]) ? k : k + 1, // substitution
      );
      k = cost[j];
      cost[j] = c;
    }
  }

  return cost[m];
}

/// Finds the [Levenshtein distance](https://en.wikipedia.org/wiki/Levenshtein_distance)
/// between two lists which allows deletion, insertion and substitution using
/// [Wagner–Fischer algorithm](https://en.wikipedia.org/wiki/Wagner%E2%80%93Fischer_algorithm)
///
/// ## Parameters
///
/// - [source] and [target] are two list of items.
/// - [test] is an optional equality matcher.
///
/// ## Details
///
/// Edit distance is a way to quantify how dissimilar two list of items are to
/// one another by counting minimum number of single-index operations required
/// to transform one list to the other.
///
/// The Levenshtein distance allows three types of operations:
/// - insertions: insert a single item anywhere in the [source] list
/// - deletions: delete a single item from the [source]
/// - substitutions: replace one item with another in the [source]
///
/// This functions returns the _minimum_ number of these operations required to
/// transform [source] into [target] without modifying their contents.
///
/// ---------------------------------------------------------------------------
/// If `n` is the length of [source] and `m` is the length of [target], <br/>
/// Complexity: Time `O(nm)` | Space `O(n)`
int levenshteinDistance<E>(
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
    return levenshteinDistanceDefault(source, target);
  }
  return levenshteinDistanceCustom(source, target, test);
}

/// Finds the [Levenshtein distance](https://en.wikipedia.org/wiki/Levenshtein_distance)
/// between two strings which allows deletion, insertion and substitution using
/// [Wagner–Fischer algorithm](https://en.wikipedia.org/wiki/Wagner%E2%80%93Fischer_algorithm)
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
/// Edit distance is a way to quantify how dissimilar two strings are to one
/// another by counting minimum number of single character operations required
/// to transform one string to the other.
///
/// The Levenshtein distance allows three types of operations on a string:
/// - insertions: insert a single character anywhere in the string
/// - deletions: delete a single character from the string
/// - substitutions: replace one character with another in a string
///
/// This functions returns the _minimum_ number of these operations required to
/// transform [source] into [target] without modifying their contents.
///
/// This function also provides a multitude of ways to customize the distance.
/// You can choose to ignore cases, whitespaces, numbers, or non-alphanumeric
/// characters when calculating the distance.
///
/// ---------------------------------------------------------------------------
/// If `n` is the length of [source] and `m` is the length of [target], <br/>
/// Complexity: Time `O(nm)` | Space `O(n)`
int levenshteinDistanceOf(
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
  return levenshteinDistance(source.codeUnits, target.codeUnits);
}
