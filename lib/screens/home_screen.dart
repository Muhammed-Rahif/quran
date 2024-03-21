import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:quran/classes/surah.dart';
import 'package:quran/main.dart';
import 'package:quran/screens/surah_screen.dart';
import 'package:quran/widgets/last_read_card.dart';
import 'package:quran/widgets/list_surahs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Surah? surah;

  void onSurahClick(Surah srh) {
    setState(() => surah = srh);
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
                surah: surah,
                onSurahClick: onSurahClick,
              ),
            ),
          },
        ),
        body: SlotLayout(
          config: {
            if (surah != null)
              Breakpoints.mediumAndUp: SlotLayout.from(
                key: UniqueKey(),
                builder: (context) => SurahScreen(surah: surah!),
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
    required this.surah,
    required this.onSurahClick,
  });

  final Surah? surah;
  final void Function(Surah)? onSurahClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Breakpoints.mediumAndUp.isActive(context) ? 360 : double.infinity,
      child: DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: backgroundColor,
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
              indicatorColor: primaryColor,
              tabs: <Widget>[
                Tab(text: 'Surahs'),
                Tab(text: 'Juz'),
                Tab(text: 'Bookmarks'),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              ListView(
                children: [
                  const LastReadCard(),
                  ListSurahs(
                    selectedSurah: surah,
                    onSurahClick: onSurahClick,
                  ),
                ],
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
