import "dart:async";
import 'dart:core';

import 'package:chopper2/chopper2.dart';
import 'package:my_project_name/MyAddressResponseModel.dart';
import 'package:my_project_name/gender.dart';
import 'package:my_project_name/groups.dart';
//import 'package:flutter_toolbox/flutter_toolbox.dart';
//import 'package:http/http.dart' show MultipartFile;
import 'package:my_project_name/utils.dart';
import 'package:my_project_name/login/model/LoginResponse.dart';

part "service.chopper2.dart";

const baseUrl = "http://160.153.234.82:5000";

@ChopperApi()
abstract class BringiService extends ChopperService {
  static BringiService create([ChopperClient client]) =>
      _$BringiService(client);

//region user

  @Post(
      path: "Account/TokenGenerate",
      headers: {"content-type": "application/x-www-form-urlencoded"})
  Future<Response> login(
    @Body() Map<String, String> fields,
  );

  // @Post(path: "register")
  // Future<Response<CreateAccountResponse>> register(
  //   @Field("name") String name,
  //   @Field("fullname") String fullname,
  //   @Field("email") String email,
  //   @Field("gender") String gender,
  //   @Field("password") String password,
  //   @Field("c_password") String c_password,
  // );

  @Get(
      path: "Customer/CustomerAddresses/English",
      headers: {"content-type": "application/x-www-form-urlencoded"})
  Future<Response<MyAddressResponseModel>> getAdresses();

//endregion user

}

BringiService api() {
  var converter = JsonSerializableConverter({
    LoginResponse: LoginResponse.fromJsonFactory,
    MyAddressResponseModel: MyAddressResponseModel.fromJsonFactory,
    Groups: Groups.fromJsonFactory,
    Gender: Gender.fromJsonFactory,
    //CreateAccountResponse: CreateAccountResponse.fromJsonFactory,
    // App specific
  });

  final chopper = ChopperClient(
    baseUrl: '$baseUrl/api/',
    services: [BringiService.create()],
    converter: FormUrlEncodedConverter(),
    errorConverter: converter,
    interceptors: [
      authHeader,
      loggingInterceptors,
    ],
  );

  return BringiService.create(chopper);
}
