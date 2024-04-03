import 'package:flutter/material.dart';
import 'package:quran/constants/app_contants.dart';

class AdaptiveLayoutNotifier extends ChangeNotifier {
  Widget? _body;

  Widget? get body => _body;

  navigateTo(BuildContext context, Widget? widget) {
    _body = widget;
    notifyListeners();

    if (!AppConstants.breakpoint.isActive(context) && widget != null) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => widget),
      );
    }
  }
}
