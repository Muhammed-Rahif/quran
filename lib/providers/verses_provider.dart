import 'package:dio/dio.dart';
import 'package:quran/classes/verse.dart';
import 'package:quran/constants/api_constants.dart';
import 'package:quran/utils/cache_util.dart';

class VersesProvider {
  /// Get verses by page number.
  static Future<List<Verse>> getVersesByPage(int pageNo) async {
    final errMsg = 'Failed to get verses for page $pageNo.';
    final cacheKey = 'verses-page-$pageNo';
    final cache = await CacheUtil.getCache(cacheKey);
    final requestUrl = '/verses/by_page/$pageNo';
    final List<Verse> verses;
    Map<String, dynamic> queryParameters = {
      'words': true,
      'word_fields': 'code_v1,code_v2',
      'fields': 'code_v1,code_v2',
    };

    try {
      if (cache == null) {
        final response = await dio.get(
          requestUrl,
          queryParameters: queryParameters,
        );

        if (response.statusCode != 200 || response.data == null) {
          return Future.error(response.statusMessage ?? errMsg);
        }

        /// Cache the current request for future use.
        CacheUtil.setCache(cacheKey, response.data);

        verses = GetVersesByPageResponse.fromJson(response.data).verses;
      } else {
        verses = GetVersesByPageResponse.fromRawJson(cache).verses;
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
