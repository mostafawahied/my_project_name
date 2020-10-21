library LoginResponse;

import 'package:my_project_name/BaseApiResponse.dart';
import 'package:json_annotation/json_annotation.dart';

part 'LoginResponse.g.dart';

@JsonSerializable()
class LoginResponse extends BaseApiResponse {
  LoginResult result;

  LoginResponse({status, message, resultCode})
      : super(status, message, resultCode);

  LoginResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    result = json['Result'] != null
        ? new LoginResult.fromJson(json['Result'])
        : null;
  }

  static const fromJsonFactory = _$LoginResponseFromJson;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['Result'] = this.result.toJson();
    }
    return data;
  }
}

@JsonSerializable()
class LoginResult {
  String authenticationToken;
  String refreshToken;

  LoginResult({this.authenticationToken, this.refreshToken});

  LoginResult.fromJson(Map<String, dynamic> json) {
    authenticationToken = json['AuthenticationToken'];
    refreshToken = json['RefreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AuthenticationToken'] = this.authenticationToken;
    data['RefreshToken'] = this.refreshToken;
    return data;
  }
}
