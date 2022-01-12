// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:algorithmic/algorithmic.dart';
import 'package:test/test.dart';
import 'package:trotter/trotter.dart';

void main() {
  group("hammingDistance()", () {
    test("<empty> -> <empty>", () {
      final s = "";
      final t = "";
      expect(hammingDistance(s, t), 0);
    });
    test("abcd -> <empty>", () {
      final s = "abcd";
      final t = "";
      expect(hammingDistance(s, t), 4);
    });
    test("<empty> -> abcd", () {
      final s = "";
      final t = "abcd";
      expect(hammingDistance(s, t), 4);
    });
    test("a -> a", () {
      final s = "a";
      final t = "a";
      expect(hammingDistance(s, t), 0);
    });
    test("a -> b", () {
      final s = "a";
      final t = "b";
      expect(hammingDistance(s, t), 1);
    });
    test("a -> ab", () {
      final s = "a";
      final t = "ab";
      expect(hammingDistance(s, t), 1);
    });
    test("ab -> ba", () {
      final s = "ab";
      final t = "ba";
      expect(hammingDistance(s, t), 2);
    });
    test("ac -> abc", () {
      final s = "ac";
      final t = "abc";
      expect(hammingDistance(s, t), 2);
    });
    test("abcd -> def", () {
      final s = "abcd";
      final t = "def";
      expect(hammingDistance(s, t), 4);
    });
    test("abcd -> defgh", () {
      final s = "abcd";
      final t = "defgh";
      expect(hammingDistance(s, t), 5);
    });
    test("sunday -> saturday", () {
      final s = "sunday";
      final t = "saturday";
      expect(hammingDistance(s, t), 7);
    });
    test("karolin -> kathrin", () {
      final s = "karolin";
      final t = "kathrin";
      expect(hammingDistance(s, t), 3);
    });
    test("2173896 -> 2233796", () {
      final s = "2173896";
      final t = "2233796";
      expect(hammingDistance(s, t), 3);
    });
    test("ABCD -> abcd | ignoreCase", () {
      final s = "ABCD";
      final t = "abcd";
      expect(hammingDistance(s, t, ignoreCase: true), 0);
    });
    test("'ab c\\nd' -> 'a\\tbc d' | ignoreWhitespace", () {
      final s = "ab c\nd";
      final t = "a\tbc d";
      expect(hammingDistance(s, t, ignoreWhitespace: true), 0);
    });
    test("'ab c. d' -> 'abc .d' | ignoreWhitespace", () {
      final s = "ab c. d";
      final t = "abc .d";
      expect(hammingDistance(s, t, ignoreWhitespace: true), 0);
    });
    test("'ab12cd' -> 'abc6d' | ignoreNumeric", () {
      final s = "ab12cd";
      final t = "abc6d";
      expect(hammingDistance(s, t, ignoreNumbers: true), 0);
    });
    test("'ab c..d' -> 'abc-d' | alphaNumericOnly", () {
      final s = "ab c..d";
      final t = "abc-d";
      expect(hammingDistance(s, t, alphaNumericOnly: true), 0);
    });
    test("'ab c.2.d' -> 'abc1-d' | alphaNumericOnly + ignoreNumeric", () {
      final s = "ab c.2.d";
      final t = "abc1-d";
      expect(hammingDistance(s, t, alphaNumericOnly: true, ignoreNumbers: true),
          0);
    });
  });
  group("hammingDistanceOf() with custom test", () {
    test("<empty> -> <empty>", () {
      final s = characters("");
      final t = characters("");
      expect(hammingDistanceOf(s, t, test: (a, b) => a == b), 0);
    });
    test("abcd -> ", () {
      final s = characters("abcd");
      final t = characters("");
      expect(hammingDistanceOf(s, t, test: (a, b) => a == b), 4);
    });
    test(" -> abcd", () {
      final s = characters("");
      final t = characters("abcd");
      expect(hammingDistanceOf(s, t, test: (a, b) => a == b), 4);
    });
    test("a -> a", () {
      final s = characters("a");
      final t = characters("a");
      expect(hammingDistanceOf(s, t, test: (a, b) => a == b), 0);
    });
    test("a -> b", () {
      final s = characters("a");
      final t = characters("b");
      expect(hammingDistanceOf(s, t, test: (a, b) => a == b), 1);
    });
    test("a -> ab", () {
      final s = characters("a");
      final t = characters("ab");
      expect(hammingDistanceOf(s, t, test: (a, b) => a == b), 1);
    });
    test("ab -> ba", () {
      final s = characters("ab");
      final t = characters("ba");
      expect(hammingDistanceOf(s, t, test: (a, b) => a == b), 2);
    });
    test("ac -> abc", () {
      final s = characters("ac");
      final t = characters("abc");
      expect(hammingDistanceOf(s, t, test: (a, b) => a == b), 2);
    });
    test("abcd -> def", () {
      final s = characters("abcd");
      final t = characters("def");
      expect(hammingDistanceOf(s, t, test: (a, b) => a == b), 4);
    });
    test("abcd -> defgh", () {
      final s = characters("abcd");
      final t = characters("defgh");
      expect(hammingDistanceOf(s, t, test: (a, b) => a == b), 5);
    });
    test("sunday -> saturday", () {
      final s = characters("sunday");
      final t = characters("saturday");
      expect(hammingDistanceOf(s, t, test: (a, b) => a == b), 7);
    });
    test("karolin -> kathrin", () {
      final s = characters("karolin");
      final t = characters("kathrin");
      expect(hammingDistanceOf(s, t, test: (a, b) => a == b), 3);
    });
    test("2173896 -> 2233796", () {
      final s = characters("2173896");
      final t = characters("2233796");
      expect(hammingDistanceOf(s, t, test: (a, b) => a == b), 3);
    });
  });
}
