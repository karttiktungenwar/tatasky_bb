import 'package:json_annotation/json_annotation.dart';

part '../../../data/model/response/login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final List<Map<String, dynamic>> data;
  final String message;
  final String status;

  LoginResponse({
    required this.data,
    required this.message,
    required this.status,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}