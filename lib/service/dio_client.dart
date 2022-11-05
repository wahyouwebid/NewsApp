
import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';

class DioClient {

  Dio buildDioClient() {
    final dio = Dio()..options = BaseOptions(contentType: "application/json");
    dio.interceptors.addAll([
      DioLoggingInterceptor(
        level: Level.body,
        compact: false,
      )
    ]);

    return dio;
  }
}