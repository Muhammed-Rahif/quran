import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:quran/classes/chapter.dart';
import 'package:quran/constants/app_contants.dart';
import 'package:quran/screens/home_screen.dart';

class AdaptiveScreen extends StatefulWidget {
  const AdaptiveScreen({super.key});

  @override
  State<AdaptiveScreen> createState() => _AdaptiveScreenState();
}

class _AdaptiveScreenState extends State<AdaptiveScreen> {
  Widget? body;
  Chapter? chapter;

  selectChapter(Chapter? chptr) {
    setState(() {
      chapter = chptr;
    });
  }

  navigateTo(Widget? widget) {
    setState(() => body = widget);

    if (!AppConstants.breakpoint.isActive(context) && widget != null) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => widget),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   if (!AppConstants.breakpoint.isActive(context) && body != null) {
    //     Navigator.of(context).push(
    //       MaterialPageRoute(builder: (context) => body!),
    //     );
    //   }
    // });

    return Scaffold(
      body: AdaptiveLayout(
        key: const Key('adaptive_layout'),
        transitionDuration: const Duration(milliseconds: 300),
        primaryNavigation: SlotLayout(
          key: const Key('primary_navigation'),
          config: {
            Breakpoints.standard: SlotLayout.from(
              key: const Key('standard_primary_navigation'),
              builder: (context) => HomeScreen(
                selectedChapter: chapter,
                onSelectChapter: selectChapter,
                navigateTo: navigateTo,
              ),
            ),
          },
        ),
        body: SlotLayout(
          key: const Key('body'),
          config: {
            AppConstants.breakpoint: SlotLayout.from(
              key: const Key('body_large'),
              builder: (context) => body ?? const SizedBox(),
            ),
          },
        ),
      ),
    );
  }
}
