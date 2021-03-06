import "dart:async";
import 'dart:core';

import 'package:chopper2/chopper2.dart';
import 'package:my_project_name/gender.dart';
import 'package:my_project_name/groups.dart';
import 'package:my_project_name/utils.dart';
import 'package:my_project_name/login/model/LoginResponse.dart';

part "service.chopper2.dart";

const baseUrl = "https://tutorpal.thepeoplesfund.org.uk";

@ChopperApi()
abstract class BringiService extends ChopperService {
  static BringiService create([ChopperClient client]) =>
      _$BringiService(client);

//region user

  @Post(
    path: "student_view_api/login.php",
    headers: {contentTypeKey: formEncodedHeaders},
  )
  Future<Response> login(
    @Field("school_username") String school_username,
    @Field("student_username") String student_username,
    @Field("student_password") String student_password,
  );

  @Post(
    path: "student_view_api/login.php",
  )
  Future<Response<String>> login2(
    @Field("school_username") String school_username,
    @Field("student_username") String student_username,
    @Field("student_password") String student_password,
  );
// @Post(
//   path: "Account/TokenGenerate",
//   headers: {contentTypeKey: formEncodedHeaders},
// )
// Future<Response<Groups>> login(
//   @Field("username") String username,
//   @Field("password") String password,
// );

// @Post(path: "register")
// Future<Response<CreateAccountResponse>> register(
//   @Field("name") String name,
//   @Field("fullname") String fullname,
//   @Field("email") String email,
//   @Field("gender") String gender,
//   @Field("password") String password,
//   @Field("c_password") String c_password,
// );

//endregion user

}

BringiService api() {
  var converter = JsonSerializableConverter({
    LoginResponse: LoginResponse.fromJsonFactory,
    Groups: Groups.fromJsonFactory,
    Gender: Gender.fromJsonFactory,
    //CreateAccountResponse: CreateAccountResponse.fromJsonFactory,
    // App specific
  });

  final chopper = ChopperClient(
    baseUrl: '$baseUrl/',
    services: [BringiService.create()],
    converter: converter,
    errorConverter: converter,
    interceptors: [
      authHeader,
      loggingInterceptors,
    ],
  );

  return BringiService.create(chopper);
}
