import 'package:flutter/material.dart';
import 'package:quran/classes/chapter.dart';
import 'package:quran/constants/app_contants.dart';
import 'package:quran/widgets/quran_page.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ChapterScreen extends StatelessWidget {
  const ChapterScreen({
    super.key,
    required this.chapter,
    this.onBack,
  });

  final Chapter chapter;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    final ItemScrollController itemScrollController = ItemScrollController();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (AppConstants.breakpoint.isActive(context)) {
        Navigator.of(context).popUntil((route) => route.isFirst);
      }

      itemScrollController.jumpTo(index: chapter.pages.first - 1);
    });

    return Scaffold(
      appBar: AppBar(
        notificationPredicate: (notification) => true,
        title: Text(chapter.nameSimple),
        leading: IconButton.filled(
          isSelected: true,
          onPressed: () {
            onBack?.call();
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
        shape: AppConstants.breakpoint.isActive(context)
            ? const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              )
            : null,
      ),
      body: ScrollablePositionedList.builder(
        itemScrollController: itemScrollController,
        itemCount: 604,
        itemBuilder: (context, indx) => QuranPage(pageNo: indx + 1),
      ),
    );
  }
}
