import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:quran/classes/chapter.dart';
import 'package:quran/providers/chapters_provider.dart';
import 'package:quran/screens/chapter_screen.dart';
import 'package:quran/widgets/display_error.dart';

class ListChapters extends StatefulWidget {
  const ListChapters({
    super.key,
    this.selectedChapter,
    this.onChapterClick,
    this.scrollController,
  });

  final void Function(Chapter chapter)? onChapterClick;
  final Chapter? selectedChapter;
  final ScrollController? scrollController;

  @override
  State<ListChapters> createState() => _ListChaptersState();
}

class _ListChaptersState extends State<ListChapters> {
  Future allChaptersFuture = ChaptersProvider.getAllChapters();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FutureBuilder(
        future: allChaptersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return DisplayError(
              error: snapshot.error.toString(),
              onRetry: () {
                setState(() {
                  allChaptersFuture = ChaptersProvider.getAllChapters();
                });
              },
            );
          }

          final chapters = snapshot.data as List<Chapter>;

          return ListView.builder(
            controller: widget.scrollController,
            padding: const EdgeInsets.all(10),
            itemCount: chapters.length,
            itemBuilder: (context, index) {
              final chapter = chapters[index];

              return ChapterListTile(
                onChapterClick: widget.onChapterClick,
                chapter: chapter,
                selectedChapter: widget.selectedChapter,
              );
            },
          );
        },
      ),
    );
  }
}

class ChapterListTile extends StatelessWidget {
  const ChapterListTile({
    super.key,
    required this.onChapterClick,
    required this.chapter,
    required this.selectedChapter,
  });

  final void Function(Chapter chapter)? onChapterClick;
  final Chapter chapter;
  final Chapter? selectedChapter;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onChapterClick?.call(chapter);

        if (!Breakpoints.mediumAndUp.isActive(context)) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ChapterScreen(
                chapter: chapter,
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      leading: Stack(
        alignment: Alignment.center,
        children: [
          Text('${chapter.id}'),
          Image.asset(
            'assets/images/number-wrapper-1.png',
            width: 40,
            height: 40,
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
      trailing: Text(
        chapter.nameArabic,
        style: const TextStyle(fontFamily: 'Uthmanic Script', fontSize: 16),
      ),
      subtitle: Text(chapter.translatedName.name),
      title: Text(chapter.nameSimple),
      selected: chapter == selectedChapter,
    );
  }
}
