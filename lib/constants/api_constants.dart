import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quran/constants/app_contants.dart';

class ApiConstants {
  static const String baseUrl = 'https://api.quran.com/api/v4';

  static Future<Dio> get dioInstance async {
    final Directory? appCacheDir;
    final String? appCachePath;

    if (!kIsWeb) {
      appCacheDir = await getApplicationDocumentsDirectory();
      appCachePath = '${appCacheDir.path}/${AppConstants.cacheFolderName}';
    } else {
      appCachePath = null;
    }

    final CacheStore store;
    if (appCachePath != null) {
      store = HiveCacheStore(appCachePath);
    } else {
      store = MemCacheStore(
        maxSize: 1024 * 1024 * 300, // 300MB
      );
    }
    final options = CacheOptions(store: store);

    final dio = Dio(BaseOptions(baseUrl: baseUrl))
      ..interceptors.add(DioCacheInterceptor(options: options));

    return dio;
  }
}
