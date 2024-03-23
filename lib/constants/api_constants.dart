import 'package:dio/dio.dart';

class ApiConstants {
  static const String baseUrl = 'https://api.quran.com/api/v4';

  static Dio get dioInstance {
    final dio = Dio(BaseOptions(baseUrl: baseUrl));

    return dio;
  }
}

Dio dio = ApiConstants.dioInstance;
