import 'dart:convert';

import 'package:food_order/controllers/auth/login.dart';
import 'package:food_order/models/login.dart';
import 'package:food_order/models/register.dart';
import 'package:food_order/utils/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  static final client = http.Client();
  static LoginController loginController = Get.put(LoginController());

  static Future register(
    String uname,
    String fname,
    String email,
    String password,
    Function onSuccess,
    Function onError,
  ) async {
    final response = await client.post(
      Uri.parse('$apiURL/register'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        {
          "username": "$uname",
          "password": "$password",
          "email": "$email",
          "fullName": "$fname"
        },
      ),
    );
    final jsonString = registerFromJson(response.body);
    final res = jsonString;
    if (response.statusCode == 201) {
      onSuccess();
    } else {
      onError(res.message);
    }
  }

  static Future login(
    String username,
    String password,
    Function onSuccess,
    Function onError,
  ) async {
    final response = await client.post(Uri.parse('$apiURL/login'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({"username": "$username", "password": "$password"}));
    final jsonString = loginFromJson(response.body);
    final res = jsonString;
    if (response.statusCode == 201) {
      loginController.currentUser(
        jsonDecode(
          ascii.decode(
            base64.decode(
              base64.normalize(res.token!.split(".")[1]),
            ),
          ),
        )['fname'],
      );
      loginController.jwt(res.token);
      onSuccess();
    } else {
      onError(res.message);
    }
  }
}
