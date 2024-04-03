import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:quran/classes/chapter.dart';
import 'package:quran/constants/app_contants.dart';
import 'package:quran/widgets/quran_page.dart';

class ChapterScreen extends StatefulWidget {
  const ChapterScreen({
    super.key,
    required this.chapter,
    this.onBack,
  });

  final Chapter chapter;
  final VoidCallback? onBack;

  @override
  State<ChapterScreen> createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  late PageController controller;

  @override
  didChangeDependencies() {
    super.didChangeDependencies();

    final double fraction = 1 / (MediaQuery.of(context).size.width / 520);
    controller = PageController(
      viewportFraction:
          Breakpoints.mediumAndUp.isActive(context) ? fraction : 1,
      initialPage: widget.chapter.id - 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   if (AppConstants.breakpoint.isActive(context)) {
    //     Navigator.of(context).popUntil((route) => route.isFirst);
    //   }
    // // Scrolling to the chapter's first page
    // controller.jumpToPage(widget.chapter.pages.first - 1);
    // });

    return Scaffold(
      appBar: AppBar(
        notificationPredicate: (notification) => true,
        title: Text(widget.chapter.nameSimple),
        leading: IconButton.filled(
          isSelected: true,
          onPressed: () {
            widget.onBack?.call();
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
      ),
      body: PageView.builder(
        key: PageStorageKey(widget.chapter.id),
        controller: controller,
        itemCount: 604,
        itemBuilder: (context, indx) => QuranPage(pageNo: indx + 1),
      ),
    );
  }
}
