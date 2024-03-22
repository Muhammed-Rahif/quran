import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:quran/classes/chapter.dart';
import 'package:quran/constants/api_constants.dart';

class ChapterProvider {
  static Future<List<Chapter>> getAllChapters() async {
    const errMsg = 'Failed to get chapters. Please try again later.';

    try {
      /// Web doesn't support file system operations
      /// therefore cache doesn't work on web
      if (kIsWeb) {
        final response = await dio.get('/chapters');

        if (response.statusCode != 200 || response.data == null) {
          return Future.error(response.statusMessage ?? errMsg);
        }

        final chapters =
            GetAllChaptersResponse.fromJson(response.data).chapters;

        return chapters;
      }

      /// All platforms except web support the cache
      final cacheFile = File('${ApiConstants.cacheDir.path}/chapters.json');
      if (cacheFile.existsSync()) {
        final chapters = GetAllChaptersResponse.fromJson(
          jsonDecode(cacheFile.readAsStringSync()),
        ).chapters;

        return chapters;
      } else {
        final response = await dio.get('/chapters');

        if (response.statusCode != 200 || response.data == null) {
          return Future.error(response.statusMessage ?? errMsg);
        }

        final chapters =
            GetAllChaptersResponse.fromJson(response.data).chapters;

        cacheFile.writeAsStringSync(jsonEncode(response.data));

        return chapters;
      }
    } catch (err) {
      if (err is DioException) {
        return Future.error(err.message ?? errMsg);
      }

      return Future.error(err.toString());
    }
  }
}
