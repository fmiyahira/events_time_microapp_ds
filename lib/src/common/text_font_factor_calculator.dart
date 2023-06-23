import 'package:flutter/material.dart';

class TextFontScaleCalculator {
  static double call(
    double currentFontSize,
    BuildContext context,
  ) {
    final double currentTextScaleFactor =
        MediaQuery.of(context).textScaleFactor;

    if (currentTextScaleFactor < 1) {
      return currentFontSize / (currentFontSize + 1);
    }

    if (currentTextScaleFactor == 1) {
      return 1;
    }

    if (currentTextScaleFactor < 1.5) {
      return currentFontSize / (currentFontSize - 1);
    }

    if (currentTextScaleFactor < 2) {
      return currentFontSize / (currentFontSize - 2);
    }

    if (currentTextScaleFactor < 2.5) {
      return currentFontSize / (currentFontSize - 3);
    }

    return currentFontSize / (currentFontSize - 4);
  }
}
