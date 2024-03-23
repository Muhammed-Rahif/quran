import 'package:dio/dio.dart';
import 'package:quran/classes/quran.dart';
import 'package:quran/constants/api_constants.dart';
import 'package:quran/utils/cache_util.dart';

class QuranProvider {
  /// Get uathmani script quran for a specific page number.
  static Future<List<Verse>> getUthmaniScriptQuranByPage(int pageNo) async {
    final errMsg = 'Failed to get uthmani script quran for page $pageNo.';
    final cacheKey = 'uthmani-script-quran-page-$pageNo';
    final requestCache = CacheUtil.getRequestCache(cacheKey);
    const requestUrl = '/quran/verses/uthmani';
    Map<String, dynamic> queryParameters = {'page_number': pageNo};
    final List<Verse> verses;

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

        verses = GetUthmaniScriptQuranResponse.fromJson(response.data).verses;
      } else {
        verses = GetUthmaniScriptQuranResponse.fromRawJson(requestCache).verses;
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
