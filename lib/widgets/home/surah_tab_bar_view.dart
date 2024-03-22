import 'package:flutter/material.dart';
import 'package:quran/classes/surah.dart';
import 'package:quran/widgets/home/last_read_card.dart';
import 'package:quran/widgets/list_surahs.dart';

class SurahTabBarView extends StatefulWidget {
  const SurahTabBarView({
    super.key,
    required this.selectedSurah,
    required this.onSurahClick,
  });

  final Surah? selectedSurah;
  final void Function(Surah surah)? onSurahClick;

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
        ListSurahs(
          scrollController: scrollController,
          selectedSurah: widget.selectedSurah,
          onSurahClick: widget.onSurahClick,
        ),
      ],
    );
  }
}
