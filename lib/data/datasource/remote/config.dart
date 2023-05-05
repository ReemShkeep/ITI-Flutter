import 'package:dio/dio.dart';

import 'constants.dart';

class Config {
  static Dio getdio() {
    Dio dio = Dio(BaseOptions(baseUrl: baseurl));
    dio.interceptors
        .add(LogInterceptor(responseBody: true, request: true, error: true));
    return dio;
  }
}
