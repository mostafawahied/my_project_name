library gender;

import 'package:json_annotation/json_annotation.dart';

part 'gender.g.dart';

@JsonSerializable()
class Gender {
  String AuthenticationToken;
  String RefreshToken;

  factory Gender.fromJson(Map<String, dynamic> json) => _$GenderFromJson(json);

  Map<String, dynamic> toJson() => _$GenderToJson(this);

  static const fromJsonFactory = _$GenderFromJson;

  Gender();

  @override
  String toString() {
    return 'Gender{authenticationToken: $AuthenticationToken, refreshToken: $RefreshToken}';
  }
}
