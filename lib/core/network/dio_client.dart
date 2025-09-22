import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient() : dio = Dio() {
    dio.options.connectTimeout = Duration(milliseconds: 15000);
    dio.options.receiveTimeout = Duration(milliseconds: 15000);

    // Add interceptors if needed
    dio.interceptors.add(LogInterceptor(responseBody: true));
  }
}