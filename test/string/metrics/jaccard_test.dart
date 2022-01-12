// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

import 'package:algorithmic/algorithmic.dart';
import 'package:edit_distance/edit_distance.dart';
import 'package:test/test.dart';

void main() {
  group("jaccardIndex() | jaccardIndexOf()", () {
    test("<empty> -> <empty>", () {
      final s = "";
      final t = "";
      expect(jaccardIndexOf(s, t), 0);
    });
    test("a -> a", () {
      final s = "a";
      final t = "a";
      expect(jaccardIndexOf(s, t), 1);
    });
    test("a -> b", () {
      final s = "a";
      final t = "b";
      expect(jaccardIndexOf(s, t), 0);
    });
    test("ab -> a", () {
      final s = "ab";
      final t = "a";
      expect(jaccardIndexOf(s, t), 0.5);
    });
    test("dm -> dds", () {
      final s = "dm";
      final t = "dds";
      expect(jaccardIndexOf(s, t), 0.3333333333333333);
    });
    test("[1, 1, 2, 3, 4] -> [2, 3, 4, 5, 6, 7, 7, 8]", () {
      final s = [1, 1, 2, 3, 4];
      final t = [2, 3, 4, 5, 6, 7, 7, 8];
      expect(jaccardIndex(s, t), 0.375);
    });
    test("['data', 'science'] -> ['data']", () {
      final s = ['data', 'science'];
      final t = ['data'];
      expect(jaccardIndex(s, t), 0.5);
    });
    test("['data', 'management'] -> ['data', 'data', 'science']", () {
      final s = ['data', 'management'];
      final t = ['data', 'data', 'science'];
      expect(jaccardIndex(s, t), 0.3333333333333333);
    });
    test("['Niall'] -> ['Neal', 'Njall']", () {
      final s = ['Niall'];
      final t = ['Neal', 'Njall'];
      expect(jaccardIndex(s, t), 0);
    });
  });

  group("jaccardDistance() | jaccardDistanceOf()", () {
    final jaccard = Jaccard(ngram: 1);
    test("<empty> -> <empty>", () {
      final s = "";
      final t = "";
      expect(jaccardDistanceOf(s, t), jaccard.distance(s, t));
    });
    test("a -> a", () {
      final s = "a";
      final t = "a";
      expect(jaccardDistanceOf(s, t), jaccard.distance(s, t));
    });
    test("a -> b", () {
      final s = "a";
      final t = "b";
      expect(jaccardDistanceOf(s, t), jaccard.distance(s, t));
    });
    test("ab -> a", () {
      final s = "ab";
      final t = "a";
      expect(jaccardDistanceOf(s, t), jaccard.distance(s, t));
    });
    test("dm -> dds", () {
      final s = "dm";
      final t = "dds";
      expect(jaccardDistanceOf(s, t), jaccard.distance(s, t));
    });
  });
  
  group("jaccardDistance() | jaccardDistanceOf() | ngram = 3", () {
    final jaccard = Jaccard(ngram: 3);
    test("<empty> -> <empty>", () {
      final s = "";
      final t = "";
      expect(jaccardDistanceOf(s, t, ngram: 3), jaccard.distance(s, t));
    });
    test("a -> a", () {
      final s = "a";
      final t = "a";
      expect(jaccardDistanceOf(s, t, ngram: 3), jaccard.distance(s, t));
    });
    test("a -> b", () {
      final s = "a";
      final t = "b";
      expect(jaccardDistanceOf(s, t, ngram: 3), jaccard.distance(s, t));
    });
    test("ab -> a", () {
      final s = "ab";
      final t = "a";
      expect(jaccardDistanceOf(s, t, ngram: 3), jaccard.distance(s, t));
    });
    test("dm -> dds", () {
      final s = "dm";
      final t = "dds";
      expect(jaccardDistanceOf(s, t, ngram: 3), jaccard.distance(s, t));
    });
    test("ababababa -> bbabababbaba", () {
      final s = "ababababa";
      final t = "bbabababbaba";
      expect(jaccardDistanceOf(s, t, ngram: 3), jaccard.distance(s, t));
    });
    test("abbababbabbabsbsbab -> babbbababb", () {
      final s = "abbababbabbabsbsbab";
      final t = "babbbababb";
      expect(jaccardDistanceOf(s, t, ngram: 3), jaccard.distance(s, t));
    });
    test("abcdefgh -> ijklmnop", () {
      final s = "abcdefgh";
      final t = "ijklmnop";
      expect(jaccardDistanceOf(s, t, ngram: 3), jaccard.distance(s, t));
    });
  });
}
