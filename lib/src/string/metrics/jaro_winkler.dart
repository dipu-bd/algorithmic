// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'dart:math' show min, max;

import 'package:algorithmic/src/utils/string.dart';

import './jaro.dart';

/// Find the [Jaro-Winkler similarity](https://en.wikipedia.org/wiki/Jaro%E2%80%93Winkler_distance)
/// index between two list of items.
///
/// ## Parameters
///
/// - [source] and [target] are two list of items.
/// - [threshold] is the minimum Jaro distance above which the Winkler's increment
///   is to be applied.
/// - [maxPrefixSize] is the maximum prefix length to consider. If absent, the
///   whole matching prefix is considered.
/// - [prefixScale] is a constant scaling factor for how much the score is
///   adjusted upwards for having common prefixes. The length of the considered
///   common prefix is at most 4. If absent, the default prefix scale is used.
///
/// ## Details
///
/// The Jaro similarity index between two list of items is the weighted sum of
/// percentage of matched items from each list and transposed items. Winkler
/// increased this measure for matching initial characters.
///
/// See also: [jaroSimilarity]
///
/// ---------------------------------------------------------------------------
/// If `n` is the length of [source] and `m` is the length of [target], <br/>
/// Complexity: Time `O(nm)` | Space `O(n+m)`
double jaroWinklerSimilarity<E>(
  List<E> source,
  List<E> target, {
  int? maxPrefixSize,
  double? prefixScale,
  double threshold = 0.7,
}) {
  double jaro = jaroSimilarity(source, target);

  if (jaro > threshold) {
    // maximum length to find prefix match
    int len = min(source.length, target.length);
    if (maxPrefixSize != null && len > maxPrefixSize) {
      len = maxPrefixSize;
    }

    // Find matching prefix
    int l = 0;
    while (l < len && source[l] == target[l]) {
      l++;
    }

    // Add Winkler bonus with jaro similarity index
    double p = prefixScale ?? min(0.1, 1 / max(source.length, target.length));
    jaro += l * p * (1 - jaro);
  }

  return jaro;
}

/// Find the [Jaro-Winkler Similarity](https://en.wikipedia.org/wiki/Jaro%E2%80%93Winkler_distance#Jaro%E2%80%93Winkler_Similarity)
/// index between two strings.
///
/// ## Parameters
///
/// - [source] and [target] are two strings.
/// - [threshold] is the minimum Jaro distance above which the Winkler's increment
///   is to be applied.
/// - [maxPrefixSize] is the maximum prefix length to consider. If absent, the
///   whole matching prefix is considered.
/// - [prefixScale] is the prefix scale - a constant scaling factor for how much the score
///   is adjusted upwards for having common prefixes. The length of the considered
///   common prefix is at most 4. If absent, the default prefix scale is used.
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
/// Winkler increased this measure for matching initial characters.
///
/// See Also: [jaroWinklerSimilarity]
///
/// ---------------------------------------------------------------------------
/// If `n` is the length of [source] and `m` is the length of [target], <br/>
/// Complexity: Time `O(nm)` | Space `O(n+m)`
double jaroWinklerSimilarityOf(
  String source,
  String target, {
  int? maxPrefixSize,
  double? prefixScale,
  double threshold = 0.7,
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
  return jaroWinklerSimilarity(
    source.codeUnits,
    target.codeUnits,
    threshold: threshold,
    prefixScale: prefixScale,
    maxPrefixSize: maxPrefixSize,
  );
}
