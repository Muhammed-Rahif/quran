import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

class FontUtil {
  static uthmanicQuranPageFont(
    int pageNo, [
    String fontNamePrefix = 'QCF V2 P',
  ]) async {
    final custom = FontLoader('$fontNamePrefix$pageNo');
    final loadedFont = loadFont(
      'https://github.com/mustafa0x/qpc-fonts/raw/master/mushaf-v2/QCF2${pageNo.toString().padLeft(3, '0')}.ttf',
    );

    custom.addFont(loadedFont);
    await custom.load();
  }

  static Future<ByteData> loadFont(String path) async {
    final response = await Dio().get<List<int>>(
      path,
      options: Options(
        responseType: ResponseType.bytes,
      ),
    );

    return ByteData.view(Uint8List.fromList(response.data!).buffer);
  }
}
