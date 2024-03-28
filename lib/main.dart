import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quran/screens/home_screen.dart';
import 'package:quran/theme/theme.dart';

void main() {
  runApp(const MainApp());
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: AppScrollBehavior(),
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      debugShowCheckedModeBanner: false,
      theme: AppTheme.data,
      home: const HomeScreen(),
    );
  }
}
