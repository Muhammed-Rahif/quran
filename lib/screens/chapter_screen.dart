import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:quran/classes/chapter.dart';
import 'package:quran/providers/chapters_provider.dart';
import 'package:quran/providers/quran_provider.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (Breakpoints.mediumAndUp.isActive(context)) {
        Navigator.of(context).popUntil((route) => route.isFirst);
      }
    });

    return Scaffold(
      appBar: AppBar(
        notificationPredicate: (notification) => true,
        title: Text(chapter.nameSimple),
        leading: IconButton.filled(
          isSelected: true,
          onPressed: onBack ??
              () => Navigator.of(context).popUntil((route) => route.isFirst),
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      body: FutureBuilder(
        future: ChaptersProvider.getChaptersById(chapter.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          final chapter = snapshot.data!;

          return Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  initialPage: chapter.pages.first - 1,
                  enlargeCenterPage: false,
                  height: MediaQuery.of(context).size.height - 108,
                  viewportFraction: 1,
                ),
                items: List.generate(604, (indx) => indx).map(
                  (indx) {
                    return FutureBuilder(
                      future:
                          QuranProvider.getUthmaniScriptQuranByPage(indx + 1),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState != ConnectionState.done) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              snapshot.error.toString(),
                              style: const TextStyle(color: Colors.red),
                            ),
                          );
                        }

                        final verses = snapshot.data!;

                        return SizedBox(
                          width: double.infinity,
                          child: ColorFiltered(
                            // invert the color of the image
                            colorFilter: const ColorFilter.matrix(<double>[
                              -1.0, 0.0, 0.0, 0.0, 255.0, //
                              0.0, -1.0, 0.0, 0.0, 255.0, //
                              0.0, 0.0, -1.0, 0.0, 255.0, //
                              0.0, 0.0, 0.0, 1.0, 0.0, //
                            ]),
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                verses
                                    .map((verse) => verse.textUthmani)
                                    .join('\n'),
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontFamily: 'Uthmanic Script',
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ).toList(),
              ),
            ],
          );
        },
      ),
    );
  }
}
