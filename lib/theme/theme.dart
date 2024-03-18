import 'package:flutter/material.dart';

abstract class ThemePalette {
  ThemePalette({
    required this.textPrimary,
    required this.textSecondary,
    required this.backgroundPrimary,
    required this.backgroundSecondary,
  });

  Color textPrimary;
  Color textSecondary;
  Color backgroundPrimary;
  Color backgroundSecondary;
}

class DarkTheme implements ThemePalette {
  @override
  Color backgroundPrimary = const Color(0xff1f2125);
  @override
  Color backgroundSecondary = const Color(0xff777777);
  @override
  Color textPrimary = const Color(0xffE7E9EA);
  @override
  Color textSecondary = const Color(0xff777777);
}

class SepiaTheme implements ThemePalette {
  @override
  Color backgroundPrimary = const Color(0xffF8EBD5);
  @override
  Color backgroundSecondary = const Color(0xffF2E0BF);
  @override
  Color textPrimary = const Color(0xff000000);
  @override
  Color textSecondary = const Color(0xff666666);
}
