import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:quran/utils/api_utils.dart';

class NetworkFont {
  NetworkFont({required this.fontName});

  final String fontName;
}

class FontProvider {
  static Future<NetworkFont> networkFont(
    String fontFamily, {
    required String url,
  }) async {
    final loadedFont = await loadFont(url);
    await loadFontFromList(loadedFont, fontFamily: fontFamily);

    return NetworkFont(fontName: fontFamily);
  }

  static Future<Uint8List> loadFont(String url) async {
    final response = await dio.get<List<int>>(
      url,
      options: Options(responseType: ResponseType.bytes),
    );

    return Uint8List.fromList(response.data!);
  }
}
