import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/notifiers/adaptive_layout_notifier.dart';
import 'package:quran/notifiers/chapter_notifier.dart';
import 'package:quran/screens/adaptive_screen.dart';
import 'package:quran/theme/theme.dart';
import 'package:quran/utils/api_utils.dart';

void main() async {
  await ApiUtils.init();

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ChapterNotifier()),
      ChangeNotifierProvider(create: (_) => AdaptiveLayoutNotifier()),
    ], child: const MainApp()),
  );
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
      theme: AppTheme.getThemeData(context),
      home: const AdaptiveScreen(),
    );
  }
}
