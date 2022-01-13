// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:algorithmic/algorithmic.dart';
import 'package:test/test.dart';
import 'package:trotter/trotter.dart';

void main() {
  group("levenshteinDistance()", () {
    test("<empty> -> <empty>", () {
      final s = characters("");
      final t = characters("");
      expect(levenshteinDistance(s, t), 0);
    });
    test("abcd -> <empty>", () {
      final s = characters("abcd");
      final t = characters("");
      expect(levenshteinDistance(s, t), 4);
    });
    test("<empty> -> abcd", () {
      final s = characters("");
      final t = characters("abcd");
      expect(levenshteinDistance(s, t), 4);
    });
    test("a -> a", () {
      final s = characters("a");
      final t = characters("a");
      expect(levenshteinDistance(s, t), 0);
    });
    test("a -> b", () {
      final s = characters("a");
      final t = characters("b");
      expect(levenshteinDistance(s, t), 1);
    });
    test("abcd -> abcd", () {
      final s = characters("abcd");
      final t = characters("abcd");
      expect(levenshteinDistance(s, t), 0);
    });
    test("abcd -> abc", () {
      final s = characters("abcd");
      final t = characters("abc");
      expect(levenshteinDistance(s, t), 1);
    });
    test("abcd -> abd", () {
      final s = characters("abcd");
      final t = characters("abd");
      expect(levenshteinDistance(s, t), 1);
    });
    test("abcd -> abed", () {
      final s = characters("abcd");
      final t = characters("abed");
      expect(levenshteinDistance(s, t), 1);
    });
    test("abcd -> bcd", () {
      final s = characters("abcd");
      final t = characters("bcd");
      expect(levenshteinDistance(s, t), 1);
    });
    test("abcd -> bed", () {
      final s = characters("abcd");
      final t = characters("bed");
      expect(levenshteinDistance(s, t), 2);
    });
    test("abc -> abcd", () {
      final s = characters("abc");
      final t = characters("abcd");
      expect(levenshteinDistance(s, t), 1);
    });
    test("abd -> abcd", () {
      final s = characters("abd");
      final t = characters("abcd");
      expect(levenshteinDistance(s, t), 1);
    });
    test("bed -> abcd", () {
      final s = characters("bed");
      final t = characters("abcd");
      expect(levenshteinDistance(s, t), 2);
    });
    test("sunday -> saturday", () {
      final s = characters("sunday");
      final t = characters("saturday");
      expect(levenshteinDistance(s, t), 3);
    });
  });

  group("levenshteinDistance() with custom test", () {
    // ignore: prefer_function_declarations_over_variables
    final tester = (String a, String b) {
      return (a.codeUnitAt(0) - b.codeUnitAt(0)).abs() == 1;
    };

    test("<empty> -> <empty>", () {
      final s = characters("");
      final t = characters("");
      expect(levenshteinDistance(s, t, test: tester), 0);
    });
    test("abcd -> <empty>", () {
      final s = characters("abcd");
      final t = characters("");
      expect(levenshteinDistance(s, t, test: tester), 4);
    });
    test("<empty> -> abcd", () {
      final s = characters("");
      final t = characters("abcd");
      expect(levenshteinDistance(s, t, test: tester), 4);
    });
    test("a -> a", () {
      final s = characters("a");
      final t = characters("b");
      expect(levenshteinDistance(s, t, test: tester), 0);
    });
    test("a -> b", () {
      final s = characters("a");
      final t = characters("c");
      expect(levenshteinDistance(s, t, test: tester), 1);
    });
    test("abcd -> abcd", () {
      final s = characters("abcd");
      final t = characters("bcde");
      expect(levenshteinDistance(s, t, test: tester), 0);
    });
    test("abcd -> abc", () {
      final s = characters("abcd");
      final t = characters("bcd");
      expect(levenshteinDistance(s, t, test: tester), 1);
    });
    test("abcd -> abd", () {
      final s = characters("abcd");
      final t = characters("bce");
      expect(levenshteinDistance(s, t, test: tester), 1);
    });
    test("abcd -> abed", () {
      final s = characters("abcd");
      final t = characters("bcfe");
      expect(levenshteinDistance(s, t, test: tester), 1);
    });
    test("abcd -> bcd", () {
      final s = characters("abcd");
      final t = characters("bcd");
      expect(levenshteinDistance(s, t, test: tester), 1);
    });
    test("abcd -> bed", () {
      final s = characters("abcd");
      final t = characters("cfe");
      expect(levenshteinDistance(s, t, test: tester), 2);
    });
    test("abc -> abcd", () {
      final s = characters("abc");
      final t = characters("bcde");
      expect(levenshteinDistance(s, t, test: tester), 1);
    });
    test("abd -> abcd", () {
      final s = characters("abd");
      final t = characters("bcde");
      expect(levenshteinDistance(s, t, test: tester), 1);
    });
  });

  group("levenshteinDistanceOf()", () {
    test("<empty> -> <empty>", () {
      final s = "";
      final t = "";
      expect(levenshteinDistanceOf(s, t), 0);
    });
    test("abcd -> <empty>", () {
      final s = "abcd";
      final t = "";
      expect(levenshteinDistanceOf(s, t), 4);
    });
    test("<empty> -> abcd", () {
      final s = "";
      final t = "abcd";
      expect(levenshteinDistanceOf(s, t), 4);
    });
    test("a -> a", () {
      final s = "a";
      final t = "a";
      expect(levenshteinDistanceOf(s, t), 0);
    });
    test("a -> b", () {
      final s = "a";
      final t = "b";
      expect(levenshteinDistanceOf(s, t), 1);
    });
    test("a -> ab", () {
      final s = "a";
      final t = "ab";
      expect(levenshteinDistanceOf(s, t), 1);
    });
    test("ab -> ba", () {
      final s = "ab";
      final t = "ba";
      expect(levenshteinDistanceOf(s, t), 2);
    });
    test("ac -> abc", () {
      final s = "ac";
      final t = "abc";
      expect(levenshteinDistanceOf(s, t), 1);
    });
    test("abcd -> abcd", () {
      final s = "abcd";
      final t = "abcd";
      expect(levenshteinDistanceOf(s, t), 0);
    });
    test("abcd -> abc", () {
      final s = "abcd";
      final t = "abc";
      expect(levenshteinDistanceOf(s, t), 1);
    });
    test("abcd -> abd", () {
      final s = "abcd";
      final t = "abd";
      expect(levenshteinDistanceOf(s, t), 1);
    });
    test("abcd -> abed", () {
      final s = "abcd";
      final t = "abed";
      expect(levenshteinDistanceOf(s, t), 1);
    });
    test("abcd -> bcd", () {
      final s = "abcd";
      final t = "bcd";
      expect(levenshteinDistanceOf(s, t), 1);
    });
    test("abcd -> bed", () {
      final s = "abcd";
      final t = "bed";
      expect(levenshteinDistanceOf(s, t), 2);
    });
    test("abc -> abcd", () {
      final s = "abc";
      final t = "abcd";
      expect(levenshteinDistanceOf(s, t), 1);
    });
    test("abd -> abcd", () {
      final s = "abd";
      final t = "abcd";
      expect(levenshteinDistanceOf(s, t), 1);
    });
    test("bed -> abcd", () {
      final s = "bed";
      final t = "abcd";
      expect(levenshteinDistanceOf(s, t), 2);
    });
    test("sunday -> saturday", () {
      final s = "sunday";
      final t = "saturday";
      expect(levenshteinDistanceOf(s, t), 3);
    });
    test("kitten -> sitting", () {
      final s = "kitten";
      final t = "sitting";
      expect(levenshteinDistanceOf(s, t), 3);
    });
    test("ABCD -> abCd", () {
      final s = "ABCD";
      final t = "abCd";
      expect(levenshteinDistanceOf(s, t), 3);
    });
    test("ABCD -> abcd | ignoreCase", () {
      final s = "ABCD";
      final t = "abcd";
      expect(levenshteinDistanceOf(s, t, ignoreCase: true), 0);
    });
    test("'ab c\\nd' -> 'a\\tbc d' | ignoreWhitespace", () {
      final s = "ab c\nd";
      final t = "a\tbc d";
      expect(levenshteinDistanceOf(s, t, ignoreWhitespace: true), 0);
    });
    test("'ab c. d' -> 'abc .d' | ignoreWhitespace", () {
      final s = "ab c. d";
      final t = "abc .d";
      expect(levenshteinDistanceOf(s, t, ignoreWhitespace: true), 0);
    });
    test("'ab12cd' -> 'abc6d' | ignoreNumeric", () {
      final s = "ab12cd";
      final t = "abc6d";
      expect(levenshteinDistanceOf(s, t, ignoreNumbers: true), 0);
    });
    test("'ab c..d' -> 'abc-d' | alphaNumericOnly", () {
      final s = "ab c..d";
      final t = "abc-d";
      expect(levenshteinDistanceOf(s, t, alphaNumericOnly: true), 0);
    });
    test("'ab c.2.d' -> 'abc1-d' | alphaNumericOnly + ignoreNumeric", () {
      final s = "ab c.2.d";
      final t = "abc1-d";
      expect(
          levenshteinDistanceOf(s, t,
              alphaNumericOnly: true, ignoreNumbers: true),
          0);
    });
  });
}
