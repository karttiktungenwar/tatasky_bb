import 'package:json_annotation/json_annotation.dart';
part 'login_verify_response.g.dart';

@JsonSerializable()
class LoginVerifyResponse{
  final List<DataLoginVerify> data;
  final String message;
  final String status;

  LoginVerifyResponse({
    required this.data,
    required this.message,
    required this.status,
  });


  factory LoginVerifyResponse.fromJson(Map<String, dynamic> json) {
    return LoginVerifyResponse(
      data: (json['data'] as List)
          .map((item) => DataLoginVerify.fromJson(item))
          .toList(),
      message: json['message'],
      status: json['status'],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'data': data.map((item) => item.toJson()).toList(),
      'message': message,
      'status': status,
    };

  }

}


class DataLoginVerify {
  final String skipflag;
  final String role;
  final String city;
  final String lsqUser_id;
  final String dealercode;
  final String name;
  final String state;
  final String dsacode;
  final String foscode;

  DataLoginVerify({
    required this.skipflag,
    required this.role,
    required this.city,
    required this.lsqUser_id,
    required this.dealercode,
    required this.name,
    required this.state,
    required this.dsacode,
    required this.foscode,
  });


  factory DataLoginVerify.fromJson(Map<String, dynamic> json) {
    return DataLoginVerify(
      skipflag: json['skipflag'],
      role: json['role'],
      city: json['city'],
      lsqUser_id: json['lsqUser Id'],
      dealercode: json['dealercode'],
      name: json['name'],
      state: json['state'],
      dsacode: json['dsacode'],
      foscode: json['foscode'],
    );

  }


  Map<String, dynamic> toJson() {
    return {
      'skipflag': skipflag,
      'role': role,
      'city': city,
      'lsqUser Id': lsqUser_id,
      'dealercode': dealercode,
      'name': name,
      'state': state,
      'dsacode': dsacode,
      'foscode': foscode,
    };
  }
}