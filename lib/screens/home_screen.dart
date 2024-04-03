import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/constants/app_contants.dart';
import 'package:quran/notifiers/adaptive_layout_notifier.dart';
import 'package:quran/screens/settings_screen.dart';
import 'package:quran/theme/theme.dart';
import 'package:quran/widgets/home/surah_tab_bar_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppConstants.breakpoint.isActive(context) ? 360 : double.infinity,
      child: DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: AppColors.backgroundColor,
            title: const Text('Quran App'),
            actions: getAppBarActions(context),
            bottom: const TabBar(
              indicatorColor: AppColors.primaryColor,
              tabs: <Widget>[
                Tab(text: 'Surahs'),
                Tab(text: 'Juz'),
                Tab(text: 'Bookmarks'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              SurahTabBarView(),
              Center(child: Text("Juz is not available yet")),
              Center(child: Text("Bookmarks is not available yet")),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getAppBarActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.search),
      ),
      PopupMenuButton<int>(
        onSelected: (i) {
          if (i == 1) {
            // Go to page
          } else if (i == 2) {
            // Settings
            context.read<AdaptiveLayoutNotifier>().navigateTo(
              context,
              SettingsScreen(onBack: () {
                context
                    .read<AdaptiveLayoutNotifier>()
                    .navigateTo(context, null);
              }),
            );
          }
        },
        itemBuilder: (BuildContext context) => [
          const PopupMenuItem(
            value: 1,
            child: Text('Go to page'),
          ),
          const PopupMenuItem(
            value: 2,
            child: Text('Settings'),
          ),
        ],
      ),
    ];
  }
}
