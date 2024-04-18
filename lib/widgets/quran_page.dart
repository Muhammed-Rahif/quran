import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:quran/classes/verse.dart';
import 'package:quran/providers/verses_provider.dart';
import 'package:quran/widgets/custom_progress_indicator.dart';
import 'package:quran/widgets/display_error.dart';

class QuranPage extends StatefulWidget {
  const QuranPage({
    super.key,
    required this.pageNo,
  });

  final int pageNo;

  @override
  State<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage>
    with AutomaticKeepAliveClientMixin {
  late Future<List<Verse>> versesByPageFuture =
      VersesProvider.getVersesByPage(widget.pageNo);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: Colors.red,
      width: 200,
      child: FutureBuilder(
        future: versesByPageFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return CustomProgressIndicator(
              text: 'Loading page ${widget.pageNo}...',
            );
          }

          if (snapshot.hasError) {
            return DisplayError(
              error: snapshot.error.toString(),
              onRetry: () {
                setState(() {
                  versesByPageFuture =
                      VersesProvider.getVersesByPage(widget.pageNo);
                });
              },
            );
          }

          final verses = snapshot.data!;
          // final networkFont = snapshot.data!.last as NetworkFont;

          const linesInQuran = 15;
          final allWordsInPage = verses.expand((verse) => verse.words).toList();
          final List<List<Word>> pageLinesWords = List.generate(
            linesInQuran,
            (index) {
              final lineWords = allWordsInPage
                  .where((word) => word.lineNumber == index + 1)
                  .toList();

              return lineWords;
            },
          );

          final List<Widget> lineWords = List.generate(
            linesInQuran,
            (index) {
              final lineWords = pageLinesWords[index];
              final newLine = index == pageLinesWords.length - 1 ? '' : '\n';

              return Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...lineWords.map((word) => word.textUthmani).map(
                          (txt) => Text(
                            txt!
                                .replaceAll('\u06DF', '\u0652')
                                .replaceAll('\u06ED', ''),
                            style: const TextStyle(
                              fontFamily: 'Uthmanic-Script',
                              fontSize: 18,
                              color: Colors.white,
                              locale: Locale('ar'),
                            ),
                          ),
                        ),
                    Text(newLine)
                  ]);
            },
          );

          verses.map((verse) {
            if (verse.verseNumber == 1) {
              final lineNo = verse.words.first.lineNumber;

              if (widget.pageNo == 1) {
                lineWords[lineNo - 2] = Text(
                  '${verse.chapterId.toString().padLeft(3, '0')}surah\n',
                  style: const TextStyle(
                    fontFamily: 'Surah-Names',
                    fontSize: 26,
                    color: Colors.white,
                    locale: Locale('ar'),
                  ),
                );
              } else {
                lineWords[lineNo - 3] = Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    '${verse.chapterId.toString().padLeft(3, '0')}surah',
                    style: const TextStyle(
                      fontFamily: 'Surah-Names',
                      fontSize: 26,
                      color: Colors.white,
                      locale: Locale('ar'),
                    ),
                  ),
                );

                lineWords[lineNo - 2] = const Text(
                  'بِسْمِ ٱللَّهِ ٱلرَّحْمَـٰنِ ٱلرَّحِيمِ\n',
                  style: TextStyle(
                    fontFamily: 'Uthmanic-Script',
                    fontSize: 18,
                    color: Colors.white,
                    locale: Locale('ar'),
                    height: 1.8,
                  ),
                );
              }
            }
          }).toList();

          return Column(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.start,
            children: lineWords,
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
