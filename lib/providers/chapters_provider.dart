import 'package:dio/dio.dart';
import 'package:quran/classes/chapter.dart';
import 'package:quran/constants/api_constants.dart';

class ChaptersProvider {
  /// Get all chapters as list.
  static Future<List<Chapter>> getAllChapters() async {
    const errMsg = 'Failed to get chapters.';
    const requestUrl = '/chapters';
    final List<Chapter> chapters;

    try {
      final dio = await ApiConstants.dioInstance;
      final response = await dio.get(requestUrl);

      if (response.data == null) {
        return Future.error(response.statusMessage ?? errMsg);
      }

      chapters = GetAllChaptersResponse.fromJson(response.data).chapters;
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
    final requestUrl = '/chapters/$chapterId';
    final Chapter chapter;

    try {
      final dio = await ApiConstants.dioInstance;
      final response = await dio.get(requestUrl);

      if (response.data == null) {
        return Future.error(response.statusMessage ?? errMsg);
      }

      chapter = GetChapterResponse.fromJson(response.data).chapter;
      return chapter;
    } catch (err) {
      if (err is DioException) {
        return Future.error(err.message ?? errMsg);
      }

      return Future.error(err.toString());
    }
  }
}
