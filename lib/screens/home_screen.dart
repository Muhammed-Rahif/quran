import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:quran/data/surah.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Surah? surah;

  List<NavigationDestination> destinations = const [
    NavigationDestination(
      label: 'Home',
      icon: Icon(Icons.home),
    ),
    NavigationDestination(
      label: 'Settings',
      icon: Icon(Icons.settings),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        transitionDuration: const Duration(milliseconds: 500),
        primaryNavigation: SlotLayout(
          config: {
            Breakpoints.standard: SlotLayout.from(
              key: const Key('navigation'),
              builder: (context) => SizedBox(
                width: 360,
                child: Scaffold(
                  appBar: AppBar(
                    title: const Text('The Holy Quran'),
                  ),
                  body: ListView.builder(
                    shrinkWrap: true,
                    itemCount: surahs.length,
                    itemBuilder: (context, index) {
                      final surah = surahs[index];
                      final tileColor = index % 2 == 0
                          ? const Color(0xFFF9FBC0)
                          : const Color(0xFFFEFFDD);

                      return ListTile(
                        selectedTileColor: const Color(0xFFFFFFFF),
                        focusColor: const Color(0xffF0D883),
                        tileColor: tileColor,
                        leading: Text('${index + 1}'),
                        subtitle: Text(surah.english),
                        title: Text(surah.name),
                        selected: surah == this.surah,
                        onTap: () {
                          setState(() {
                            this.surah = surah;
                          });
                          if (!Breakpoints.mediumAndUp.isActive(context)) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailScreen(surah: surah),
                              ),
                            );
                          }
                        },
                      );
                    },
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
              builder: (context) => surah != null
                  ? DetailScreen(surah: surah!)
                  : const SizedBox(),
            ),
          },
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
    required this.surah,
  });

  final Surah surah;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (Breakpoints.mediumAndUp.isActive(context)) {
        Navigator.of(context).popUntil((route) => route.isFirst);
      }
    });

    return Scaffold(
      appBar: !Breakpoints.mediumAndUp.isActive(context)
          ? AppBar(
              title: Text(surah.english),
            )
          : null,
      body: Center(
        child: Image.network(
          'https://github.com/aymendn/the-holy-quran-app-flutter/blob/main/assets/quran-images/page017.png?raw=true',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
