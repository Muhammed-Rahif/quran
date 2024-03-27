import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:quran/classes/chapter.dart';
import 'package:quran/providers/chapters_provider.dart';
import 'package:quran/widgets/display_error.dart';
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
  late Future chaptersByIdFuture =
      ChaptersProvider.getChaptersById(widget.chapter.id);
  late PageController pageController = PageController(
      viewportFraction: Breakpoints.mediumAndUp.isActive(context) ? .5 : 1);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (Breakpoints.mediumAndUp.isActive(context)) {
        Navigator.of(context).popUntil((route) => route.isFirst);
      }
    });

    return Scaffold(
      appBar: AppBar(
        notificationPredicate: (notification) => true,
        title: Text(widget.chapter.nameSimple),
        leading: IconButton.filled(
          isSelected: true,
          onPressed: widget.onBack ??
              () => Navigator.of(context).popUntil((route) => route.isFirst),
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
        shape: Breakpoints.mediumAndUp.isActive(context)
            ? const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              )
            : null,
      ),
      body: FutureBuilder(
        future: chaptersByIdFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return DisplayError(
              error: snapshot.error.toString(),
              onRetry: () {
                setState(() {
                  chaptersByIdFuture =
                      ChaptersProvider.getChaptersById(widget.chapter.id);
                });
              },
            );
          }

          final chapter = snapshot.data!;
          // pageController.jumpToPage(chapter.pages.first - 1);

          return GestureDetector(
            onTap: () {
              pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.fastOutSlowIn,
              );
            },
            child: PageView.builder(
              reverse: true,
              controller: pageController,
              itemCount: 604,
              itemBuilder: (context, indx) => QuranPage(pageNo: indx + 1),
            ),
          );
        },
      ),
    );
  }
}
