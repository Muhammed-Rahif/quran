import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
  CarouselController carouselController = CarouselController();

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
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
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

          return Column(
            children: [
              CarouselSlider(
                carouselController: carouselController,
                options: CarouselOptions(
                  reverse: true,
                  enableInfiniteScroll: false,
                  initialPage: chapter.pages.first - 1,
                  enlargeCenterPage: false,
                  height: MediaQuery.of(context).size.height - 108,
                  viewportFraction: 1,
                ),
                items: List.generate(604, (indx) => indx).map(
                  (indx) {
                    /// Builder is used to prevent the page from being built
                    /// until it is needed.
                    return Builder(builder: (context) {
                      return QuranPage(pageNo: indx + 1);
                    });
                  },
                ).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton.filled(
                    onPressed: () => carouselController.nextPage(
                      curve: Curves.fastOutSlowIn,
                    ),
                    icon: const Icon(Icons.chevron_left_rounded),
                  ),
                  const SizedBox(width: 8),
                  IconButton.filled(
                    onPressed: () => carouselController.previousPage(
                      curve: Curves.fastOutSlowIn,
                    ),
                    icon: const Icon(Icons.chevron_right_rounded),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
