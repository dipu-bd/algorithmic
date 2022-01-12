// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:algorithmic/algorithmic.dart';
import 'package:test/test.dart';

void main() {
  group("tverskyIndex() | tverskyIndexOf()", () {
    test("<empty> -> <empty>", () {
      final s = "";
      final t = "";
      expect(tverskyIndexOf(s, t), 0);
    });
    test("a -> a", () {
      final s = "a";
      final t = "a";
      expect(tverskyIndexOf(s, t), 1);
    });
    test("a -> b", () {
      final s = "a";
      final t = "b";
      expect(tverskyIndexOf(s, t), 0);
    });
    test("ab -> a", () {
      final s = "ab";
      final t = "a";
      expect(tverskyIndexOf(s, t), 0.6666666666666666);
    });
    test("dm -> dds", () {
      final s = "dm";
      final t = "dds";
      expect(tverskyIndexOf(s, t), 0.5);
    });
    test("ab -> a | alpha: 1, beta: 1", () {
      final s = "ab";
      final t = "a";
      expect(tverskyIndexOf(s, t, alpha: 1, beta: 1), 0.5);
    });
    test("dm -> dds | alpha: 1, beta: 1", () {
      final s = "dm";
      final t = "dds";
      expect(tverskyIndexOf(s, t, alpha: 1, beta: 1), 0.3333333333333333);
    });
    test("[1, 1, 2, 3, 4] -> [2, 3, 4, 5, 6, 7, 7, 8]", () {
      final s = [1, 1, 2, 3, 4];
      final t = [2, 3, 4, 5, 6, 7, 7, 8];
      expect(tverskyIndex(s, t), 0.5454545454545454);
    });
    test("[1, 1, 2, 3, 4] -> [2, 3, 4, 5, 6, 7, 7, 8] | alpha: 1, beta: 1", () {
      final s = [1, 1, 2, 3, 4];
      final t = [2, 3, 4, 5, 6, 7, 7, 8];
      expect(tverskyIndex(s, t, alpha: 1, beta: 1), 0.375);
    });
    test("dam -> dadas | ngrams: 2", () {
      final s = "dam";
      final t = "dadas";
      final sg = ['da', 'am'];
      final tg = ['da', 'ad', 'da', 'as'];
      expect(tverskyIndexOf(s, t, ngram: 2), tverskyIndex(sg, tg));
    });
    test("a -> a | ngrams: 3", () {
      final s = "a";
      final t = "a";
      final sg = ['a'];
      final tg = ['a'];
      expect(tverskyIndexOf(s, t, ngram: 3), tverskyIndex(sg, tg));
    });
    test("abv -> abc | ngrams: 3", () {
      final s = "abv";
      final t = "abc";
      final sg = ['abv'];
      final tg = ['abc'];
      expect(tverskyIndexOf(s, t, ngram: 3), tverskyIndex(sg, tg));
    });
    test("aabc -> abc | ngrams: 3", () {
      final s = "aabc";
      final t = "abc";
      final sg = ['aab', 'abc'];
      final tg = ['abc'];
      expect(tverskyIndexOf(s, t, ngram: 3), tverskyIndex(sg, tg));
    });
  });
}
