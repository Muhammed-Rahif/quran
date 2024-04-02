import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:quran/classes/chapter.dart';
import 'package:quran/constants/app_contants.dart';
import 'package:quran/screens/chapter_screen.dart';
import 'package:quran/theme/theme.dart';
import 'package:quran/widgets/home/surah_tab_bar_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Chapter? chapter;

  void selectChapter(Chapter? chptr) {
    setState(() => chapter = chptr);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        transitionDuration: const Duration(milliseconds: 500),
        primaryNavigation: SlotLayout(
          config: {
            Breakpoints.standard: SlotLayout.from(
              key: const Key('standard_primary_navigation'),
              builder: (context) => StandardPrimaryNavigation(
                selectedChapter: chapter,
                selectChapter: selectChapter,
              ),
            ),
          },
        ),
        body: SlotLayout(
          config: {
            if (chapter != null)
              AppConstants.breakpoint: SlotLayout.from(
                key: UniqueKey(),
                builder: (context) => ChapterScreen(
                  chapter: chapter!,
                  onBack: () => selectChapter(null),
                ),
              ),
          },
        ),
      ),
    );
  }
}

class StandardPrimaryNavigation extends StatelessWidget {
  const StandardPrimaryNavigation({
    super.key,
    required this.selectedChapter,
    required this.selectChapter,
  });

  final Chapter? selectedChapter;
  final void Function(Chapter?)? selectChapter;

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
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
              PopupMenuButton<String>(
                onSelected: (item) {},
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: '1',
                    child: Text('Go to page'),
                  ),
                  const PopupMenuItem<String>(
                    value: '2',
                    child: Text('Settings'),
                  ),
                ],
              ),
            ],
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
                selectChapter: selectChapter,
              ),
              const Center(child: Text("Juz is not available yet")),
              const Center(child: Text("Bookmarks is not available yet")),
            ],
          ),
        ),
      ),
    );
  }
}
