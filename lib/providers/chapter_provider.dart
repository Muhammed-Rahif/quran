import 'package:dio/dio.dart';
import 'package:quran/classes/chapter.dart';
import 'package:quran/constants/api_constants.dart';
import 'package:quran/utils/cache_util.dart';

class ChapterProvider {
  static Future<List<Chapter>> getAllChapters() async {
    const errMsg = 'Failed to get chapters. Please try again later.';
    final requestCache = CacheUtil.getRequestCache(getAllChapters);

    try {
      final List<Chapter> chapters;
      if (requestCache == null) {
        final response = await dio.get('/chapters');

        if (response.statusCode != 200 || response.data == null) {
          return Future.error(response.statusMessage ?? errMsg);
        }

        chapters = GetAllChaptersResponse.fromJson(response.data).chapters;

        /// Cache the current request for future use.
        CacheUtil.cacheRequest(getAllChapters, response.data);
      } else {
        chapters = GetAllChaptersResponse.fromRawJson(requestCache).chapters;
      }
      return chapters;
    } catch (err) {
      if (err is DioException) {
        return Future.error(err.message ?? errMsg);
      }

      return Future.error(err.toString());
    }
  }
}
