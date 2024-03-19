import 'package:flutter/material.dart';
import 'package:quran/screens/home_screen.dart';
import 'package:quran/theme/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: SepiaTheme().textPrimary,
          secondary: SepiaTheme().textSecondary,
          background: SepiaTheme().backgroundPrimary,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
