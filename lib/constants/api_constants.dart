import 'dart:io';

import 'package:dio/dio.dart';

class ApiConstants {
  static const String baseUrl = 'https://api.quran.com/api/v4';

  static Dio get dioInstance {
    final dio = Dio(BaseOptions(baseUrl: baseUrl));

    return dio;
  }

  static Directory get cacheDir {
    final String cacheDirPath = '${Directory.systemTemp.path}/quran-app-cache';
    final Directory cacheDir = Directory(cacheDirPath);

    if (!cacheDir.existsSync()) {
      cacheDir.createSync();
    }

    return cacheDir;
  }
}

Dio dio = ApiConstants.dioInstance;
