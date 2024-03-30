import 'package:flutter/material.dart';
import 'package:quran/classes/verse.dart';
import 'package:quran/providers/verses_provider.dart';
import 'package:network_font/network_font.dart';
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
  late final NetworkFont pageFont = NetworkFont('QCF V1 P${widget.pageNo}',
      url:
          'https://github.com/quran/quran.com-images/raw/master/res/fonts/QCF_P${widget.pageNo.toString().padLeft(3, '0')}.TTF');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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

        final allWords = verses.expand((verse) => verse.words).toList();
        final pageText = List.generate(
          15,
          (index) {
            final lineWords =
                allWords.where((word) => word.lineNumber == index + 1).toList();
            final lineStr =
                '${lineWords.map((word) => word.codeV1).join('')}${index == 14 ? '' : '\n'}';

            return lineStr;
          },
        ).join();

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: 400,
                child: Text(
                  pageText,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: pageFont.style(
                    fontWeight: FontWeight.w500,
                    locale: const Locale('ar'),
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
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
          ),
        );
      },
    );
  }
}
