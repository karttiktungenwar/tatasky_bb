import 'package:json_annotation/json_annotation.dart';
import '../../../core/model/user.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
  final User user;
  final String entity;
  final String type;
  final Map<String, dynamic> queryParameterMap;
  final List<DataItem> data;
  final String action;

  LoginRequest({
    required this.user,
    required this.entity,
    required this.type,
    required this.queryParameterMap,
    required this.data,
    required this.action,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}

// Model class for items in the 'data' array

class DataItem {
  final String etopNo;
  DataItem({
    required this.etopNo,
  });

  factory DataItem.fromJson(Map<String, dynamic> json) {
    return DataItem(
      etopNo: json['etopNo'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'etopNo': etopNo,
    };
  }
}
