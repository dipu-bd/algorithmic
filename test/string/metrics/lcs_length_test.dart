// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:algorithmic/algorithmic.dart';
import 'package:test/test.dart';
import 'package:trotter/trotter.dart';

void main() {
  group("longestCommonSubsequenceLength()", () {
    test("<empty> -> <empty>", () {
      final s = "";
      final t = "";
      expect(longestCommonSubsequenceLength(s, t), 0);
    });
    test("abcd -> <empty>", () {
      final s = "abcd";
      final t = "";
      expect(longestCommonSubsequenceLength(s, t), 0);
    });
    test("<empty> -> abcd", () {
      final s = "";
      final t = "abcd";
      expect(longestCommonSubsequenceLength(s, t), 0);
    });
    test("a -> a", () {
      final s = "a";
      final t = "a";
      expect(longestCommonSubsequenceLength(s, t), 1);
    });
    test("a -> b", () {
      final s = "a";
      final t = "b";
      expect(longestCommonSubsequenceLength(s, t), 0);
    });
    test("a -> ab", () {
      final s = "a";
      final t = "ab";
      expect(longestCommonSubsequenceLength(s, t), 1);
    });
    test("ab -> ba", () {
      final s = "ab";
      final t = "ba";
      expect(longestCommonSubsequenceLength(s, t), 1);
    });
    test("ac -> abc", () {
      final s = "ac";
      final t = "abc";
      expect(longestCommonSubsequenceLength(s, t), 2);
    });
    test("abcd -> abcd", () {
      final s = "abcd";
      final t = "abcd";
      expect(longestCommonSubsequenceLength(s, t), 4);
    });
    test("abcd -> abc", () {
      final s = "abcd";
      final t = "abc";
      expect(longestCommonSubsequenceLength(s, t), 3);
    });
    test("abcd -> abd", () {
      final s = "abcd";
      final t = "abd";
      expect(longestCommonSubsequenceLength(s, t), 3);
    });
    test("abcd -> abed", () {
      final s = "abcd";
      final t = "abed";
      expect(longestCommonSubsequenceLength(s, t), 3);
    });
    test("abcd -> bcd", () {
      final s = "abcd";
      final t = "bcd";
      expect(longestCommonSubsequenceLength(s, t), 3);
    });
    test("abcd -> bed", () {
      final s = "abcd";
      final t = "bed";
      expect(longestCommonSubsequenceLength(s, t), 2);
    });
    test("abc -> abcd", () {
      final s = "abc";
      final t = "abcd";
      expect(longestCommonSubsequenceLength(s, t), 3);
    });
    test("abd -> abcd", () {
      final s = "abd";
      final t = "abcd";
      expect(longestCommonSubsequenceLength(s, t), 3);
    });
    test("bed -> abcd", () {
      final s = "bed";
      final t = "abcd";
      expect(longestCommonSubsequenceLength(s, t), 2);
    });
    test("sunday -> saturday", () {
      final s = "sunday";
      final t = "saturday";
      expect(longestCommonSubsequenceLength(s, t), 5);
    });
    test("kitten -> sitting", () {
      final s = "kitten";
      final t = "sitting";
      expect(longestCommonSubsequenceLength(s, t), 4);
    });
    test("AGCAT -> GAC", () {
      final s = "AGCAT";
      final t = "GAC";
      expect(longestCommonSubsequenceLength(s, t), 2);
    });
    test("ABCD -> abCd", () {
      final s = "ABCD";
      final t = "abCd";
      expect(longestCommonSubsequenceLength(s, t), 1);
    });
    test("ABCD -> abcd | ignoreCase", () {
      final s = "ABCD";
      final t = "abcd";
      expect(longestCommonSubsequenceLength(s, t, ignoreCase: true), 4);
    });
    test("'ab c\\nd' -> 'a\\tbc d' | ignoreWhitespace", () {
      final s = "ab c\nd";
      final t = "a\tbc d";
      expect(longestCommonSubsequenceLength(s, t, ignoreWhitespace: true), 4);
    });
    test("'ab c. d' -> 'a bc .d' | ignoreWhitespace", () {
      final s = "ab c. d";
      final t = "a bc .d";
      expect(longestCommonSubsequenceLength(s, t, ignoreWhitespace: true), 5);
    });
    test("'ab12cd' -> 'abc6d' | ignoreNumeric", () {
      final s = "ab12cd";
      final t = "abc6d";
      expect(longestCommonSubsequenceLength(s, t, ignoreNumbers: true), 4);
    });
    test("'ab c..d' -> 'abc-d' | alphaNumericOnly", () {
      final s = "ab c..d";
      final t = "abc-d";
      expect(longestCommonSubsequenceLength(s, t, alphaNumericOnly: true), 4);
    });
    test("'ab c.2.d' -> 'abc1-d' | alphaNumericOnly + ignoreNumeric", () {
      final s = "ab c.2.d";
      final t = "abc1-d";
      expect(
          longestCommonSubsequenceLength(s, t,
              alphaNumericOnly: true, ignoreNumbers: true),
          4);
    });
  });

  group("longestCommonSubsequenceLengthOf() with custom test", () {
    test("<empty> -> <empty>", () {
      final s = characters("");
      final t = characters("");
      expect(longestCommonSubsequenceLengthOf(s, t, test: (a, b) => a == b), 0);
    });
    test("abcd -> <empty>", () {
      final s = characters("abcd");
      final t = characters("");
      expect(longestCommonSubsequenceLengthOf(s, t, test: (a, b) => a == b), 0);
    });
    test("<empty> -> abcd", () {
      final s = characters("");
      final t = characters("abcd");
      expect(longestCommonSubsequenceLengthOf(s, t, test: (a, b) => a == b), 0);
    });
    test("a -> a", () {
      final s = characters("a");
      final t = characters("a");
      expect(longestCommonSubsequenceLengthOf(s, t, test: (a, b) => a == b), 1);
    });
    test("a -> b", () {
      final s = characters("a");
      final t = characters("b");
      expect(longestCommonSubsequenceLengthOf(s, t, test: (a, b) => a == b), 0);
    });
    test("a -> ab", () {
      final s = characters("a");
      final t = characters("ab");
      expect(longestCommonSubsequenceLengthOf(s, t, test: (a, b) => a == b), 1);
    });
    test("ab -> ba", () {
      final s = characters("ab");
      final t = characters("ba");
      expect(longestCommonSubsequenceLengthOf(s, t, test: (a, b) => a == b), 1);
    });
    test("ac -> abc", () {
      final s = characters("ac");
      final t = characters("abc");
      expect(longestCommonSubsequenceLengthOf(s, t, test: (a, b) => a == b), 2);
    });
    test("abcd -> abcd", () {
      final s = characters("abcd");
      final t = characters("abcd");
      expect(longestCommonSubsequenceLengthOf(s, t, test: (a, b) => a == b), 4);
    });
    test("abcd -> abc", () {
      final s = characters("abcd");
      final t = characters("abc");
      expect(longestCommonSubsequenceLengthOf(s, t, test: (a, b) => a == b), 3);
    });
    test("abcd -> abd", () {
      final s = characters("abcd");
      final t = characters("abd");
      expect(longestCommonSubsequenceLengthOf(s, t, test: (a, b) => a == b), 3);
    });
    test("abcd -> abed", () {
      final s = characters("abcd");
      final t = characters("abed");
      expect(longestCommonSubsequenceLengthOf(s, t, test: (a, b) => a == b), 3);
    });
    test("abcd -> bcd", () {
      final s = characters("abcd");
      final t = characters("bcd");
      expect(longestCommonSubsequenceLengthOf(s, t, test: (a, b) => a == b), 3);
    });
    test("abcd -> bed", () {
      final s = characters("abcd");
      final t = characters("bed");
      expect(longestCommonSubsequenceLengthOf(s, t, test: (a, b) => a == b), 2);
    });
    test("abc -> abcd", () {
      final s = characters("abc");
      final t = characters("abcd");
      expect(longestCommonSubsequenceLengthOf(s, t, test: (a, b) => a == b), 3);
    });
    test("abd -> abcd", () {
      final s = characters("abd");
      final t = characters("abcd");
      expect(longestCommonSubsequenceLengthOf(s, t, test: (a, b) => a == b), 3);
    });
    test("bed -> abcd", () {
      final s = characters("bed");
      final t = characters("abcd");
      expect(longestCommonSubsequenceLengthOf(s, t, test: (a, b) => a == b), 2);
    });
    test("sunday -> saturday", () {
      final s = characters("sunday");
      final t = characters("saturday");
      expect(longestCommonSubsequenceLengthOf(s, t, test: (a, b) => a == b), 5);
    });
    test("kitten -> sitting", () {
      final s = characters("kitten");
      final t = characters("sitting");
      expect(longestCommonSubsequenceLengthOf(s, t, test: (a, b) => a == b), 4);
    });
  });
}
