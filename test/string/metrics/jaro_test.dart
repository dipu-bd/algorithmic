// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:algorithmic/algorithmic.dart';
import 'package:test/test.dart';

void main() {
  group("jaroSimilarityOf()", () {
    test("<empty> -> <empty>", () {
      final s = "";
      final t = "";
      expect(jaroSimilarityOf(s, t), 1);
    });
    test("<empty> -> abc", () {
      final s = "";
      final t = "abc";
      expect(jaroSimilarityOf(s, t), 0);
    });
    test("abs -> <empty>", () {
      final s = "abs";
      final t = "";
      expect(jaroSimilarityOf(s, t), 0);
    });
    test("a -> a", () {
      final s = "a";
      final t = "a";
      expect(jaroSimilarityOf(s, t), 1);
    });
    test("a -> b", () {
      final s = "a";
      final t = "b";
      expect(jaroSimilarityOf(s, t), 0);
    });
    test("MARTHA -> MARHTA", () {
      final s = "MARTHA";
      final t = "MARHTA";
      expect(jaroSimilarityOf(s, t), 0.9444444444444445);
    });
    test("DIXON -> DICKSONX", () {
      final s = "DIXON";
      final t = "DICKSONX";
      expect(jaroSimilarityOf(s, t), 0.7666666666666666);
    });
    test("JELLYFISH -> SMELLYFISH", () {
      final s = "JELLYFISH";
      final t = "SMELLYFISH";
      expect(jaroSimilarityOf(s, t), 0.8962962962962964);
    });
    test("CRATE -> TRACE", () {
      final s = "CRATE";
      final t = "TRACE";
      expect(jaroSimilarityOf(s, t), 0.7333333333333334);
    });
    test("DwAyNE -> DuANE", () {
      final s = "DwAyNE";
      final t = "DuANE";
      expect(jaroSimilarityOf(s, t), 0.8222222222222223);
    });
  });
}
