import 'package:flutter/material.dart';
import 'package:quran/screens/home_screen.dart';

const Color primaryColor = Color(0xffdca54c);
const Color backgroundColor = Color(0xff151515);

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: primaryColor,
        ),
        searchBarTheme: SearchBarThemeData(
          backgroundColor:
              MaterialStateColor.resolveWith((states) => primaryColor),
          overlayColor:
              MaterialStateColor.resolveWith((states) => primaryColor),
          surfaceTintColor:
              MaterialStateColor.resolveWith((states) => primaryColor),
        ),
        searchViewTheme: SearchViewThemeData(
          backgroundColor: MaterialStateColor.resolveWith(
              (states) => primaryColor.withOpacity(.8)),
          surfaceTintColor: MaterialStateColor.resolveWith(
              (states) => primaryColor.withOpacity(.8)),
        ),
        primaryColor: primaryColor,
        colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.dark,
        ).copyWith(
          primary: primaryColor,
          background: backgroundColor,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
