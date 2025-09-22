import '../../core/network/retrofit_client.dart';
import '../../core/use_case/client_service.dart';
import '../model/request/login_request.dart';
import '../model/response/login_response.dart';

class APIService{
  final RetrofitClient _retrofitClient;
  APIService(this._retrofitClient);

  /// Sends OTP using the provided userNumber

  Future<LoginResponse> sendOtp(String userNumber) async {
    try {
      // Get User from ClientService (includes device/platform info)
      final user = await ClientService.getClient(userNumber);
      // Build full LoginRequest
      final request = LoginRequest(
        user: user,
        entity: "generateOTP",
        type: "transaction",
        queryParameterMap: {}, // Empty map as per your JSON
        data: [
          DataItem(etopNo: userNumber), // Assuming DataItem model exists
        ],
        action: "get",
      );


      // Call Retrofit API
      final response = await _retrofitClient.getLogin(request);
      // Basic validation (extend as needed)
      if (response.status != 'SUCCESS') {
        throw Exception('API Error: ${response.message}');
      }
      return response;
    } catch (e) {
      // Re-throw with context or handle logging
      throw Exception('Failed to send OTP: $e');
    }
  }
}