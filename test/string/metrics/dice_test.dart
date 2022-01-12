// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:algorithmic/algorithmic.dart';
import 'package:test/test.dart';

void main() {
  group("diceIndex() | diceIndexOf()", () {
    test("<empty> -> <empty>", () {
      final s = "";
      final t = "";
      expect(diceIndexOf(s, t), 0);
    });
    test("a -> a", () {
      final s = "a";
      final t = "a";
      expect(diceIndexOf(s, t), 1);
    });
    test("a -> b", () {
      final s = "a";
      final t = "b";
      expect(diceIndexOf(s, t), 0);
    });
    test("ab -> a", () {
      final s = "ab";
      final t = "a";
      expect(diceIndexOf(s, t), 0.6666666666666666);
    });
    test("dm -> dds", () {
      final s = "dm";
      final t = "dds";
      expect(diceIndexOf(s, t), 0.5);
    });
    test("[1, 1, 2, 3, 4] -> [2, 3, 4, 5, 6, 7, 7, 8]", () {
      final s = [1, 1, 2, 3, 4];
      final t = [2, 3, 4, 5, 6, 7, 7, 8];
      expect(diceIndex(s, t), 0.5454545454545454);
    });
    test("['data', 'science'] -> ['data']", () {
      final s = ['data', 'science'];
      final t = ['data'];
      expect(diceIndex(s, t), 0.6666666666666666);
    });
    test("['data', 'management'] -> ['data', 'data', 'science']", () {
      final s = ['data', 'management'];
      final t = ['data', 'data', 'science'];
      expect(diceIndex(s, t), 0.5);
    });
  });
}
