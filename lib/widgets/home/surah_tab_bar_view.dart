import 'package:flutter/material.dart';
import 'package:quran/widgets/home/last_read_card.dart';
import 'package:quran/widgets/list_chapters.dart';

class SurahTabBarView extends StatefulWidget {
  const SurahTabBarView({
    super.key,
  });

  @override
  State<SurahTabBarView> createState() => _SurahTabBarViewState();
}

class _SurahTabBarViewState extends State<SurahTabBarView>
    with AutomaticKeepAliveClientMixin<SurahTabBarView> {
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
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        LastReadCard(expanded: !isScrolled),
        ListChapters(scrollController: scrollController),
      ],
    );
  }
}
