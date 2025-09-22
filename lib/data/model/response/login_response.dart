import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final String status;
  final String message;
  final List<DataLogin> data;

  LoginResponse({
    required this.status,
    required this.message,
    required this.data
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'] as String,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((item) => DataLogin.fromJson(item as Map<String, dynamic>))
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}

class DataLogin {
  final String resendTimer;
  final String dsaCode;

  DataLogin({
    required this.resendTimer,
    required this.dsaCode,
  });

  factory DataLogin.fromJson(Map<String, dynamic> json) {
    return DataLogin(
      resendTimer: json['resend_timer'] as String,
      dsaCode: json['dsacode'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'resend_timer': resendTimer,
      'dsacode': dsaCode,
    };
  }
}