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
