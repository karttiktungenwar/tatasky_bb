import 'package:retrofit/retrofit.dart';

import 'package:dio/dio.dart';


part 'retrofit_client.g.dart';


@RestApi()
abstract class RetrofitClient {

  factory RetrofitClient(Dio dio, {String baseUrl}) = _RetrofitClient;

// Add other API calls here

}