// GENERATED CODE - DO NOT MODIFY BY HAND

part of LoginResponse;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return LoginResponse(
    status: json['status'],
  )
    ..ResultCode = json['ResultCode']?.toString()
    ..Message = json['Message']?.toString()
    ..result = json['result'] == null
        ? null
        : LoginResult.fromJson(json['result'] as Map<String, dynamic>);
}

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'ResultCode': instance.ResultCode,
      'Message': instance.Message,
      'status': instance.status,
      'result': instance.result,
    };

LoginResult _$LoginResultFromJson(Map<String, dynamic> json) {
  return LoginResult(
    authenticationToken: json['authenticationToken']?.toString(),
    refreshToken: json['refreshToken']?.toString(),
  );
}

Map<String, dynamic> _$LoginResultToJson(LoginResult instance) =>
    <String, dynamic>{
      'authenticationToken': instance.authenticationToken,
      'refreshToken': instance.refreshToken,
    };
