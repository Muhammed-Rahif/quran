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
        primaryNavigation: SlotLayout(
          config: {
            Breakpoints.smallAndUp: SlotLayout.from(
              key: const Key('home'),
              builder: (context) => SizedBox(
                width: 300,
                child: ListView.builder(
                  itemCount: surahs.length,
                  itemBuilder: (context, index) {
                    final surah = surahs[index];
                    return ListTile(
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
                              builder: (context) => DetailScreen(surah: surah),
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
              ),
            )
          },
        ),
        body: SlotLayout(
          config: {
            Breakpoints.smallAndUp: SlotLayout.from(
              key: UniqueKey(),
              builder: (context) => Center(
                child: Text('${surah?.english}'),
              ),
            )
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
    if (Breakpoints.mediumAndUp.isActive(context)) {
      Navigator.of(context).popUntil((route) => route.isFirst);
    }

    return Scaffold(
      body: Center(
        child: Text(surah.english),
      ),
    );
  }
}
