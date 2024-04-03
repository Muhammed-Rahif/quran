import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:dio_cache_interceptor_isar_store/dio_cache_interceptor_isar_store.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quran/constants/app_contants.dart';

class ApiUtils {
  static late final CacheStore store;

  static init() async {
    final Directory appCacheDir = await getApplicationDocumentsDirectory();
    if (!kIsWeb) {
      store =
          IsarCacheStore('${appCacheDir.path}/${AppConstants.cacheFolderName}');
    } else {
      store = MemCacheStore(
        maxSize: 1024 * 1024 * 300, // 300MB
      );
    }
  }

  static const String baseUrl = 'https://api.quran.com/api/v4';

  static Dio get dioInstance {
    final options = CacheOptions(store: store);

    final dio = Dio(BaseOptions(baseUrl: baseUrl))
      ..interceptors.add(DioCacheInterceptor(options: options));

    return dio;
  }
}

final Dio dio = ApiUtils.dioInstance;
