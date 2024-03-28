import 'package:dio/dio.dart';
import 'package:quran/classes/quran.dart';
import 'package:quran/constants/api_constants.dart';
import 'package:quran/utils/cache_util.dart';

class QuranProvider {
  /// Get uathmani script quran for a specific page number.
  static Future<List<Verse>> getUthmaniScriptQuranByPage(int pageNo) async {
    final errMsg = 'Failed to get uthmani script quran for page $pageNo.';
    final cacheKey = 'uthmani-script-quran-page-$pageNo';
    final cache = await CacheUtil.getCache(cacheKey);
    const requestUrl = '/quran/verses/uthmani';
    Map<String, dynamic> queryParameters = {'page_number': pageNo};
    final List<Verse> verses;

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

        verses = GetUthmaniScriptQuranResponse.fromJson(response.data).verses;
      } else {
        verses = GetUthmaniScriptQuranResponse.fromRawJson(cache).verses;
      }

      return verses;
    } catch (err) {
      if (err is DioException) {
        return Future.error(err.message ?? errMsg);
      }

      return Future.error(err.toString());
    }
  }

  /// Get uathmani script quran full.
  static Future<List<Verse>> getUthmaniScriptQuranFull() async {
    const errMsg = 'Failed to get uthmani script quran.';
    const cacheKey = 'uthmani-script-quran-full';
    final cache = await CacheUtil.getCache(cacheKey);
    const requestUrl = '/quran/verses/uthmani';
    final List<Verse> verses;

    try {
      if (cache == null) {
        final response = await dio.get(requestUrl);

        if (response.statusCode != 200 || response.data == null) {
          return Future.error(response.statusMessage ?? errMsg);
        }

        /// Cache the current request for future use.
        CacheUtil.setCache(cacheKey, response.data);

        verses =
            GetUthmanicScriptQuranFullResponse.fromJson(response.data).verses;
      } else {
        verses = GetUthmanicScriptQuranFullResponse.fromRawJson(cache).verses;
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
