import 'package:flutter/material.dart';
import 'package:quran/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.dark,
        ).copyWith(
          primary: const Color(0xffefb975),
          background: const Color(0xff151515),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
