import 'package:flutter/material.dart';
import 'package:quran/classes/chapter.dart';
import 'package:quran/constants/app_contants.dart';
import 'package:quran/screens/chapter_screen.dart';
import 'package:quran/screens/settings_screen.dart';
import 'package:quran/theme/theme.dart';
import 'package:quran/widgets/home/surah_tab_bar_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.selectedChapter,
    required this.onSelectChapter,
    required this.navigateTo,
  });

  final Chapter? selectedChapter;
  final void Function(Chapter?)? onSelectChapter;
  final void Function(Widget?) navigateTo;

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
            actions: appBarActions,
            bottom: const TabBar(
              indicatorColor: AppColors.primaryColor,
              tabs: <Widget>[
                Tab(text: 'Surahs'),
                Tab(text: 'Juz'),
                Tab(text: 'Bookmarks'),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              SurahTabBarView(
                selectedChapter: selectedChapter,
                selectChapter: (chptr) {
                  if (chptr != null) {
                    navigateTo(
                      ChapterScreen(
                        chapter: chptr,
                        onBack: () => navigateTo(null),
                      ),
                    );
                  }
                  onSelectChapter?.call(chptr);
                },
              ),
              const Center(child: Text("Juz is not available yet")),
              const Center(child: Text("Bookmarks is not available yet")),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> get appBarActions {
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
            navigateTo(SettingsScreen(onBack: () => navigateTo(null)));
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
