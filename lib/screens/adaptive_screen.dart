import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:provider/provider.dart';
import 'package:quran/constants/app_contants.dart';
import 'package:quran/notifiers/adaptive_layout_notifier.dart';
import 'package:quran/screens/home_screen.dart';

typedef NavigateTo = void Function(Widget? widget);

class AdaptiveScreen extends StatelessWidget {
  const AdaptiveScreen({super.key});

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
              builder: homeScreenBuilder,
            ),
          },
        ),
        body: SlotLayout(
          key: const Key('body'),
          config: {
            AppConstants.breakpoint: SlotLayout.from(
              key: const Key('body_large'),
              builder: bodyBuilder,
            ),
          },
        ),
      ),
    );
  }

  Widget bodyBuilder(BuildContext context) {
    return context.watch<AdaptiveLayoutNotifier>().body ?? const SizedBox();
  }

  Widget homeScreenBuilder(context) {
    return const HomeScreen();
  }
}
