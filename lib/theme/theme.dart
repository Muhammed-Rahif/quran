import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/constants/app_contants.dart';

class AppColors {
  static const Color primaryColor = Color(0xffEDD681);
  static const Color backgroundColor = Color(0xff151515);
}

class AppTheme {
  static ThemeData getThemeData(BuildContext context) {
    final searchBarColor =
        MaterialStateColor.resolveWith((states) => AppColors.primaryColor);
    final searchViewColor = MaterialStateColor.resolveWith(
        (states) => AppColors.primaryColor.withOpacity(.8));

    return ThemeData(
      fontFamily: GoogleFonts.ubuntu().fontFamily,
      splashFactory: NoSplash.splashFactory,
      iconTheme: const IconThemeData(color: AppColors.backgroundColor),
      popupMenuTheme: const PopupMenuThemeData(
        color: AppColors.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        color: AppColors.primaryColor,
        foregroundColor: AppColors.backgroundColor,
        shape: AppConstants.breakpoint.isActive(context)
            ? const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              )
            : null,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(Colors.white),
        trackColor: MaterialStateProperty.all(AppColors.primaryColor),
      ),
      searchBarTheme: SearchBarThemeData(
        backgroundColor: searchBarColor,
        overlayColor: searchBarColor,
      ),
      searchViewTheme: SearchViewThemeData(
        backgroundColor: searchViewColor,
      ),
      primaryColor: AppColors.primaryColor,
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
      ).copyWith(
        primary: AppColors.primaryColor,
        background: AppColors.backgroundColor,
        surfaceTint: Colors.grey,
      ),
    );
  }
}
