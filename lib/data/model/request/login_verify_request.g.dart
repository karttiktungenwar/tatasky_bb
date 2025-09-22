// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_verify_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginVerifyRequest _$LoginVerifyRequestFromJson(Map<String, dynamic> json) =>
    LoginVerifyRequest(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      entity: json['entity'] as String,
      identifier: json['identifier'] as String,
      type: json['type'] as String,
      queryParameterMap: LoginVerifyQueryParameterMap.fromJson(
        json['queryParameterMap'] as Map<String, dynamic>,
      ),
      data: (json['data'] as List<dynamic>)
          .map((e) => LoginVerifyDataItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      action: json['action'] as String,
    );

Map<String, dynamic> _$LoginVerifyRequestToJson(LoginVerifyRequest instance) =>
    <String, dynamic>{
      'user': instance.user,
      'entity': instance.entity,
      'identifier': instance.identifier,
      'type': instance.type,
      'queryParameterMap': instance.queryParameterMap,
      'data': instance.data,
      'action': instance.action,
    };
