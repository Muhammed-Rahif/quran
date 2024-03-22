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
      debugShowCheckedModeBanner: false,
      theme: AppTheme.data,
      home: const HomeScreen(),
    );
  }
}
