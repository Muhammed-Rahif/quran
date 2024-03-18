import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:quran/theme/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: SepiaTheme().textPrimary,
          secondary: SepiaTheme().textSecondary,
          background: SepiaTheme().backgroundPrimary,
        ),
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  int? selectedSurah;

  @override
  Widget build(BuildContext context) {
    // Define the children to display within the body at different breakpoints.
    final List<Widget> children = <Widget>[
      for (int i = 0; i < 114; i++)
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () => setState(() {
              selectedSurah = i + 1;
            }),
            child: Container(
              width: double.infinity,
              height: 50,
              color: SepiaTheme().backgroundSecondary,
              child: Center(child: Text('Surah ${i + 1}')),
            ),
          ),
        )
    ];

    final surah = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: Text('Surah $selectedSurah')),
    );

    return AdaptiveScaffold(
      transitionDuration: const Duration(milliseconds: 300),
      appBar: AppBar(
        title: const Text('Quran'),
        leading: selectedSurah != null
            ? BackButton(
                onPressed: () => setState(() {
                  selectedSurah = null;
                }),
              )
            : null,
      ),
      appBarBreakpoint: Breakpoints.small,
      useDrawer: false,
      destinations: const [
        NavigationDestination(icon: Icon(Icons.book), label: 'Quran'),
        NavigationDestination(icon: Icon(Icons.brush_sharp), label: 'Juz'),
        NavigationDestination(icon: Icon(Icons.bookmark), label: 'Bookmarks'),
      ],
      selectedIndex: selectedIndex,
      onSelectedIndexChange: (indx) => setState(() => selectedIndex = indx),
      secondaryBody: (_) => surah,
      body: (context) => SingleChildScrollView(
        child: Column(
          children: children,
        ),
      ),
      smallBody: (context) => AnimatedSwitcher(
        duration: const Duration(microseconds: 300),
        child: selectedSurah != null
            ? surah
            : SingleChildScrollView(
                child: Column(
                  children: children,
                ),
              ),
      ),
      bodyRatio: .3,
      smallSecondaryBody: AdaptiveScaffold.emptyBuilder,
    );
  }
}
