import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/classes/chapter.dart';
import 'package:quran/notifiers/chapter_notifier.dart';
import 'package:quran/widgets/quran_page.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ChapterScreen extends StatefulWidget {
  const ChapterScreen({super.key});

  @override
  State<ChapterScreen> createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  final ItemScrollController itemScrollController = ItemScrollController();
  Chapter? get chapter {
    if (!mounted) return null;
    return context.read<ChapterNotifier>().chapter!;
  }

  @override
  void initState() {
    super.initState();

    context.read<ChapterNotifier>().addListener(() {
      if (!mounted) return;
      final index = chapter?.pages.first ?? 1 - 1;
      itemScrollController.jumpTo(index: index);
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
      body: Container(
        width: 380,
        child: ScrollablePositionedList.builder(
          itemScrollController: itemScrollController,
          padding: const EdgeInsets.all(10),
          scrollDirection: Axis.horizontal,
          initialScrollIndex: chapter!.pages.first - 1,
          itemCount: 604,
          itemBuilder: (context, indx) => QuranPage(pageNo: indx + 1),
          // separatorBuilder: (context, indx) => Row(children: [
          //   const Expanded(
          //       child: Divider(
          //     thickness: 0.1,
          //     height: 1,
          //   )),
          //   Text(
          //     '  Page ${indx + 1}  ',
          //     style: const TextStyle(
          //       color: Colors.white24,
          //       fontSize: 10,
          //     ),
          //   ),
          //   const Expanded(
          //       child: Divider(
          //     thickness: 0.1,
          //     height: 1,
          //   )),
          // ]),
        ),
      ),
    );
  }
}
