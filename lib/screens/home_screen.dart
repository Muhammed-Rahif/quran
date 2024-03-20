import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:quran/classes/surah.dart';
import 'package:quran/screens/surah_screen.dart';
import 'package:quran/widgets/list_surahs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Surah? surah;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        transitionDuration: const Duration(milliseconds: 500),
        primaryNavigation: SlotLayout(
          config: {
            Breakpoints.standard: SlotLayout.from(
              key: const Key('primary_navigation'),
              builder: (context) => SizedBox(
                width: Breakpoints.mediumAndUp.isActive(context)
                    ? 360
                    : double.infinity,
                child: Scaffold(
                  body: ListView(
                    children: [
                      const LastReadCard(),
                      ListSurahs(
                        selectedSurah: surah,
                        onSurahClick: (srh) => setState(() => surah = srh),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          },
        ),
        body: SlotLayout(
          config: {
            Breakpoints.mediumAndUp: SlotLayout.from(
              key: UniqueKey(),
              builder: (context) =>
                  surah != null ? SurahScreen(surah: surah!) : const SizedBox(),
            ),
          },
        ),
      ),
    );
  }
}

class LastReadCard extends StatelessWidget {
  const LastReadCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Ink(
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primary,
          image: const DecorationImage(
            image:
                AssetImage('assets/images/flat-arabic-pattern-background.jpg'),
            fit: BoxFit.cover,
            opacity: .2,
          ),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          splashFactory: NoSplash.splashFactory,
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Last Read',
                      style: TextStyle(
                        color: Color(0xff1E242B),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Image.asset(
                      'assets/images/bismillah-calligraphy.png',
                      height: 40,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Al Fatihah',
                          style: TextStyle(
                            color: Color(0xff1E242B),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Ayah 1',
                          style: TextStyle(
                            color: Color(0xff1E242B),
                          ),
                        ),
                      ],
                    ),
                    IconButton.filled(
                      onPressed: () {},
                      icon: const Icon(Icons.bookmark),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
