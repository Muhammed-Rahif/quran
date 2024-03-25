import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:quran/classes/verse.dart';
import 'package:quran/providers/verses_provider.dart';
import 'package:quran/utils/number_util.dart';
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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: versesByPageFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
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
        // final allWords = verses.expand((verse) => verse.words).toList();
        final pageText = verses
            .map((verse) =>
                verse.textUthmani +
                NumberUtil.getArabicNumber(verse.verseNumber, isAyahEnd: true))
            .join('');

        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 180),
            width: double.infinity,
            child: Builder(
              builder: (context) {
                // final pageText = List.generate(
                //   15,
                //   (index) {
                //     final lineWords = allWords
                //         .where((word) => word.lineNumber == index + 1)
                //         .toList();
                //     final lineStr =
                //         '${lineWords.map((word) => word.textUthmani).join(' ')}\n';

                //     return lineStr;
                //   },
                // ).join();

                // return SelectableText(
                // pageText,
                // textAlign: TextAlign.justify,
                // textDirection: TextDirection.rtl,
                // style: const TextStyle(
                //   fontSize: 30,
                //   fontWeight: FontWeight.w500,
                //   fontFamily: 'Kitab Regular',
                //   locale: Locale('ar'),
                //   height: 1.5,
                // ),
                // );

                return AutoSizeText(
                  pageText,
                  maxLines: 15,
                  textAlign: TextAlign.justify,
                  textDirection: TextDirection.rtl,
                  maxFontSize: 26,
                  minFontSize: 24,
                  locale: const Locale('ar'),
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Kitab Regular',
                    locale: Locale('ar'),
                    height: 1.7,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
