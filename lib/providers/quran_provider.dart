import 'package:dio/dio.dart';
import 'package:quran/classes/quran.dart';
import 'package:quran/utils/api_utils.dart';

class QuranProvider {
  /// Get uathmani script quran for a specific page number.
  static Future<List<Verse>> getUthmaniScriptQuranByPage(int pageNo) async {
    final errMsg = 'Failed to get uthmani script quran for page $pageNo.';
    const requestUrl = '/quran/verses/uthmani';
    Map<String, dynamic> queryParameters = {'page_number': pageNo};
    final List<Verse> verses;

    try {
      final response = await dio.get(
        requestUrl,
        queryParameters: queryParameters,
      );

      if (response.data == null) {
        return Future.error(response.statusMessage ?? errMsg);
      }

      verses = GetUthmaniScriptQuranResponse.fromJson(response.data).verses;

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
    const requestUrl = '/quran/verses/uthmani';
    final List<Verse> verses;

    try {
      final response = await dio.get(requestUrl);

      if (response.data == null) {
        return Future.error(response.statusMessage ?? errMsg);
      }

      verses =
          GetUthmanicScriptQuranFullResponse.fromJson(response.data).verses;

      return verses;
    } catch (err) {
      if (err is DioException) {
        return Future.error(err.message ?? errMsg);
      }

      return Future.error(err.toString());
    }
  }
}
