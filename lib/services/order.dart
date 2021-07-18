import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_order/controllers/auth/login.dart';
import 'package:food_order/screens/home.dart';
import 'package:food_order/screens/success.dart';
import 'package:food_order/utils/constants.dart';
import 'package:food_order/widgets/login/button.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class OrderServices {
  static final client = http.Client();
  static final LoginController loginController = Get.put(LoginController());

  static Future<void> order(
      int tableId, int total, dynamic orderDetails) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await client.post(
      Uri.parse('$apiURL/api/order'),
      headers: {
        'Authorization': '${prefs.getString('token')}',
        'Content-type': 'application/json; charset=utf-8'
      },
      body: jsonEncode(
        {
          "tableId": tableId,
          "total": total,
          "orderDetails": orderDetails,
        },
      ),
    );
    if (response.statusCode == 200) {
      Get.offAll(
        () => SuccessScreen(
          title: 'Đặt hàng thành công',
          content: 'Đơn hàng của bạn đang được xử lý, vui lòng chờ',
          successBtn: AuthButton(
            btnLabel: 'Trở về trang chủ',
            onPressed: () {
              Get.offAll(() => HomeScreen());
            },
            btnColor: secondaryBGColor,
            textColor: Colors.white,
          ),
        ),
      );
    } else {
      Get.offAll(
        () => SuccessScreen(
          title: 'Something went wrong',
          content: 'This email is not exist',
        ),
      );
    }
  }
}
