import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:quran/classes/surah.dart';

class SurahScreen extends StatelessWidget {
  const SurahScreen({
    super.key,
    required this.surah,
  });

  final Surah surah;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (Breakpoints.mediumAndUp.isActive(context)) {
        Navigator.of(context).popUntil((route) => route.isFirst);
      }
    });

    return Scaffold(
      body: Center(
        child: ColorFiltered(
          // invert the color of the image
          colorFilter: const ColorFilter.matrix(<double>[
            -1.0, 0.0, 0.0, 0.0, 255.0, //
            0.0, -1.0, 0.0, 0.0, 255.0, //
            0.0, 0.0, -1.0, 0.0, 255.0, //
            0.0, 0.0, 0.0, 1.0, 0.0, //
          ]),
          child: Image.network(
            'https://github.com/Muhammed-Rahif/Quran-App-Data/blob/main/quran_images/${surah.id}.png?raw=true',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
