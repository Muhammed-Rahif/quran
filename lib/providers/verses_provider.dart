import 'package:dio/dio.dart';
import 'package:quran/classes/verse.dart';
import 'package:quran/constants/api_constants.dart';

class VersesProvider {
  /// Get verses by page number.
  static Future<List<Verse>> getVersesByPage(int pageNo) async {
    final errMsg = 'Failed to get verses for page $pageNo.';
    final requestUrl = '/verses/by_page/$pageNo';
    final List<Verse> verses;
    Map<String, dynamic> queryParameters = {
      'words': true,
      'word_fields': 'code_v1,code_v2,text_uthmani',
      'fields': 'code_v1,code_v2,text_uthmani',
    };

    try {
      final dio = await ApiConstants.dioInstance;
      final response = await dio.get(
        requestUrl,
        queryParameters: queryParameters,
      );

      if (response.data == null) {
        return Future.error(response);
      }

      verses = GetVersesByPageResponse.fromJson(response.data).verses;

      return verses;
    } catch (err) {
      if (err is DioException) {
        return Future.error(err.message ?? errMsg);
      }

      return Future.error(err.toString());
    }
  }
}
