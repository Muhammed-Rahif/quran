import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xffEDD681);
  static const Color backgroundColor = Color(0xff151515);
}

class AppTheme {
  static ThemeData get data {
    final searchBarColor =
        MaterialStateColor.resolveWith((states) => AppColors.primaryColor);
    final searchViewColor = MaterialStateColor.resolveWith(
        (states) => AppColors.primaryColor.withOpacity(.8));

    return ThemeData(
      splashFactory: NoSplash.splashFactory,
      iconTheme: const IconThemeData(color: AppColors.backgroundColor),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: AppColors.primaryColor,
        foregroundColor: AppColors.backgroundColor,
      ),
      searchBarTheme: SearchBarThemeData(
        backgroundColor: searchBarColor,
        overlayColor: searchBarColor,
        surfaceTintColor: searchBarColor,
      ),
      searchViewTheme: SearchViewThemeData(
        backgroundColor: searchViewColor,
        surfaceTintColor: searchViewColor,
      ),
      primaryColor: AppColors.primaryColor,
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
      ).copyWith(
        primary: AppColors.primaryColor,
        background: AppColors.backgroundColor,
      ),
    );
  }
}
