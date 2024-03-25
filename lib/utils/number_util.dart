import 'package:flutter/material.dart';

class NumberUtil {
  /// Returns the Arabic representation of the given number.
  static String getArabicNumber(int number, {bool isAyahEnd = false}) {
    String res = '';
    String numStr = number.toString();

    final arabics = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    for (var element in numStr.characters) {
      res += arabics[int.parse(element)];
    }

    if (isAyahEnd) {
      // ﴿ ORNATE RIGHT PARENTHESIS Unicode: U+FD3F, UTF-8: EF B4 BF
      // ﴾ ORNATE LEFT PARENTHESIS Unicode: U+FD3E, UTF-8: EF B4 BE
      // wrap the number in ornate parentheses
      res = ' ﴿$res﴾ ';
    }

    return res;
  }
}
