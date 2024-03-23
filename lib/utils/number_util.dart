import 'package:flutter/material.dart';

class NumberUtil {
  /// Returns the Arabic representation of the given number.
  static String getArabicNumber(int number) {
    String res = '';
    String numStr = number.toString();

    final arabics = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    for (var element in numStr.characters) {
      res += arabics[int.parse(element)];
    }

    return res;
  }
}
