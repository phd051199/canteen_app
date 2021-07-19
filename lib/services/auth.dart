import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_order/controllers/auth/login.dart';
import 'package:food_order/models/login.dart';
import 'package:food_order/models/register.dart';
import 'package:food_order/screens/login.dart';
import 'package:food_order/screens/success.dart';
import 'package:food_order/utils/constants.dart';
import 'package:food_order/widgets/login/button.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
      Uri.parse('$apiURL/api/register'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        {
          "username": "$uname",
          "password": "$password",
          "email": "$email",
          "name": "$fname"
        },
      ),
    );
    final jsonString = registerFromJson(response.body);
    final res = jsonString;
    if (response.statusCode == 200) {
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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await client.post(Uri.parse('$apiURL/api/login'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({"user": "$username", "password": "$password"}));
    final jsonString = loginFromJson(response.body);
    final res = jsonString;
    if (response.statusCode == 200) {
      prefs.setString('token', res.token.toString());
      onSuccess();
    } else {
      onError(res.message);
    }
  }

  static Future logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    Get.offAll(() => LoginScreen());
  }

  static Future forgot(String email) async {
    final response = await client.post(Uri.parse('$apiURL/api/password/send'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({"email": "$email"}));
    if (response.statusCode == 200) {
      Get.offAll(
        () => SuccessScreen(
          title: 'Send link success 🎉',
          content: 'Check your email to reset password',
          successBtn: AuthButton(
            btnLabel: 'Back to Sign In',
            onPressed: () {
              Get.offAll(() => LoginScreen());
            },
            btnColor: Colors.green,
            textColor: Colors.white,
          ),
        ),
      );
    } else {
      Get.offAll(
        () => SuccessScreen(
          title: 'Something went wrong',
          content: 'This email is not exist',
          successBtn: AuthButton(
            btnLabel: 'Back',
            onPressed: () {
              Get.offAll(() => LoginScreen());
            },
            btnColor: secondaryBGColor,
            textColor: Colors.white,
          ),
        ),
      );
    }
  }
}
