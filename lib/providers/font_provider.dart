import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:quran/constants/api_constants.dart';

class NetworkFont {
  NetworkFont({required this.fontName});

  final String fontName;
}

class FontProvider {
  static Future<NetworkFont> networkFont(
    String fontName, {
    required String url,
  }) async {
    final loadedFontBites = loadFont(url);
    final fontLoader = FontLoader(fontName);

    fontLoader.addFont(loadedFontBites);
    await fontLoader.load();

    return NetworkFont(fontName: fontName);
  }

  static Future<ByteData> loadFont(String url) async {
    final dio = await ApiConstants.dioInstance;
    final response = await dio.get<List<int>>(
      url,
      options: Options(responseType: ResponseType.bytes),
    );

    return ByteData.view(Uint8List.fromList(response.data!).buffer);
  }
}
