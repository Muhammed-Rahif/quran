import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:quran/classes/verse.dart';
import 'package:quran/providers/verses_provider.dart';
import 'package:quran/utils/number_util.dart';
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

        final pageText = verses.map((verse) {
          String str = '';

          if (verse.verseNumber == 1 && verse.pageNumber != 1) {
            str +=
                '\n                 ▐░░░░░░░░░░░░░▌ بِسْمِ ٱللَّٰهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ ▐░░░░░░░░░░░░░▌\n';
          }

          str += verse.textUthmani +
              NumberUtil.getArabicNumber(verse.verseNumber, isAyahEnd: true);

          return str;
        }).join('');

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 10),
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

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AutoSizeText(
                pageText,
                maxLines: 15,
                textAlign: TextAlign.justify,
                textDirection: TextDirection.rtl,
                maxFontSize: 26,
                minFontSize: 22,
                locale: const Locale('ar'),
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Kitab Regular',
                  locale: Locale('ar'),
                  height: 1.7,
                  color: Colors.white,
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
