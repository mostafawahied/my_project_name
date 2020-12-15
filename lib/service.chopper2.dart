// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$BringiService extends BringiService {
  _$BringiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = BringiService;

  @override
  Future<Response<dynamic>> login(String school_username,
      String student_username, String student_password) {
    final $url = 'student_view_api/login.php';
    final $headers = {'content-type': 'application/x-www-form-urlencoded'};
    final $body = <String, String>{
      'school_username': school_username,
      'student_username': student_username,
      'student_password': student_password
    };
    $body.removeWhere((key, value) => value == null);
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<String>> login2(String school_username,
      String student_username, String student_password) {
    final $url = 'student_view_api/login.php';
    final $body = <String, dynamic>{
      'school_username': school_username,
      'student_username': student_username,
      'student_password': student_password
    };
    $body.removeWhere((key, value) => value == null);
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<String, String>($request);
  }
}
