// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'dart:math' show min;

import 'package:algorithmic/src/utils/string.dart';
import 'package:algorithmic/src/utils/templates.dart';

int restrictedEditDistanceDefault<E>(List<E> source, List<E> target) {
  int n = source.length;
  int m = target.length;
  if (n == 0) {
    return m;
  }
  if (m == 0) {
    return n;
  }

  // Last three rows of the `cost` matrix
  List<int> d2 = List<int>.filled(m + 1, 0, growable: false);
  List<int> d1 = List<int>.generate(m + 1, (i) => i, growable: false);
  List<int> d0 = List<int>.filled(m + 1, 0, growable: false);
  List<int> _d;

  int i, j, c;
  for (i = 1; i <= n; i++) {
    d0[0] = i; // inital: 1
    for (j = 1; j <= m; j++) {
      c = source[i - 1] == target[j - 1] ? 0 : 1;
      d0[j] = min(
        min(
          d1[j] + 1, // deletion
          d0[j - 1] + 1, // insertion
        ),
        d1[j - 1] + c, // substitution
      );
      if (i > 1 &&
          j > 1 &&
          source[i - 1] == target[j - 2] &&
          source[i - 2] == target[j - 1]) {
        d0[j] = min(d0[j], 1 + d2[j - 2]); // transposition
      }
    }
    // move rows down
    _d = d2;
    d2 = d1;
    d1 = d0;
    d0 = _d;
  }

  return d1[m];
}

int restrictedEditDistanceCustom<E>(
    List<E> source, List<E> target, DualEqualityTest<E, E> test) {
  int n = source.length;
  int m = target.length;
  if (n == 0) {
    return m;
  }
  if (m == 0) {
    return n;
  }

  // Last three rows of the `cost` matrix
  List<int> d2 = List<int>.filled(m + 1, 0, growable: false);
  List<int> d1 = List<int>.generate(m + 1, (i) => i, growable: false);
  List<int> d0 = List<int>.filled(m + 1, 0, growable: false);
  List<int> _d;

  int i, j, c;
  for (i = 1; i <= n; i++) {
    d0[0] = i; // inital: 1
    for (j = 1; j <= m; j++) {
      c = test(source[i - 1], target[j - 1]) ? 0 : 1;
      d0[j] = min(
        min(
          d1[j] + 1, // deletion
          d0[j - 1] + 1, // insertion
        ),
        d1[j - 1] + c, // substitution
      );
      if (i > 1 &&
          j > 1 &&
          test(source[i - 1], target[j - 2]) &&
          test(source[i - 2], target[j - 1])) {
        d0[j] = min(d0[j], 1 + d2[j - 2]); // transposition
      }
    }
    // move rows down
    _d = d2;
    d2 = d1;
    d1 = d0;
    d0 = _d;
  }

  return d1[m];
}

/// Finds the restricted edit distance between two lists using
/// [Wagner–Fischer algorithm](https://en.wikipedia.org/wiki/Wagner%E2%80%93Fischer_algorithm)
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
/// The _restricted edit distance_ or _optimal string alignment distance_ or computes
/// the number of edit operations needed to make two lists equal under the
/// condition that _no substring is edited more than once_.
///
/// This variation of edit distance algorithm allows 4 types of operations:
/// - insertions: insert a single item anywhere in the [source] list
/// - deletions: delete a single item from the [source]
/// - substitutions: replace one item with another in the [source]
/// - transposition: swap two adjacent items in the [source] under the condition that
///   _no substring is edited more than once_
///
/// This functions returns the _minimum_ number of these operations required to
/// transform [source] into [target] without modifying their contents.
///
/// ---------------------------------------------------------------------------
/// If `n` is the length of [source] and `m` is the length of [target], <br/>
/// Complexity: Time `O(nm)` | Space `O(3m)`
int restrictedEditDistanceOf<E>(
  List<E> source,
  List<E> target, {
  DualEqualityTest<E, E>? test,
}) {
  if (test == null) {
    return restrictedEditDistanceDefault(source, target);
  }
  return restrictedEditDistanceCustom(source, target, test);
}

/// Finds the restricted edit distance between two strings using
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
/// Edit distance is a way to quantify how dissimilar two striings are to
/// one another by counting minimum number of single-character operations required
/// to transform one string to the other.
///
/// The _restricted edit distance_ or _optimal string alignment distance_ or computes
/// the number of edit operations needed to make two strings equal under the
/// condition that _no substring is edited more than once_.
///
/// This variation of edit distance algorithm allows 4 types of operations:
/// - insertions: insert a single character anywhere in the [source]
/// - deletions: delete a single character from the [source]
/// - substitutions: replace one character with another in the [source]
/// - transposition: swap two adjacent characters in the [source] under the
///   condition that _no substring is edited more than once_
///
/// This functions returns the _minimum_ number of these operations required to
/// transform [source] into [target] without modifying their contents.
///
/// ---------------------------------------------------------------------------
/// If `n` is the length of [source] and `m` is the length of [target], <br/>
/// Complexity: Time `O(nm)` | Space `O(3m)`
int restrictedEditDistance(
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
  return restrictedEditDistanceDefault(source.codeUnits, target.codeUnits);
}
