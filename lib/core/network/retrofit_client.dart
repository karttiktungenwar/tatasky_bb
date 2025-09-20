import 'package:retrofit/retrofit.dart';

import 'package:dio/dio.dart';

import '../../data/model/request/login_request.dart';
import '../../data/model/response/login_response.dart';


part 'retrofit_client.g.dart';


@RestApi()
abstract class RetrofitClient {

  factory RetrofitClient(Dio dio, {String baseUrl}) = _RetrofitClient;

  // Add other API calls here
  @POST("/tatasky-boradband-integration-server-preprod-rmn-olt-verbiage/api/")
  Future<LoginResponse> getLogin(@Body() LoginRequest request);

}