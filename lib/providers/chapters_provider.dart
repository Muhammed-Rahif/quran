import 'package:dio/dio.dart';
import 'package:quran/classes/chapter.dart';
import 'package:quran/constants/api_constants.dart';
import 'package:quran/utils/cache_util.dart';

class ChaptersProvider {
  /// Get all chapters as list.
  static Future<List<Chapter>> getAllChapters() async {
    const errMsg = 'Failed to get chapters.';
    const cacheKey = 'all-chapters';
    final requestCache = CacheUtil.getRequestCache(cacheKey);
    const requestUrl = '/chapters';
    final List<Chapter> chapters;

    try {
      if (requestCache == null) {
        final response = await dio.get(requestUrl);

        if (response.statusCode != 200 || response.data == null) {
          return Future.error(response.statusMessage ?? errMsg);
        }

        /// Cache the current request for future use.
        CacheUtil.cacheRequest(cacheKey, response.data);

        chapters = GetAllChaptersResponse.fromJson(response.data).chapters;
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

  /// Get a chapter by its id.
  static Future<Chapter> getChaptersById(int chapterId) async {
    final errMsg = 'Failed to get chapter $chapterId.';
    final cacheKey = 'chapter-$chapterId';
    final requestCache = CacheUtil.getRequestCache(cacheKey);
    final requestUrl = '/chapters/$chapterId';
    final Chapter chapter;

    try {
      if (requestCache == null) {
        final response = await dio.get(requestUrl);

        if (response.statusCode != 200 || response.data == null) {
          return Future.error(response.statusMessage ?? errMsg);
        }

        /// Cache the current request for future use.
        CacheUtil.cacheRequest(cacheKey, response.data);

        chapter = GetChapterResponse.fromJson(response.data).chapter;
      } else {
        chapter = GetChapterResponse.fromRawJson(requestCache).chapter;
      }

      return chapter;
    } catch (err) {
      if (err is DioException) {
        return Future.error(err.message ?? errMsg);
      }

      return Future.error(err.toString());
    }
  }
}
