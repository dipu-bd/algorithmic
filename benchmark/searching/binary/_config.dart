// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'dart:math';

final int times = 200 * 1000;
final int size = 1000 * 1000 * 1000;

final rand = Random();
final list = List<int>.generate(size, (i) => (i / 10).floor());
final vals = List<int>.generate(times, (i) => rand.nextInt(size * 2) - size);
