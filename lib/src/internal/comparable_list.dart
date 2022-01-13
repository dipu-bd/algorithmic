// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'dart:collection';

import 'package:algorithmic/src/utils/templates.dart';

abstract class ComparableList<E> with ListMixin<E> {
  final List<E> _base;

  ComparableList(List<E> list) : _base = list;

  @override
  int get length => _base.length;

  @override
  set length(int value) => _base.length = value;

  @override
  operator [](int index) => _base[index];

  @override
  void operator []=(int index, value) => _base[index] = value;

  int compareAt(int index, dynamic b);
}

class DefaultComparableList<E> extends ComparableList<E> {
  DefaultComparableList(List<E> list) : super(list);

  @override
  int compareAt(int index, dynamic b) {
    return (_base[index] as Comparable).compareTo(b);
  }
}

class EntryComparableList<E, V> extends ComparableList<E> {
  final EntryComparator<E, V> _compare;

  EntryComparableList(List<E> list, EntryComparator<E, V> comparator)
      : _compare = comparator,
        super(list);

  @override
  int compareAt(int index, dynamic b) {
    return _compare(_base[index], b);
  }
}

class ComparatorComparableList<E> extends ComparableList<E> {
  final Comparator<E> _compare;

  ComparatorComparableList(List<E> list, Comparator<E> comparator)
      : _compare = comparator,
        super(list);

  @override
  int compareAt(int index, dynamic b) {
    return _compare(_base[index], b);
  }
}
