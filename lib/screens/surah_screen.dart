import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:quran/classes/surah.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SurahScreen extends StatelessWidget {
  const SurahScreen({
    super.key,
    required this.surah,
    this.onBack,
  });

  final Surah surah;
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
        title: Text(surah.name),
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
              initialPage: surah.id - 1,
              enlargeCenterPage: false,
              height: MediaQuery.of(context).size.height - 108,
              viewportFraction: 1,
            ),
            items: List.generate(604, (indx) => indx).map(
              (indx) {
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
                      child: Image.network(
                        'https://github.com/Muhammed-Rahif/Quran-App-Data/blob/main/quran_images/${indx + 1}.png?raw=true',
                        fit: BoxFit.fitWidth,
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
