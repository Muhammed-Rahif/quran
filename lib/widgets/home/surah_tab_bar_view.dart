import 'package:flutter/material.dart';
import 'package:quran/classes/chapter.dart';
import 'package:quran/widgets/home/last_read_card.dart';
import 'package:quran/widgets/list_chapters.dart';

class SurahTabBarView extends StatefulWidget {
  const SurahTabBarView({
    super.key,
    required this.selectedChapter,
    required this.selectChapter,
  });

  final Chapter? selectedChapter;
  final void Function(Chapter? chapter)? selectChapter;

  @override
  State<SurahTabBarView> createState() => _SurahTabBarViewState();
}

class _SurahTabBarViewState extends State<SurahTabBarView> {
  bool isScrolled = false;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      setState(() {
        isScrolled = scrollController.offset > 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LastReadCard(expanded: !isScrolled),
        ListChapters(
          scrollController: scrollController,
          selectedChapter: widget.selectedChapter,
          selectChapter: widget.selectChapter,
        ),
      ],
    );
  }
}
