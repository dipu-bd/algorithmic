// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

/// Reverses the order of elements of the [list] in range `[b, e)`.
///
/// [b] and [e] must be in range of the list, otherwise [RangeError] is thrown.
void reverseList<E>(List<E> list, int b, int e) {
  E t;
  for (int i = b, j = e - 1; i < j; i++, j--) {
    t = list[i];
    list[i] = list[j];
    list[j] = t;
  }
}

/// Split the list into ngrams
List<String> splitString(String str, int ngram) {
  if (str.length <= ngram) {
    return [str];
  }
  return List<String>.generate(
    str.length - ngram + 1,
    (i) => str.substring(i, i + ngram),
    growable: false,
  );
}

/// Split the list into ngrams
Set<String> splitStringToSet(String str, int ngram) {
  Set<String> result = <String>{};
  if (str.length <= ngram) {
    result.add(str);
  } else {
    for (int i = ngram; i <= str.length; ++i) {
      result.add(str.substring(i - ngram, i));
    }
  }
  return result;
}
