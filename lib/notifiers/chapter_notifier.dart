import 'package:flutter/foundation.dart';
import 'package:quran/classes/chapter.dart';

class ChapterNotifier with ChangeNotifier {
  Chapter? _chapter;

  Chapter? get chapter => _chapter;

  void setChapter(Chapter chapter) {
    _chapter = chapter;
    notifyListeners();
  }
}
