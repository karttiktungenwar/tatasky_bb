// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_verify_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginVerifyResponse _$LoginVerifyResponseFromJson(Map<String, dynamic> json) =>
    LoginVerifyResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => DataLoginVerify.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$LoginVerifyResponseToJson(
  LoginVerifyResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'message': instance.message,
  'status': instance.status,
};
