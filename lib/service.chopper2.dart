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
  Future<Response<Groups>> login(Map<String, String> fields) {
    final $url = 'Account/TokenGenerate';
    final $body = fields;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Groups, Groups>($request, requestConverter: convertForm);
  }
}
