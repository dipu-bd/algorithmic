// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:algorithmic/src/utils/string.dart';
import 'package:algorithmic/src/utils/templates.dart';

int hammingDistanceDefault<E>(List<E> source, List<E> target) {
  int n = source.length;
  int m = target.length;

  int i, d = 0;
  for (i = 0; i < n && i < m; i++) {
    if (source[i] != target[i]) {
      d++;
    }
  }

  if (n < m) {
    d += m - n;
  } else if (n > m) {
    d += n - m;
  }

  return d;
}

int hammingDistanceCustom<E>(
    List<E> source, List<E> target, DualEqualityTest<E, E> test) {
  int n = source.length;
  int m = target.length;

  int i, d = 0;
  for (i = 0; i < n && i < m; i++) {
    if (!test(source[i], target[i])) {
      d++;
    }
  }

  if (n < m) {
    d += m - n;
  } else if (n > m) {
    d += n - m;
  }

  return d;
}

/// Finds the [Hamming distance](https://en.wikipedia.org/wiki/Hamming_distance)
/// between two lists.
///
/// ## Parameters
///
/// - [source] and [target] are two list of items.
/// - [test] is an optional equality matcher.
///
/// ## Details
///
/// Hamming distance is between two equal-length list of items is the number of
/// positions at which the corresponding items are different.
///
/// In this implementation, if two list are not equal, the length difference is
/// added with the hamming distance between them.
///
/// ---------------------------------------------------------------------------
/// Complexity: Time `O(n)` | Space `O(1)`
int hammingDistanceOf<E>(
  List<E> source,
  List<E> target, {
  DualEqualityTest<E, E>? test,
}) {
  if (test == null) {
    return hammingDistanceDefault(source, target);
  }
  return hammingDistanceCustom(source, target, test);
}

/// Finds the [Hamming distance](https://en.wikipedia.org/wiki/Hamming_distance)
/// between two strings.
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
/// Hamming distance is between two equal-length strings is the number of
/// positions at which the corresponding characters are different.
///
/// In this implementation, if two strings are not equal, the length difference is
/// added with the hamming distance between them.
///
/// ---------------------------------------------------------------------------
/// Complexity: Time `O(n)` | Space `O(1)`
int hammingDistance(
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
  return hammingDistanceOf(source.codeUnits, target.codeUnits);
}
