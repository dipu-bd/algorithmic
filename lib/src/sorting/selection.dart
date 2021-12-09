/// Sorts the [list] of numbers using selection sort algorithm.
///
/// ## Parameters
///
/// * [list] is any list of items to be sorted.
/// * [begin] is the start index of the range to be sorted.
/// * If [begin] is negative, range starts at the 0
/// * if [begin] is not below the length of the [list], range will be empty.
/// * [end] is the final index if the range to be sorted.
/// * If [end] is above the length of the [list], it will be ignored.
/// * if [end] is negative, the absolute value of it will be subtracted
/// from the length of the [list] to determine where the range ends.
/// * if [end] is not greater than the [begin], the range will be empty.
/// * [compare] is a custom comparator to order the list elements.
///   If it is null and [list] items are not [Comparable], [TypeError] is thrown.
///
/// ## Details
///
/// The selection sort algorithm sorts the [list] in an increasing order by finding
/// the minimum element and putting it in the beginning for the unsorted range repeteadly.
/// When [begin] or [end] are specified, it will perform a partial sorting on the [list].
///
/// Although the selection sort algorithm is not very efficient, it is useful when the
/// auxiliary memory is limited.
///
/// ----------------------------------------------------------------
/// Complexity: Time `O(n^2)` | Space `O(1)`
void selectionSort<E>(
  final List<E> list, {
  final int? begin,
  final int? end,
  final Comparator<E>? compare,
}) {
  int b, e, c, m;
  final int n = list.length;

  b = 0;
  e = n;
  if (begin != null && b < begin) {
    b = begin;
  }
  if (end != null && end < e) {
    e = end;
    if (e < 0) e += n;
  }

  if (compare == null) {
    // compare items with default comparision
    for (int i = b; i < e; ++i) {
      m = i;
      for (int j = i + 1; j < e; ++j) {
        c = (list[j] as Comparable).compareTo(list[m]);
        if (c < 0) {
          m = j;
        }
      }
      if (m != i) {
        final E t = list[m];
        list[m] = list[i];
        list[i] = t;
      }
    }
  } else {
    // compare items with custom comparator
    for (int i = b; i < e; ++i) {
      m = i;
      for (int j = i + 1; j < e; ++j) {
        c = compare(list[j], list[m]);
        if (c < 0) {
          m = j;
        }
      }
      if (m != i) {
        final E t = list[m];
        list[m] = list[i];
        list[i] = t;
      }
    }
  }
}
