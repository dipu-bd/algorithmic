// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:algorithmic/src/utils/list.dart';
import 'package:algorithmic/src/utils/string.dart';

import './tversky_index.dart';

/// Returns the [Jaccard index](https://en.wikipedia.org/wiki/Jaccard_index)
/// between two list of items.
///
/// ## Parameters
///
/// - [source] is the variant list
/// - [target] is the prototype list
///
/// ## Details
///
/// Jaccard index is a metric used to measure similarity and diversity of two
/// samples sets. This is known by several other names:
///
/// - Jaccard similarity coefficient
/// - Tanimoto index
/// - Tanimoto coefficient
///
/// See Also: [tverskyIndex]
///
/// ---------------------------------------------------------------------------
/// Complexity: Time `O(n log n)` | Space `O(n)`
double jaccardIndex<E>(List<E> source, List<E> target) {
  return tverskyIndex(source, target, alpha: 1, beta: 1);
}

/// Returns the [Jaccard index](https://en.wikipedia.org/wiki/Jaccard_index)
/// between two strings.
///
/// ## Parameters
///
/// - [source] is the variant string
/// - [target] is the prototype string
/// - if [ignoreCase] is true, the character case shall be ignored.
/// - if [ignoreWhitespace] is true, space, tab, newlines etc whitespace
///   characters will be ignored.
/// - if [ignoreNumbers] is true, numbers will be ignored.
/// - if [alphaNumericOnly] is true, only letters and digits will be matched.
/// - [ngram] is the size a single item group.
///   If n = 1, each individual items are considered separately.
///   If n = 2, two consecutive items are grouped together and treated as one.
///
/// > TIPS: You can pass both [ignoreNumbers] and [alphaNumericOnly] to true to
///   ignore everything else except letters.
///
/// ## Details
///
/// Jaccard index is a metric used to measure similarity between two
/// samples sets. This is known by several other names:
///
/// - Jaccard similarity coefficient
/// - Tanimoto index
/// - Tanimoto coefficient
///
/// Tversky index is a generalization of Jaccard index when alpha = 1, and beta = 1
///
/// See Also: [tverskyIndex], [jaccardIndex]
///
/// ---------------------------------------------------------------------------
/// Complexity: Time `O(n log n)` | Space `O(n)`
double jaccardIndexOf(
  String source,
  String target, {
  int ngram = 1,
  bool ignoreCase = false,
  bool ignoreWhitespace = false,
  bool ignoreNumbers = false,
  bool alphaNumericOnly = false,
}) {
  return tverskyIndexOf(
    source,
    target,
    alpha: 1,
    beta: 1,
    ngram: ngram,
    ignoreCase: ignoreCase,
    ignoreWhitespace: ignoreWhitespace,
    ignoreNumbers: ignoreNumbers,
    alphaNumericOnly: alphaNumericOnly,
  );
}

/// Returns the [Jaccard distance](https://en.wikipedia.org/wiki/Jaccard_index)
/// between two list of items.
///
/// ## Parameters
///
/// - [source] is the variant list
/// - [target] is the prototype list
///
/// ## Details
///
/// Jaccard distance measures the total number of items that is present in one list
/// but not the other. It is calculated by subtracting the length of intersection
/// between the [source] and [target] set from their union.
///
/// Tversky index is a generalization of Jaccard index when alpha = 1, and beta = 1
///
/// See Also: [tverskyIndex], [jaccardIndex]
///
/// ---------------------------------------------------------------------------
/// Complexity: Time `O(n log n)` | Space `O(n)`
int jaccardDistance<E>(Iterable<E> source, Iterable<E> target) {
  Set<E> s = source is Set<E> ? source : source.toSet();
  Set<E> t = target is Set<E> ? target : target.toSet();

  // calculate intersection between source and target
  int intersection = 0;
  for (E e in t) {
    if (s.contains(e)) intersection++;
  }

  // calculate union between source and target sets
  int union = s.length + t.length - intersection;

  // calculate tversky index
  return union - intersection;
}

/// Returns the [Jaccard distance](https://en.wikipedia.org/wiki/Jaccard_index)
/// between two strings.
///
/// ## Parameters
///
/// - [source] is the variant list
/// - [target] is the prototype list
/// - if [ignoreCase] is true, the character case shall be ignored.
/// - if [ignoreWhitespace] is true, space, tab, newlines etc whitespace
///   characters will be ignored.
/// - if [ignoreNumbers] is true, numbers will be ignored.
/// - if [alphaNumericOnly] is true, only letters and digits will be matched.
/// - [ngram] is the size a single item group.
///   If n = 1, each individual items are considered separately.
///   If n = 2, two consecutive items are grouped together and treated as one.
///
/// ## Details
///
/// Jaccard distance measures the total number of characters that is present in
/// one string but not the other. It is calculated by subtracting the length of
/// intersection between the [source] and [target] set from their union.
///
/// See Also: [tverskyIndex], [jaccardIndex]
///
/// ---------------------------------------------------------------------------
/// Complexity: Time `O(n log n)` | Space `O(n)`
int jaccardDistanceOf(
  String source,
  String target, {
  int ngram = 1,
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
  if (ngram > 1) {
    return jaccardDistance(
      ngramSplitSet(source, ngram),
      ngramSplitSet(target, ngram),
    );
  } else {
    return jaccardDistance(
      source.codeUnits,
      target.codeUnits,
    );
  }
}
