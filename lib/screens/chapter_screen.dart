import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/classes/chapter.dart';
import 'package:quran/notifiers/chapter_notifier.dart';
import 'package:quran/widgets/quran_page.dart';

class ChapterScreen extends StatefulWidget {
  const ChapterScreen({super.key});

  @override
  State<ChapterScreen> createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  final PageController controller = PageController(viewportFraction: 1);

  Chapter get chapter => context.read<ChapterNotifier>().chapter!;

  @override
  void initState() {
    super.initState();
    if (!mounted) return;

    context.read<ChapterNotifier>().addListener(() {
      controller.jumpToPage(chapter.pages.first - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   // if (AppConstants.breakpoint.isActive(context)) {
    //   //   Navigator.of(context).popUntil((route) => route.isFirst);
    //   // }
    //   // Scrolling to the chapter's first page
    // });

    return Scaffold(
      appBar: AppBar(
        notificationPredicate: (notification) => true,
        title: Text(chapter.nameSimple),
        leading: IconButton.filled(
          isSelected: true,
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        controller: controller,
        // itemCount: 604,
        // itemBuilder: (context, indx) => QuranPage(pageNo: indx + 1),
        children: List.generate(604, (indx) => QuranPage(pageNo: indx + 1)),
      ),
    );
  }
}
