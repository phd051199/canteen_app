// To parse this JSON data, do
//
//     final register = registerFromJson(jsonString);

import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
  Register({
    this.username,
    this.password,
    this.email,
    this.fullName,
    this.id,
    this.statusCode,
    this.message,
    this.error,
  });

  String? username;
  String? password;
  String? email;
  String? fullName;
  int? id;
  int? statusCode;
  String? message;
  String? error;

  factory Register.fromJson(Map<String, dynamic> json) => Register(
        username: json["username"],
        password: json["password"],
        email: json["email"],
        fullName: json["fullName"],
        id: json["id"],
        statusCode: json["statusCode"],
        message: json["message"],
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "email": email,
        "fullName": fullName,
        "id": id,
        "statusCode": statusCode,
        "message": message,
        "error": error,
      };
}
