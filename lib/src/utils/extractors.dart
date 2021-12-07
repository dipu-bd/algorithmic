// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

/// A template for extracting specific information from an element
typedef ValueExtractor<E, V> = V Function(E element);

/// A [ValueExtractor] that returns itself
V identity<E, V>(E element) => element as V;
