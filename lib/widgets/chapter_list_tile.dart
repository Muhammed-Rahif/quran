import 'package:flutter/material.dart';
import 'package:quran/classes/chapter.dart';

class ChapterListTile extends StatelessWidget {
  const ChapterListTile({
    super.key,
    required this.selectChapter,
    required this.chapter,
    required this.selectedChapter,
  });

  final void Function(Chapter? chapter)? selectChapter;
  final Chapter chapter;
  final Chapter? selectedChapter;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        selectChapter?.call(chapter);
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      tileColor: Colors.transparent,
      selectedTileColor: Colors.white10,
      splashColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
      selected: chapter == selectedChapter,
    );
  }
}
