import 'dart:convert';

import 'package:food_order/controllers/auth/login.dart';
import 'package:food_order/models/cart.dart';
import 'package:food_order/utils/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CartServices {
  static final client = http.Client();
  static final LoginController loginController = Get.put(LoginController());

  static Future<List<Cart>> fetchCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await client.get(
      Uri.parse('$apiURL/api/cart'),
      headers: {
        'Authorization': '${prefs.getString('token')}',
        'Content-type': 'application/json; charset=utf-8'
      },
    );
    if (response.statusCode == 200) {
      final jsonString = response.body;
      return cartFromJson(jsonString);
    } else {
      return [];
    }
  }

  static Future<void> addToCart(String foodId, int quantity) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await client.post(
      Uri.parse('$apiURL/api/cart'),
      headers: {
        'Authorization': '${prefs.getString('token')}',
        'Content-type': 'application/json; charset=utf-8'
      },
      body: jsonEncode({'foodId': foodId, 'quantity': quantity}),
    );
  }

  static Future<void> removeFromCart(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await client.delete(
      Uri.parse('$apiURL/api/cart'),
      headers: {
        'Authorization': '${prefs.getString('token')}',
        'Content-type': 'application/json; charset=utf-8'
      },
      body: jsonEncode({'id': id}),
    );
  }
}
