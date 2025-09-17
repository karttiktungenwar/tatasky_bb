import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient() : dio = Dio() {
    dio.options.connectTimeout = 15000 as Duration?;
    dio.options.receiveTimeout = 15000 as Duration?;

    // Add interceptors if needed
    dio.interceptors.add(LogInterceptor(responseBody: true));
  }
}