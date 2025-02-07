// To parse this JSON data, do
//
//     final laginDataModel = laginDataModelFromJson(jsonString);

import 'dart:convert';

LoginDataModel laginDataModelFromJson(String str) =>
    LoginDataModel.fromJson(json.decode(str));

String laginDataModelToJson(LoginDataModel data) => json.encode(data.toJson());

class LoginDataModel {
  LoginDataModel({
    required this.username,
    required this.password,
  });

  String username;
  String password;

  factory LoginDataModel.fromJson(Map<String, dynamic> json) =>
      LoginDataModel(
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() =>
      {
        "username": username,
        "password": password,
      };
}
