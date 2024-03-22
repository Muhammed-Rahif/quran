import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:quran/classes/surah.dart';
import 'package:quran/data/surah.dart';
import 'package:quran/screens/surah_screen.dart';

class ListSurahs extends StatelessWidget {
  const ListSurahs({
    super.key,
    required this.selectedSurah,
    this.onSurahClick,
    this.scrollController,
  });

  final void Function(Surah surah)? onSurahClick;
  final Surah? selectedSurah;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        controller: scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: surahs.length,
        itemBuilder: (context, index) {
          final surah = surahs[index];

          return ListTile(
            onTap: () {
              onSurahClick?.call(surah);

              if (!Breakpoints.mediumAndUp.isActive(context)) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SurahScreen(
                      surah: surah,
                      // onBack: () =>,
                    ),
                  ),
                );
              }
            },
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            tileColor: Colors.transparent,
            selectedTileColor: Colors.white10,
            splashColor: Colors.transparent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            leading: Stack(
              alignment: Alignment.center,
              children: [
                Text('${surah.id}'),
                Image.asset(
                  'assets/images/number-wrapper-1.png',
                  width: 40,
                  height: 40,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
            trailing: Text(
              surah.arabic,
              style: const TextStyle(fontFamily: 'MeQuran', fontSize: 16),
            ),
            subtitle: Text(surah.english),
            title: Text(surah.name),
            selected: surah == selectedSurah,
          );
        },
      ),
    );
  }
}
