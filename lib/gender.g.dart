// GENERATED CODE - DO NOT MODIFY BY HAND

part of gender;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Gender _$GenderFromJson(Map<String, dynamic> json) {
  return Gender()
    ..AuthenticationToken = json['AuthenticationToken']?.toString()
    ..RefreshToken = json['RefreshToken']?.toString();
}

Map<String, dynamic> _$GenderToJson(Gender instance) => <String, dynamic>{
      'AuthenticationToken': instance.AuthenticationToken,
      'RefreshToken': instance.RefreshToken,
    };
