library groups;

import 'package:json_annotation/json_annotation.dart';
import 'package:my_project_name/gender.dart';

part 'groups.g.dart';

@JsonSerializable()
class Groups {
  Gender Result;
  String ResultCode;
  String Message;

  factory Groups.fromJson(Map<String, dynamic> json) => _$GroupsFromJson(json);

  Map<String, dynamic> toJson() => _$GroupsToJson(this);

  static const fromJsonFactory = _$GroupsFromJson;

  Groups();

  @override
  String toString() {
    return 'Groups{result: $Result, resultCode: $ResultCode, message: $Message}';
  }
}
