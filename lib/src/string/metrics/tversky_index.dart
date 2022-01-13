// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:algorithmic/src/utils/list.dart';
import 'package:algorithmic/src/utils/string.dart';

/// Finds the [Tversky similarity index](https://en.wikipedia.org/wiki/Tversky_index)
/// between two lists.
///
/// ## Parameters
///
/// - [source] is the variant set
/// - [target] is the prototype set
/// - [alpha] is the variant coefficient. Default is 0.5
/// - [beta] is the prototype coefficient. Default is 0.5
///
/// ## Details
///
/// Tversky index is an asymmetric similarity measure between sets that compares
/// a variant with a prototype. It is a generalization of the
/// [Sørensen–Dice coefficient](https://en.wikipedia.org/wiki/S%C3%B8rensen%E2%80%93Dice_coefficient)
/// and [Jaccard index](https://en.wikipedia.org/wiki/Jaccard_index).
///
/// It may return `NaN` dependending on the values of [alpha] and [beta].
///
/// ---------------------------------------------------------------------------
/// Complexity: Time `O(n log n)` | Space `O(n)`
double tverskyIndex<E>(
  Iterable<E> source,
  Iterable<E> target, {
  double alpha = 0.5,
  double beta = 0.5,
}) {
  if (source.isEmpty || target.isEmpty) return 0;

  Set<E> s = source is Set<E> ? source : source.toSet();
  Set<E> t = target is Set<E> ? target : target.toSet();

  // calculate intersection between source and target
  int c = 0;
  for (E e in t) {
    if (s.contains(e)) c++;
  }

  // calculate relative complement of target in source
  int a = s.length - c;

  // calculate relative complement of source in target
  int b = t.length - c;

  // calculate tversky index
  return c / (c + (alpha * a) + (beta * b));

  // double det = c + (alpha * a) + (beta * b);
  // return det == 0 ? 0 : c / det;
}

/// Finds the [Tversky similarity index](https://en.wikipedia.org/wiki/Tversky_index)
/// between two strings.
///
/// ## Parameters
///
/// - [source] is the variant string
/// - [target] is the prototype string
/// - [alpha] is the variant coefficient. Default is 0.5
/// - [beta] is the prototype coefficient. Default is 0.5
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
/// Tversky index is an asymmetric similarity measure between sets that compares
/// a variant with a prototype. It is a generalization of the
/// [Sørensen–Dice coefficient](https://en.wikipedia.org/wiki/S%C3%B8rensen%E2%80%93Dice_coefficient)
/// and [Jaccard index](https://en.wikipedia.org/wiki/Jaccard_index).
///
/// It may return `NaN` dependending on the values of [alpha] and [beta].
///
/// See Also: [tverskyIndex]
///
/// ---------------------------------------------------------------------------
/// Complexity: Time `O(n log n)` | Space `O(n)`
double tverskyIndexOf(
  String source,
  String target, {
  int ngram = 1,
  double alpha = 0.5,
  double beta = 0.5,
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
  if (ngram < 2) {
    return tverskyIndex(
      source.codeUnits,
      target.codeUnits,
      alpha: alpha,
      beta: beta,
    );
  } else {
    return tverskyIndex(
      splitStringToSet(source, ngram),
      splitStringToSet(target, ngram),
      alpha: alpha,
      beta: beta,
    );
  }
}
