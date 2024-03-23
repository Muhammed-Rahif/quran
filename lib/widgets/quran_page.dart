import 'package:flutter/material.dart';
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
        final allWords = verses.expand((verse) => verse.words).toList();

        return Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(18),
              //   child: Text(
              //     verses
              //         .map((verse) {
              //           return verse.textUthmani +
              //               NumberUtil.getArabicNumber(verse.id);
              //         })
              //         .join(' ')
              //         .replaceAll('\u06DF', '\u0652'),
              //     style: const TextStyle(
              //       fontSize: 30,
              //       fontWeight: FontWeight.w500,
              //       fontFamily: 'Uthmanic Script',
              //       locale: Locale('ar'),
              //     ),
              //     textAlign: TextAlign.justify,
              //   ),
              child: Text.rich(
                TextSpan(
                  children: List.generate(
                    15,
                    (index) {
                      final lineWords = allWords
                          .where((word) => word.lineNumber == index)
                          .toList();
                      final lineStr =
                          '${lineWords.map((word) => word.textUthmani).join(' ')}\n';

                      return TextSpan(
                        text: lineStr,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Uthmanic Script',
                          locale: Locale('ar'),
                        ),
                      );
                    },
                  ),
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        );
      },
    );
  }
}
