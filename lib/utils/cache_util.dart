import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class CacheUtil {
  /// Returns the cache file for the given key. If web, returns null.
  static Future<String?> getCache(String cacheKey) async {
    final cacheFile =
        kIsWeb ? null : File('${(await cacheDir).path}/$cacheKey.json');

    if (cacheFile != null && cacheFile.existsSync()) {
      return cacheFile.readAsStringSync();
    }

    return null;
  }

  /// Cache the passed data. This doesn't work on web. The cache
  /// will stored in the system's external storage directory
  /// as the cache key to be the file name.
  static void setCache(String cacheKey, Map data) async {
    final cacheFile =
        kIsWeb ? null : File('${(await cacheDir).path}/$cacheKey.json');

    if (cacheFile != null) {
      cacheFile.writeAsStringSync(jsonEncode(data));
    }
  }

  static Future<Directory> get cacheDir async {
    final Directory docsDir = await getApplicationDocumentsDirectory();
    final Directory cacheDir = Directory('${docsDir.path}/quran-app-cache');
    if (!cacheDir.existsSync()) {
      cacheDir.createSync();
    }

    return cacheDir;
  }
}
