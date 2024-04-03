import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/classes/chapter.dart';
import 'package:quran/notifiers/adaptive_layout_notifier.dart';
import 'package:quran/notifiers/chapter_notifier.dart';
import 'package:quran/screens/chapter_screen.dart';

class ChapterListTile extends StatelessWidget {
  const ChapterListTile({
    super.key,
    required this.chapter,
  });

  final Chapter chapter;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 0,
      onTap: () {
        context.read<ChapterNotifier>().setChapter(chapter);

        context.read<AdaptiveLayoutNotifier>().navigateTo(
              context,
              const ChapterScreen(),
            );
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      tileColor: Colors.transparent,
      selectedTileColor: Colors.white10,
      splashColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      dense: true,
      titleAlignment: ListTileTitleAlignment.center,
      leading: Stack(
        alignment: Alignment.center,
        children: [
          Text('${chapter.id}'),
          Image.asset(
            'assets/images/number-wrapper.png',
            width: 40,
            height: 40,
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
      trailing: Text(
        chapter.id.toString().padLeft(3, '0'),
        style: const TextStyle(
          fontFamily: 'Surah-Names',
          fontSize: 26,
        ),
      ),
      subtitle: Text(chapter.translatedName.name),
      title: Text(chapter.nameSimple),
      selected: chapter == context.watch<ChapterNotifier>().chapter,
    );
  }
}
