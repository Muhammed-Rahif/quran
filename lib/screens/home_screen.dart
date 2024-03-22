import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:quran/classes/chapter.dart';
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

  void onChapterClick(Chapter chptr) {
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
                onChapterClick: onChapterClick,
              ),
            ),
          },
        ),
        body: SlotLayout(
          config: {
            if (chapter != null)
              Breakpoints.mediumAndUp: SlotLayout.from(
                key: UniqueKey(),
                builder: (context) => ChapterScreen(chapter: chapter!),
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
    required this.onChapterClick,
  });

  final Chapter? selectedChapter;
  final void Function(Chapter)? onChapterClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Breakpoints.mediumAndUp.isActive(context) ? 360 : double.infinity,
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
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              ),
            ],
            bottom: const TabBar(
              splashFactory: NoSplash.splashFactory,
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
                onChapterClick: onChapterClick,
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
