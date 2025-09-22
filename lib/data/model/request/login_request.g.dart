// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest(
  user: User.fromJson(json['user'] as Map<String, dynamic>),
  entity: json['entity'] as String,
  type: json['type'] as String,
  queryParameterMap: json['queryParameterMap'] as Map<String, dynamic>,
  data: (json['data'] as List<dynamic>)
      .map((e) => DataItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  action: json['action'] as String,
);

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'user': instance.user,
      'entity': instance.entity,
      'type': instance.type,
      'queryParameterMap': instance.queryParameterMap,
      'data': instance.data,
      'action': instance.action,
    };
