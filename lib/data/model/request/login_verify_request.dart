import 'package:json_annotation/json_annotation.dart';
import '../../../core/model/user.dart';

part 'login_verify_request.g.dart';

@JsonSerializable()
class LoginVerifyRequest {
  final User user;
  final String entity;
  final String identifier;
  final String type;
  final LoginVerifyQueryParameterMap queryParameterMap;
  final List<LoginVerifyDataItem> data;
  final String action;

  LoginVerifyRequest({
    required this.user,
    required this.entity,
    required this.identifier,
    required this.type,
    required this.queryParameterMap,
    required this.data,
    required this.action,
  });

  factory LoginVerifyRequest.fromJson(Map<String, dynamic> json) {
    return LoginVerifyRequest(
      user: User.fromJson(json['user']),
      entity: json['entity'],
      identifier: json['identifier'],
      type: json['type'],
      queryParameterMap: LoginVerifyQueryParameterMap.fromJson(json['queryParameterMap']),
      data: (json['data'] as List)
          .map((item) => LoginVerifyDataItem.fromJson(item))
          .toList(),
      action: json['action'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'entity': entity,
      'identifier': identifier,
      'type': type,
      'queryParameterMap': queryParameterMap.toJson(),
      'data': data.map((item) => item.toJson()).toList(),
      'action': action,
    };
  }
}

class LoginVerifyQueryParameterMap {
  final String etopNo;
  final String otp;

  LoginVerifyQueryParameterMap({
    required this.etopNo,
    required this.otp,
  });

  factory LoginVerifyQueryParameterMap.fromJson(Map<String, dynamic> json) {
    return LoginVerifyQueryParameterMap(
      etopNo: json['etopNo'],
      otp: json['otp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'etopNo': etopNo,
      'otp': otp,
    };
  }
}

class LoginVerifyDataItem {
  final String mobileNumber;

  LoginVerifyDataItem({required this.mobileNumber});

  factory LoginVerifyDataItem.fromJson(Map<String, dynamic> json) {
    return LoginVerifyDataItem(
      mobileNumber: json['mobileNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mobileNumber': mobileNumber,
    };
  }
}