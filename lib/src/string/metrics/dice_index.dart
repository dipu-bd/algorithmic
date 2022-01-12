// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:algorithmic/algorithmic.dart';

/// Finds the [Sørensen–Dice coefficient](https://en.wikipedia.org/wiki/S%C3%B8rensen%E2%80%93Dice_coefficient)
/// of two list of items.
///
/// ## Parameters
///
/// - [source] is the variant list
/// - [target] is the prototype list
///
/// ## Details
///
/// Sørensen–Dice coefficient is a metric used to measure similarity between two
/// samples. This is known by several other names:
///
/// - Sørensen index
/// - Dice's coefficient
/// - Dice similarity coefficient (DSC)
///
/// See Also: [tverskyIndex]
///
/// ---------------------------------------------------------------------------
/// Complexity: Time `O(n log n)` | Space `O(n)`
double diceIndex<E>(List<E> source, List<E> target) {
  return tverskyIndex(source, target, alpha: 0.5, beta: 0.5);
}

/// Finds the [Sørensen–Dice coefficient](https://en.wikipedia.org/wiki/S%C3%B8rensen%E2%80%93Dice_coefficient)
/// of two strings.
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
/// Sørensen–Dice coefficient is a metric used to measure similarity between two
/// samples. This is known by several other names:
///
/// - Sørensen index
/// - Dice's coefficient
/// - Dice similarity coefficient (DSC)
///
/// See Also: [tverskyIndex], [diceIndex]
///
/// ---------------------------------------------------------------------------
/// Complexity: Time `O(n log n)` | Space `O(n)`
double diceIndexOf(
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
    alpha: 0.5,
    beta: 0.5,
    ngram: ngram,
    ignoreCase: ignoreCase,
    ignoreWhitespace: ignoreWhitespace,
    ignoreNumbers: ignoreNumbers,
    alphaNumericOnly: alphaNumericOnly,
  );
}
