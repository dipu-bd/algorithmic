// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:algorithmic/algorithmic.dart';
import 'package:test/test.dart';

void main() {
  group("leeDistance()", () {
    test("[3, 1, 4, 0] -> [2, 5, 4, 3]", () {
      final s = [3, 1, 4, 0];
      final t = [2, 5, 4, 3];
      expect(leeDistance(s, t, 6), 6);
    });
  });

  group("leeDistanceOf()", () {
    test("<empty> -> <empty>", () {
      final s = "";
      final t = "";
      expect(leeDistanceOf(s, t), 0);
    });
    test("abcd -> <empty>", () {
      final s = "abcd";
      final t = "";
      expect(() => leeDistanceOf(s, t), throwsA(TypeMatcher<RangeError>()));
    });
    test("ab -> abcd", () {
      final s = "ab";
      final t = "abcd";
      expect(() => leeDistanceOf(s, t), throwsA(TypeMatcher<RangeError>()));
    });
    test("a -> a", () {
      final s = "a";
      final t = "a";
      expect(leeDistanceOf(s, t), 0);
    });
    test("a -> b", () {
      final s = "a";
      final t = "b";
      expect(leeDistanceOf(s, t), 1);
    });
    test("3140 -> 2543", () {
      final s = "3140";
      final t = '2543';
      expect(leeDistanceOf(s, t, q: 6, keyOf: int.parse), 6);
    });
    test("'ABCD' -> 'abcd' | ignoreCase", () {
      final s = "ABCD";
      final t = "abcd";
      expect(leeDistanceOf(s, t, ignoreCase: true), 0);
    });
    test("'ab c\\nd' -> 'a\\tbc d' | ignoreWhitespace", () {
      final s = "ab c\nd";
      final t = "a\tbc d";
      expect(leeDistanceOf(s, t, ignoreWhitespace: true), 0);
    });
    test("'ab c. d' -> 'abc .d' | ignoreWhitespace", () {
      final s = "ab c. d";
      final t = "abc .d";
      expect(leeDistanceOf(s, t, ignoreWhitespace: true), 0);
    });
    test("'ab12cd' -> 'abc6d' | ignoreNumeric", () {
      final s = "ab12cd";
      final t = "abc6d";
      expect(leeDistanceOf(s, t, ignoreNumbers: true), 0);
    });
    test("'ab c..d' -> 'abc-d' | alphaNumericOnly", () {
      final s = "ab c..d";
      final t = "abc-d";
      expect(leeDistanceOf(s, t, alphaNumericOnly: true), 0);
    });
    test("'ab c.2.d' -> 'abc1-d' | alphaNumericOnly + ignoreNumeric", () {
      final s = "ab c.2.d";
      final t = "abc1-d";
      expect(
          leeDistanceOf(s, t, alphaNumericOnly: true, ignoreNumbers: true), 0);
    });
  });
}
