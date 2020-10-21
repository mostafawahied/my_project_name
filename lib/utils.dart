import 'package:my_project_name/Strings.dart';
import 'package:chopper2/chopper2.dart';
import 'package:flutter_toolbox/flutter_toolbox.dart';

typedef T JsonFactory<T>(Map<String, dynamic> json);

class JsonSerializableConverter extends JsonConverter {
  final Map<Type, JsonFactory> factories;

  JsonSerializableConverter(this.factories);

  T _decodeMap<T>(Map<String, dynamic> values) {
    /// Get jsonFactory using Type parameters
    /// if not found or invalid, throw error or return null
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! JsonFactory<T>) {
      /// throw serializer not found error;
      return null;
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(List values) =>
      values.where((v) => v != null).map<T>((v) => _decode<T>(v)).toList();

  dynamic _decode<T>(entity) {
    if (entity is Iterable) return _decodeList<T>(entity);

    if (entity is Map) return _decodeMap<T>(entity);

    return entity;
  }

  @override
  Response<ResultType> convertResponse<ResultType, Item>(Response response) {
    // use [JsonConverter] to decode json
    final jsonRes = super.convertResponse(response);

    return jsonRes.replace<ResultType>(body: _decode<Item>(jsonRes.body));
  }

  @override
  // all objects should implements toJson method
  Request convertRequest(Request request) => super.convertRequest(request);

  @override
  Response convertError<ResultType, Item>(Response response) {
    print('════════ Error ═══════════════════════════════════════════════════');
    var request = response.base.request;
    print("url = ${request.url}");
    print("statusCode = ${response.statusCode}");
//    print("headers = ${request.headers}");
    print("response.body = ${response.body}");
    print('══════════════════════════════════════════════════════════════════');

    // use [JsonConverter] to decode json
    final Response jsonRes = super.convertError(response);

    return jsonRes.replace<ErrorResponse>(
      body: ErrorResponse.fromJsonFactory(jsonRes.body),
    );
  }
}

// helper methods

bool httpLogging = true;

Future<Request> loggingInterceptors(Request request) async {
  if (httpLogging) {
    print("url = ${request.baseUrl}${request.url}");
    print("request.body = ${request.body}");
    if (request.parts.isNotEmpty)
      print(
          "request.parts = ${request.parts.map((p) => '${p.name}: ${p.value}').toList()}");
  }
  return request;
}

Future<Request> authHeader(Request request) async {
  if (request.url == "login" || request.url == "register")
    return applyHeader(request, "", "");

  var token = await Strings.getUserToken();
  if (token == null)
    return applyHeader(request, "", "");
  else
    return applyHeader(request, "Authorization", token);
}
