// GENERATED CODE - DO NOT MODIFY BY HAND

part of groups;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Groups _$GroupsFromJson(Map<String, dynamic> json) {
  return Groups()
    ..Result = json['Result'] == null
        ? null
        : Gender.fromJson(json['Result'] as Map<String, dynamic>)
    ..ResultCode = json['ResultCode']?.toString()
    ..Message = json['Message']?.toString();
}

Map<String, dynamic> _$GroupsToJson(Groups instance) => <String, dynamic>{
      'Result': instance.Result,
      'ResultCode': instance.ResultCode,
      'Message': instance.Message,
    };
