import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

class CacheUtil {
  /// Returns the name of the function as a string.
  static String _functionToString(Function fn) =>
      fn.toString().split('\'')[1].trim();

  /// Returns the cache file for the given request. If web, returns null.
  static String? getRequestCache(Function request) {
    final cacheKey = _functionToString(request);
    final cacheFile = kIsWeb ? null : File('${cacheDir.path}/$cacheKey.json');

    if (cacheFile != null && cacheFile.existsSync()) {
      return cacheFile.readAsStringSync();
    }

    return null;
  }

  /// Cache the request data. This doesn't work on web. The cache
  /// will stored on temp directory on the [request] function's name
  /// as file name.
  static void cacheRequest(Function request, Map data) {
    final cacheKey = _functionToString(request);
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
