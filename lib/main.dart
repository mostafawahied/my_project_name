import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_toolbox/flutter_toolbox.dart';
import 'package:my_project_name/service.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  String username = "Operator1";
  String password = "P@ssw0rd1";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                RaisedButton(
                  child: Text("Send"),
                  onPressed: () async {
                    final FormState form = formKey.currentState;
                    if (form.validate()) {
                      form.save();

                      // http.Response res = await http.post(
                      //   'https://tutorpal.thepeoplesfund.org.uk/student_view_api/login.php',
                      //   body: <String, String>{
                      //   'school_username': 'hach100',
                      //   'student_username': 'Nunez17',
                      //   'student_password': 'password72',
                      // },
                      // );
                      //
                      // d("res.body = ${res.body}");

                      var r =
                          await api().login("hach100", "Nunez17", "password72");
                      d("r = ${r.body}");

                      await safeRequest(
                        context,
                        api().login("hach100", "Nunez17", "password72"),
                        onSuccess: (result) {
                          print(result);
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
