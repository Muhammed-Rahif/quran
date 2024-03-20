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
  });

  final Function(Surah surah)? onSurahClick;
  final Surah? selectedSurah;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: surahs.map((surah) {
        return InkWell(
          splashFactory: NoSplash.splashFactory,
          onTap: () {
            onSurahClick?.call(surah);

            if (!Breakpoints.mediumAndUp.isActive(context)) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SurahScreen(surah: surah),
                ),
              );
            }
          },
          child: ListTile(
            tileColor: Colors.transparent,
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
          ),
        );
      }).toList(),
    );
  }
}
