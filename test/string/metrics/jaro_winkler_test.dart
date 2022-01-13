// Copyright (c) 2021, Sudipto Chandra
// All rights reserved. Check LICENSE file for details.

// ignore_for_file: prefer_function_declarations_over_variables

import 'package:algorithmic/algorithmic.dart';
import 'package:test/test.dart';

void main() {
  final matcher = (double a) => (double b) => (a - b).abs() < 1e-3;

  group("jaroWinklerSimilarityOf()", () {
    test("<empty> -> <empty>", () {
      final s = "";
      final t = "";
      double r = 1;
      expect(jaroWinklerSimilarityOf(s, t), matcher(r));
    });
    test("<empty> -> abc", () {
      final s = "";
      final t = "abc";
      double r = 0;
      expect(jaroWinklerSimilarityOf(s, t), matcher(r));
    });
    test("abs -> <empty>", () {
      final s = "abs";
      final t = "";
      double r = 0;
      expect(jaroWinklerSimilarityOf(s, t), matcher(r));
    });
    test("TRATE -> TRACE | prefixScale: 0.1", () {
      final s = "TRATE";
      final t = "TRACE";
      double r = 0.9066666666666667;
      expect(jaroWinklerSimilarityOf(s, t, prefixScale: 0.1), matcher(r));
    });
    test("frog -> fog | prefix: 0.1", () {
      final s = "frog";
      final t = "fog";
      double r = 0.925;
      expect(jaroWinklerSimilarityOf(s, t), matcher(r));
    });
    test("fly -> ant", () {
      final s = "fly";
      final t = "ant";
      double r = 0.0;
      expect(jaroWinklerSimilarityOf(s, t), matcher(r));
    });
    test("elephant -> hippo", () {
      final s = "elephant";
      final t = "hippo";
      double r = 0.44166666;
      expect(jaroWinklerSimilarityOf(s, t), matcher(r));
    });
    test("hippo -> elephant", () {
      final s = "hippo";
      final t = "elephant";
      double r = 0.44166666;
      expect(jaroWinklerSimilarityOf(s, t), matcher(r));
    });
    test("hippo -> zzzzzzzz", () {
      final s = "hippo";
      final t = "zzzzzzzz";
      double r = 0.0;
      expect(jaroWinklerSimilarityOf(s, t), matcher(r));
    });
    test("hello -> hallo", () {
      final s = "hello";
      final t = "hallo";
      double r = 0.88;
      expect(jaroWinklerSimilarityOf(s, t, prefixScale: 0.1), matcher(r));
    });
    test("ABC Corporation -> ABC Corp", () {
      final s = "ABC Corporation";
      final t = "ABC Corp";
      double r = 0.9274;
      expect(jaroWinklerSimilarityOf(s, t), matcher(r));
    });
    test("My Gym Children's Fitness Center -> My Gym. Childrens Fitness", () {
      final s = "My Gym Children's Fitness Center";
      final t = "My Gym. Childrens Fitness";
      double r = 0.92145;
      expect(jaroWinklerSimilarityOf(s, t), matcher(r));
    });
    test("PENNSYLVANIA -> PENNCISYLVNIA", () {
      final s = "PENNSYLVANIA";
      final t = "PENNCISYLVNIA";
      double r = 0.8823292;
      expect(jaroWinklerSimilarityOf(s, t), matcher(r));
    });

    test("accomodate -> accommodate | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "accomodate";
      final t = "accommodate";
      double r = 1 - 0.01818181818;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });
    test("accomodate -> accommodated | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "accomodate";
      final t = "accommodated";
      double r = 1 - 0.03333333333;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });
    test("accomodate -> accommodated | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "accomodate";
      final t = "accommodated";
      double r = 1 - 0.03333333333;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });
    test("accomodate -> accommodates | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "accomodate";
      final t = "accommodates";
      double r = 1 - 0.03333333333;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });
    test("accomodate -> accommodation | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "accomodate";
      final t = "accommodation";
      double r = 1 - 0.08153846154;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });
    test("accomodate -> accommodating | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "accomodate";
      final t = "accommodating";
      double r = 1 - 0.08153846154;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });

    test("definately -> definitely | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "definately";
      final t = "definitely";
      double r = 1 - 0.04;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });
    test("definately -> defiantly | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "definately";
      final t = "defiantly";
      double r = 1 - 0.04222222222;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });
    test("definately -> define | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "definately";
      final t = "define";
      double r = 1 - 0.08;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });
    test("definately -> definite | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "definately";
      final t = "definite";
      double r = 1 - 0.085;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });
    test("definately -> definable | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "definately";
      final t = "definable";
      double r = 1 - 0.08722222222;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });

    test("goverment -> government | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "goverment";
      final t = "government";
      double r = 1 - 0.05333333333;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });
    test("goverment -> governments | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "goverment";
      final t = "governments";
      double r = 1 - 0.0696969697;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });
    test("goverment -> govern | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "goverment";
      final t = "govern";
      double r = 1 - 0.06666666667;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });
    test("goverment -> governmental | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "goverment";
      final t = "governmental";
      double r = 1 - 0.08333333333;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });
    test("goverment -> governs | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "goverment";
      final t = "governs";
      double r = 1 - 0.09523809524;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });

    test("occured -> occurred | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "occured";
      final t = "occurred";
      double r = 1 - 0.025;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });
    test("occured -> occur | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "occured";
      final t = "occur";
      double r = 1 - 0.05714285714;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });
    test("occured -> occupied | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "occured";
      final t = "occupied";
      double r = 1 - 0.07857142857;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });
    test("occured -> occurs | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "occured";
      final t = "occurs";
      double r = 1 - 0.09047619048;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });
    test("occured -> cured | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "occured";
      final t = "cured";
      double r = 1 - 0.09523809524;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });

    test("publically -> publicly | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "publically";
      final t = "publicly";
      double r = 1 - 0.04;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });
    test("publically -> public | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "publically";
      final t = "public";
      double r = 1 - 0.08;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });
    test("publically -> publicity | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "publically";
      final t = "publicity";
      double r = 1 - 0.1044444444;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });
    test("publically -> publication | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "publically";
      final t = "publication";
      double r = 1 - 0.1327272727;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });
    test("publically -> politically | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "publically";
      final t = "politically";
      double r = 1 - 0.1418181818;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });

    test("recieve -> receive | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "recieve";
      final t = "receive";
      double r = 1 - 0.03333333333;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });
    test("recieve -> received | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "recieve";
      final t = "received";
      double r = 1 - 0.0625;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });
    test("recieve -> receives | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "recieve";
      final t = "receives";
      double r = 1 - 0.0625;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });
    test("recieve -> receiver | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "recieve";
      final t = "receiver";
      double r = 1 - 0.0625;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });
    test("recieve -> relieve | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "recieve";
      final t = "relieve";
      double r = 1 - 0.07619047619;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });

    test("seperate -> desperate | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "seperate";
      final t = "desperate";
      double r = 1 - 0.0787037037;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });
    test("seperate -> separate | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "seperate";
      final t = "separate";
      double r = 1 - 0.09166666667;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });
    test("seperate -> separated | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "seperate";
      final t = "separated";
      double r = 1 - 0.1143518519;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });
    test("seperate -> separates | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "seperate";
      final t = "separates";
      double r = 1 - 0.1143518519;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });
    test("seperate -> temperate | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "seperate";
      final t = "temperate";
      double r = 1 - 0.1157407407;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });

    test("untill -> until | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "untill";
      final t = "until";
      double r = 1 - 0.03333333333;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });
    test("untill -> untie | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "untill";
      final t = "untie";
      double r = 1 - 0.1066666667;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });
    test("untill -> untimely | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "untill";
      final t = "untimely";
      double r = 1 - 0.1083333333;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });
    test("untill -> till | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "untill";
      final t = "till";
      double r = 1 - 0.1111111111;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });
    test("untill -> Huntsville | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "untill";
      final t = "Huntsville";
      double r = 1 - 0.1333333333;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });

    test("wich -> witch | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "wich";
      final t = "witch";
      double r = 1 - 0.05333333333;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });
    test("wich -> which | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "wich";
      final t = "which";
      double r = 1 - 0.06;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });
    test("wich -> switch | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "wich";
      final t = "switch";
      double r = 1 - 0.1111111111;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });
    test("wich -> twitch | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "wich";
      final t = "twitch";
      double r = 1 - 0.1111111111;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });
    test("wich -> witches | t: 0, p: 0.1, prefixSize: 4", () {
      final s = "wich";
      final t = "witches";
      double r = 1 - 0.1142857143;
      expect(
        jaroWinklerSimilarityOf(
          s,
          t,
          prefixScale: 0.1,
          threshold: 0,
          maxPrefixSize: 4,
        ),
        matcher(r),
      );
    });
  });
}
