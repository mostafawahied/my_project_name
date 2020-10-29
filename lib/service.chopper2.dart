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
  Future<Response<Groups>> login(String username, String password) {
    final $url = 'Account/TokenGenerate';
    final $headers = {'content-type': 'application/x-www-form-urlencoded'};
    final $body = <String, String>{'username': username, 'password': password};
    $body.removeWhere((key, value) => value == null);
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<Groups, Groups>($request);
  }
}
