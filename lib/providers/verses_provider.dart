import 'package:dio/dio.dart';
import 'package:quran/classes/verse.dart';
import 'package:quran/constants/api_constants.dart';
import 'package:quran/utils/cache_util.dart';

class VersesProvider {
  /// Get verses by page number.
  static Future<List<Verse>> getVersesByPage(int pageNo) async {
    final errMsg = 'Failed to get verses for page $pageNo.';
    final cacheKey = 'verses-page-$pageNo';
    final requestCache = CacheUtil.getRequestCache(cacheKey);
    final requestUrl = '/verses/by_page/$pageNo';
    final List<Verse> verses;
    Map<String, dynamic> queryParameters = {
      'words': true,
      'word_fields': 'text_uthmani',
      'fields': 'text_uthmani',
    };

    try {
      if (requestCache == null) {
        final response = await dio.get(
          requestUrl,
          queryParameters: queryParameters,
        );

        if (response.statusCode != 200 || response.data == null) {
          return Future.error(response.statusMessage ?? errMsg);
        }

        /// Cache the current request for future use.
        CacheUtil.cacheRequest(cacheKey, response.data);

        verses = GetVersesResponse.fromJson(response.data).verses;
      } else {
        verses = GetVersesResponse.fromRawJson(requestCache).verses;
      }

      return verses;
    } catch (err) {
      if (err is DioException) {
        return Future.error(err.message ?? errMsg);
      }

      return Future.error(err.toString());
    }
  }
}
