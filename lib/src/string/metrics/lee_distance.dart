// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'dart:math' show min;

import 'package:algorithmic/src/utils/string.dart';
import 'package:algorithmic/src/utils/templates.dart';

/// Finds the [Lee distance](https://en.wikipedia.org/wiki/Lee_distance)
/// between two lists.
///
/// ## Parameters
///
/// - [source] and [target] are two list of items.
/// - [q] is the alphabet size. It must be greater than 1.
///
/// ## Details
///
/// In coding theory, Lee distance is a distance between two equal-length list
/// of items over a _q_-ary alphabet `{0, 1, ..., q - 1}` of size q >= 2.
///
/// - The lee distance between two item x and y is `min(|x - y|, q - |x - y|)`
/// - The lee distance between two strings is the summation of all lee distances
/// from index 0 to n.
///
/// If two list are not equal, a [RangeError] is thrown.
///
/// ---------------------------------------------------------------------------
/// Complexity: Time `O(n)` | Space `O(1)`
int leeDistanceOf(List<int> source, List<int> target, int q) {
  int n = source.length;
  int m = target.length;
  if (n != m) {
    throw RangeError('source and target must have equal length');
  }

  int i, c, d = 0;
  for (i = 0; i < n; i++) {
    c = source[i] - target[i];
    if (c < 0) c = -c;
    d += min(c, q - c);
  }

  return d;
}

/// Finds the [Lee distance](https://en.wikipedia.org/wiki/Lee_distance)
/// between two strings.
///
/// ## Parameters
///
/// - [source] and [target] are two strings.
/// - [q] is the alphabet size. It must be greater than 1. Default is `2^16`
/// - If [keyOf] is present, it is used to get integer value of a character,
///   otherwise the code unit value is used.
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
/// In coding theory, Lee distance is a distance between two equal-length list
/// of items over a _q_-ary alphabet `{0, 1, ..., q - 1}` of size q >= 2.
///
/// - The lee distance between two item x and y is `min(|x - y|, q - |x - y|)`
/// - The lee distance between two strings is the summation of all lee distances
/// from index 0 to n.
///
/// If two list are not equal, a [RangeError] is thrown.
///
/// ---------------------------------------------------------------------------
/// Complexity: Time `O(n)` | Space `O(1)`
int leeDistance(
  String source,
  String target, {
  int q = 1 << 16,
  KeyOf<String, int>? keyOf,
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

  List<int> s, t;
  if (keyOf == null) {
    s = source.codeUnits;
    t = target.codeUnits;
  } else {
    s = _extractKeys(source, keyOf);
    t = _extractKeys(target, keyOf);
  }

  return leeDistanceOf(s, t, q);
}

List<int> _extractKeys(String value, KeyOf<String, int> keyOf) {
  return List.generate(value.length, (i) => keyOf(value[i]), growable: false);
}
