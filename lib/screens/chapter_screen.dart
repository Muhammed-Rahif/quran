import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:quran/classes/chapter.dart';

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
        // shape: const RoundedRectangleBorder(
        //     borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              enableInfiniteScroll: false,
              initialPage: chapter.id - 1,
              enlargeCenterPage: false,
              height: MediaQuery.of(context).size.height - 108,
              viewportFraction: 1,
            ),
            items: List.generate(604, (indx) => indx).map(
              (indx) {
                return const SizedBox(
                  width: double.infinity,
                  child: ColorFiltered(
                    // invert the color of the image
                    colorFilter: ColorFilter.matrix(<double>[
                      -1.0, 0.0, 0.0, 0.0, 255.0, //
                      0.0, -1.0, 0.0, 0.0, 255.0, //
                      0.0, 0.0, -1.0, 0.0, 255.0, //
                      0.0, 0.0, 0.0, 1.0, 0.0, //
                    ]),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(10),
                      child: SelectableText(
                        // 'وَ﻿بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ ١ فَٱلْمُورِيَـٰتِ قَدْحًۭا ٢ فَٱلْمُغِيرَٰتِ صُبْحًۭا ٣ فَأَثَرْنَ بِهِۦ نَقْعًۭا ٤ فَوَسَطْنَ بِهِۦ جَمْعًا ٥ إِنَّ ٱلْإِنسَـٰنَ لِرَبِّهِۦ لَكَنُودٌۭ ٦ وَإِنَّهُۥ عَلَىٰ ذَٰلِكَ لَشَهِيدٌۭ ٧ وَإِنَّهُۥ لِحُبِّ ٱلْخَيْرِ لَشَدِيدٌ ٨ ۞ أَفَلَا يَعْلَمُ إِذَا بُعْثِرَ مَا فِى ٱلْقُبُورِ ٩ وَحُصِّلَ مَا فِى ٱلصُّدُورِ ١٠ إِنَّ رَبَّهُم بِهِمْ يَوْمَئِذٍۢ لَّخَبِيرٌۢ ١١',
                        '   ﻿بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ ١ ٱلْحَمْدُ لِلَّهِ رَبِّ ٱلْعَٰلَمِينَ ٢ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ ٣ مَٰلِكِ يَوْمِ ٱلدِّينِ   إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ   ٱهْدِنَا ٱلصِّرَٰطَ ٱلْمُسْتَقِيمَ   صِرَٰطَ ٱلَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ ٱلْمَغْضُوبِ عَلَيْهِمْ وَلَا ٱلضَّآلِّينَ',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontFamily: 'Uthmanic Script',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}
