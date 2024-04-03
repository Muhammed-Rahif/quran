import 'package:flutter/material.dart';
import 'package:quran/classes/chapter.dart';
import 'package:quran/providers/chapters_provider.dart';
import 'package:quran/widgets/chapter_list_tile.dart';
import 'package:quran/widgets/custom_progress_indicator.dart';
import 'package:quran/widgets/display_error.dart';

class ListChapters extends StatefulWidget {
  const ListChapters({
    super.key,
    this.selectedChapter,
    this.selectChapter,
    this.scrollController,
  });

  final void Function(Chapter? chapter)? selectChapter;
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
            return const CustomProgressIndicator();
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

              return ChapterListTile(chapter: chapter);
            },
          );
        },
      ),
    );
  }
}
