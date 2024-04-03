import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:quran/classes/verse.dart';
import 'package:quran/providers/font_provider.dart';
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
  late final Future<List<Verse>> versesByPageFuture =
      VersesProvider.getVersesByPage(widget.pageNo);
  late final Future<NetworkFont> networkFontFuture = FontProvider.networkFont(
    'QCF V2 P${widget.pageNo}',
    url:
        'https://raw.githubusercontent.com/mustafa0x/qpc-fonts/master/mushaf-v2/QCF2${widget.pageNo.toString().padLeft(3, '0')}.ttf',
  );
  late Future futureList = Future.wait([versesByPageFuture, networkFontFuture]);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder(
      future: futureList,
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
                futureList = Future.wait([versesByPageFuture]);
              });
            },
          );
        }

        final verses = snapshot.data!.first as List<Verse>;
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

        final txtSpans = List.generate(
          linesInQuran,
          (index) {
            final line = pageLinesWords[index];
            final newLine = index == pageLinesWords.length - 1 ? '' : ' ';
            final text =
                '${line.map((word) => word.textUthmani).join(' ')}$newLine'
                    .replaceAll('\u06DF', '\u0652')
                    .replaceAll('\u06ED', '');

            return TextSpan(
              text: text,
              style: TextStyle(
                fontFamily: 'Uthmanic-Hafs',
                fontSize: MediaQuery.of(context).size.height / 36,
                color: Colors.white,
                locale: const Locale('ar'),
                height: 1.8,
              ),
              recognizer: DoubleTapGestureRecognizer()
                ..onDoubleTap = () {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Quran Page ${widget.pageNo} - Line ${line.first.lineNumber}',
                        textAlign: TextAlign.center,
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
            );
          },
        );

        verses.map((verse) {
          if (verse.verseNumber == 1) {
            final lineNo = verse.words.first.lineNumber;

            if (widget.pageNo == 1) {
              txtSpans[lineNo - 2] = TextSpan(
                text: '${verse.chapterId.toString().padLeft(3, '0')}surah\n',
                style: TextStyle(
                  fontFamily: 'Surah-Names',
                  fontSize: MediaQuery.of(context).size.height / 24,
                  color: Colors.white,
                  locale: const Locale('ar'),
                  letterSpacing: 5,
                ),
              );
            } else {
              txtSpans[lineNo - 3] = TextSpan(
                text: '${verse.chapterId.toString().padLeft(3, '0')}surah\n',
                style: TextStyle(
                  fontFamily: 'Surah-Names',
                  fontSize: MediaQuery.of(context).size.height / 24,
                  color: Colors.white,
                  locale: const Locale('ar'),
                  letterSpacing: 5,
                ),
              );

              txtSpans[lineNo - 2] = TextSpan(
                text: '321\n',
                style: TextStyle(
                  fontFamily: 'QCF-BSML',
                  fontSize: MediaQuery.of(context).size.height / 36,
                  color: Colors.white,
                  locale: const Locale('ar'),
                  letterSpacing: 5,
                  height: 1.8,
                ),
              );
            }
          }
        }).toList();

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableText.rich(
              TextSpan(children: txtSpans),
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
            ),
            Row(children: [
              const Expanded(
                  child: Divider(
                thickness: 0.1,
                height: 1,
              )),
              Text(
                '  Page ${widget.pageNo}  ',
                style: const TextStyle(
                  color: Colors.white24,
                  fontSize: 12,
                ),
              ),
              const Expanded(
                  child: Divider(
                thickness: 0.1,
                height: 1,
              )),
            ])
          ],
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
