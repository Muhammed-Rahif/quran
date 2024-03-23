import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

class CacheUtil {
  /// Returns the cache file for the given request. If web, returns null.
  static String? getRequestCache(String cacheKey) {
    final cacheFile = kIsWeb ? null : File('${cacheDir.path}/$cacheKey.json');

    if (cacheFile != null && cacheFile.existsSync()) {
      return cacheFile.readAsStringSync();
    }

    return null;
  }

  /// Cache the request data. This doesn't work on web. The cache
  /// will stored in the system's temporary directory as the cache key
  /// to be the file name.
  static void cacheRequest(String cacheKey, Map data) {
    final cacheFile = kIsWeb ? null : File('${cacheDir.path}/$cacheKey.json');

    if (cacheFile != null) {
      cacheFile.writeAsStringSync(jsonEncode(data));
    }
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
