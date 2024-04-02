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

class _QuranPageState extends State<QuranPage> {
  late Future<List<Verse>> versesByPageFuture =
      VersesProvider.getVersesByPage(widget.pageNo);
  late Future<NetworkFont> networkFontFuture = FontProvider.networkFont(
    'QCF V2 P${widget.pageNo}',
    url:
        'https://raw.githubusercontent.com/mustafa0x/qpc-fonts/master/mushaf-v2/QCF2${widget.pageNo.toString().padLeft(3, '0')}.ttf',
  );

  @override
  void initState() {
    super.initState();
    loadPageFont();
  }

  loadPageFont() async {}

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([versesByPageFuture, networkFontFuture]),
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

        final verses = snapshot.data!.first as List<Verse>;
        final networkFont = snapshot.data!.last as NetworkFont;

        final allWordsInPage = verses.expand((verse) => verse.words).toList();
        final List<List<Word>> pageLinesWords = List.generate(
          15,
          (index) {
            final lineWords = allWordsInPage
                .where((word) => word.lineNumber == index + 1)
                .toList();

            return lineWords;
          },
        ).where((element) => element.isNotEmpty).toList();

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LayoutBuilder(builder: (context, constraints) {
                return RichText(
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  text: TextSpan(
                      children: List.generate(
                    pageLinesWords.length,
                    (index) {
                      final line = pageLinesWords[index];
                      var newLine =
                          index == pageLinesWords.length - 1 ? '' : '\n';
                      final text =
                          '${line.map((word) => word.text).join('')}$newLine';

                      return TextSpan(
                        text: text,
                        style: TextStyle(
                          fontFamily: networkFont.fontName,
                          color: Colors.white,
                          fontSize: constraints.minWidth / 18,
                          locale: const Locale('ar'),
                          letterSpacing: 3,
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
                  )),
                );
              }),
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
          ),
        );
      },
    );
  }
}
