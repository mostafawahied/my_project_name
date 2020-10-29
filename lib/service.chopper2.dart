// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$BringiService extends BringiService {
  _$BringiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = BringiService;

  Future<Response> login(Map<String, String> fields) {
    final $url = 'Account/TokenGenerate';
    final $headers = {'content-type': 'application/x-www-form-urlencoded'};
    final $body = fields;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response<MyAddressResponseModel>> getAdresses() {
    final $url = 'Customer/CustomerAddresses/English';
    final $headers = {'content-type': 'application/x-www-form-urlencoded'};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client
        .send<MyAddressResponseModel, MyAddressResponseModel>($request);
  }
}
